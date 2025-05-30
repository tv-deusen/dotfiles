function ollama_query --description "Ask Ollama"
    ### 1. Configuration Section (Top of Script) ###
    set -l default_model gemma3 # <-- Default model can be changed here
    set -l use_streaming true # <-- Toggle streaming responses
    set -l context_file ~/.ollama_context.json
    set -l temp_file /tmp/ollama_response.txt

    ### 2. Dependency Checks (Early Exit) ###
    if not command -q jq
        echo "Error: jq is required - install with 'sudo apt install jq'" >&2
        return 1
    end

    if not command -q rofi && not command -q fzf
        echo "Error: Need either rofi or fzf for input" >&2
        return 1
    end

    ### 3. Service Availability Check ###
    if not curl -s http://localhost:11434/api/tags >/dev/null
        echo "Ollama service unavailable - check docker container!" >&2
        return 1
    end

    ### 4. Model Selection Enhancement ###
    set -l models (curl -s http://localhost:11434/api/tags | jq -r '.models[].name')
    if test (count $models) -gt 1
        set model (printf "%s\n" $models | rofi -dmenu -p "Select model" || echo $default_model)
    else
        set model $default_model
    end

    ### 5. Input Handling ###
    set query (rofi -dmenu -p "Ask $model" || fzf --prompt="Ask $model: ")
    if test -z "$query"
        return 0
    end

    ### 6. Context Management ###
    if not test -f $context_file
        echo '[]' >$context_file
    end
    set -l context (cat $context_file)

    ### 7. Streaming vs Non-Streaming Response Handling ###
    if $use_streaming
        # Streaming version with live output
        echo "" >$temp_file # Initialize temp file
        curl -s http://localhost:11434/api/generate \
            -H "Content-Type: application/json" \
            -d '{
              "model": "'$model'",
              "prompt": "'(string escape $query)'",
              "context": '$context',
              "stream": true
          }' | while read -l line
            set -l response (echo $line | jq -r '.response')
            set -l final (echo $line | jq -r '.done')

            # Append to temp file and display incrementally
            if test -n "$response"
                printf "%s" "$response" >>$temp_file
                printf "%s" "$response"
            end

            # Final context capture
            if test "$final" = true
                set -l new_context (echo $line | jq '.context')
                echo $new_context >$context_file
            end
        end
    else
        # Non-streaming version
        set -l response (curl -s http://localhost:11434/api/generate \
          -H "Content-Type: application/json" \
          -d '{
              "model": "'$model'",
              "prompt": "'(string escape $query)'",
              "context": '$context',
              "stream": false
          }')

        set -l answer (echo $response | jq -r '.response')
        echo -e "\nOllama Response:\n$answer"

        # Update context
        set -l new_context (echo $response | jq '.context')
        echo $new_context >$context_file
    end

    ### 8. Optional: Post-Processing ###
    # Uncomment to automatically copy response to clipboard
    # echo $answer | xclip -selection clipboard

    # Uncomment to open response in editor
    # if test -f $temp_file
    #     nvim $temp_file
    # end
end

set -x MODEL gemma3

function ollama_prompt
    # Read stdin
    read -l -P "🦙 Ollama> " user_input
    # No input...
    if test -z "$user_input"
        return
    end

    # Send prompt to ollama and display response
    echo "$user_input" | ollama run $MODEL
end

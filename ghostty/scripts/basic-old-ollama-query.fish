#!/usr/bin/fish

# Capture input using rofi or fzf (choose one)
set query (rofi -dmenu -p "Ask Ollama" || fzf --prompt="Ask Ollama: ")

# Check if query is empty
if test -z "$query"
    exit 0
end

# Set context file location
set -l context_file ~/.ollama_context.json

# Initialize context if missing
if not test -f $context_file
    echo '[]' >$context_file
end

# Get existing context
set -l context (cat $context_file)

# Make API request
set -l response (curl -s http://localhost:11434/api/generate \
    -H "Content-Type: application/json" \
    -d '{
        "model": "llama2",
        "prompt": "'(string escape $query)'",
        "context": '$context',
        "stream": false
    }')

# Parse and display response
set -l answer (echo $response | jq -r '.response')
echo -e "\nOllama Response:\n$answer"

# Update context if new context exists
set -l new_context (echo $response | jq '.context')
if test -n "$new_context"
    echo $new_context >$context_file
end

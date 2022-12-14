function ai() {

  OPENAI_API_KEY=XXXXXXXX # your OpenAI API key

  TEXT=$(echo "$*"| sed 's,.*,\x1B[32m&\x1B[0m,')

  RESULT=$(curl https://api.openai.com/v1/completions -s -H 'Content-Type: application/json'   -H "Authorization: Bearer $OPENAI_API_KEY"   -d "{ \"model\": \"text-davinci-003\", \"prompt\": \"$*\", \"max_tokens\": 4000, \"temperature\": 1.0}"    --insecure | jq '.choices[]'.text |sed 's/.//'|sed 's/.$//'| sed 's/\\n/\n/g'|sed 's/\\//g'| sed 's,.*,\x1B[33m&\x1B[0m,')

  echo "$TEXT$RESULT"

}
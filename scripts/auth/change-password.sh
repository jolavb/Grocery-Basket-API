#!/bin/bash
TOKEN = 'BAhJIiU4Yjk4YzY1MzE4YTczYzBiNGJiYTRkZGI2ZTViYTFjNAY6BkVG--da3ebfe5fa512e357f66843b6a768c90368b57c1'
API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/change-password"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo

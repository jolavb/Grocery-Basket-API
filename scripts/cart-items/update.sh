TOKEN='BAhJIiU4Yjk4YzY1MzE4YTczYzBiNGJiYTRkZGI2ZTViYTFjNAY6BkVG--da3ebfe5fa512e357f66843b6a768c90368b57c1'
QUANT=5
ID=433

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/cart_items/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart_item": {
      "quantity" : "'" ${QUANT}"'"
    }
  }'

echo

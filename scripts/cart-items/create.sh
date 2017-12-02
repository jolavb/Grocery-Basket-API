TOKEN='BAhJIiU4Yjk4YzY1MzE4YTczYzBiNGJiYTRkZGI2ZTViYTFjNAY6BkVG--da3ebfe5fa512e357f66843b6a768c90368b57c1'
ID=6
ITEM=2945

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/cart_items/"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cart_item": {
      "user_id" : "'" ${ID}"'",
      "item_id": "'"${ITEM}"'"
    }
  }'

echo

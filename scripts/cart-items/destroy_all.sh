TOKEN='BAhJIiU4Yjk4YzY1MzE4YTczYzBiNGJiYTRkZGI2ZTViYTFjNAY6BkVG--da3ebfe5fa512e357f66843b6a768c90368b57c1'

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/cart_items_clear/"
curl "${API}${URL_PATH}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \

echo

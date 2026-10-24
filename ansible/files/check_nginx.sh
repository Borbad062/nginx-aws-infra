#!/bin/bash

URL="http://127.0.0.1/"
LOG_FILE="/home/ubuntu/nginx_status.log"
HTTP_CODE="$(curl -sS -o /dev/null \
  --connect-timeout 5 \
  --max-time 10 \
  -w '%{http_code}' "$URL" 2>/dev/null)" || HTTP_CODE="000"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

if [ "$HTTP_CODE" = 200 ]; then
    echo "$TIMESTAMP - SUCCESS: Page is available (HTTP $HTTP_CODE)" >> "$LOG_FILE"
else
    echo "$TIMESTAMP - FAILURE: Page is NOT available (HTTP $HTTP_CODE)" >> "$LOG_FILE"
fi
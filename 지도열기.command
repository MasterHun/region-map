#!/bin/bash
# 더블클릭하면 지역명 암기 지도를 브라우저로 엽니다.
cd "$(dirname "$0")"
PORT=8765

# 이미 서버가 켜져 있으면 브라우저만 엽니다.
if ! lsof -iTCP:$PORT -sTCP:LISTEN >/dev/null 2>&1; then
  python3 -m http.server $PORT --bind 127.0.0.1 >/dev/null 2>&1 &
  sleep 1
fi

open "http://localhost:$PORT"
echo "지도가 열렸어요. 이 창은 닫아도 됩니다 (서버는 계속 켜져 있어요)."

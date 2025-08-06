#!/system/bin/sh

APP_LIST_FILE="/data/adb/modules/lowprioritylock/priority_list.txt"
LOG_FILE="/data/adb/modules/lowprioritylock/renice.log"
LOG_CONTROL="/data/adb/modules/lowprioritylock/log_control.prop"

# Default: logging off
if [ ! -f "$LOG_CONTROL" ]; then
  echo "off" > "$LOG_CONTROL"
fi

log_mode=$(cat "$LOG_CONTROL")

log_once=false
if [ "$log_mode" = "on" ]; then
  echo "[INFO] Renice started at $(date)" > "$LOG_FILE"
  log_once=true
fi

while true; do
  while IFS= read -r pkg; do
    pid=$(pidof "$pkg")
    if [ -n "$pid" ]; then
      renice -n 19 -p $pid >/dev/null 2>&1
      [ "$log_mode" = "on" ] && echo "[OK] Reniced $pkg (PID: $pid)" >> "$LOG_FILE"
    else
      [ "$log_mode" = "on" ] && echo "[SKIP] $pkg not running" >> "$LOG_FILE"
    fi
  done < "$APP_LIST_FILE"

  [ "$log_once" = true ] && log_mode="off"
  [ "$log_once" = true ] && echo "off" > "$LOG_CONTROL"
  sleep 120
done

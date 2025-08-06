#!/system/bin/sh
MODDIR=${0%/*}
APPLIST="$MODDIR/applist.txt"
CONFIG_FILE="$MODDIR/config.prop"
LOGFILE="$MODDIR/log.txt"
LOOP_INTERVAL=120

# Load logging preference
if [ -f "$CONFIG_FILE" ]; then
    . "$CONFIG_FILE"
fi

log() {
    [ "$LOG_MODE" = "on" ] && echo "$1" >> "$LOGFILE"
}

renice_pass() {
    log "[INFO] Renice pass started at $(date)"
    while read -r pkg; do
        [ -z "$pkg" ] && continue
        pid=$(pidof "$pkg")
        if [ -n "$pid" ]; then
            renice 19 -p $pid >/dev/null 2>&1
            log "[OK] Reniced $pkg (PID: $pid)"
        else
            log "[SKIP] $pkg not running"
        fi
    done < "$APPLIST"
    log "[PASS DONE]"
}

if [ "$1" = "once" ]; then
    renice_pass
    exit 0
fi

# Loop forever
while true; do
    renice_pass
    sleep $LOOP_INTERVAL
done

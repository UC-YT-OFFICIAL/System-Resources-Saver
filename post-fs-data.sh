#!/system/bin/sh
MODDIR=${0%/*}
CONFIG_FILE="$MODDIR/config.prop"
SERVICE_SCRIPT="$MODDIR/service.sh"

# Read log mode from config.prop
if [ -f "$CONFIG_FILE" ]; then
    . "$CONFIG_FILE"
fi

# Run the main script once at boot if logging is on
if [ "$LOG_MODE" = "on" ]; then
    sh "$SERVICE_SCRIPT" once
fi

# Start background loop
sh "$SERVICE_SCRIPT" &

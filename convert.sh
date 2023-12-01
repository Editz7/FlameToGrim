#!/bin/bash

ORIGINAL_SCRIPT_PATH="zipline.sh"
NEW_SCRIPT_PATH="$HOME/Downloads/screenshot.sh"

AUTH_HEADER=$(grep -oP 'authorization: \K[^ ]+' "$ORIGINAL_SCRIPT_PATH")
UPLOAD_URL=$(grep -oP 'https://\K[^ ]+' "$ORIGINAL_SCRIPT_PATH")

cat > "$NEW_SCRIPT_PATH" <<EOF
#!/bin/bash
TMP_DIR="/tmp"
NAME="screenshot_\$(date +%d%m%Y_%H%M%S).png"
FILE_PATH="\$TMP_DIR/\$NAME"

grim "\$FILE_PATH"
notify-send "Temporary Screenshot created"

if [ -f "\$FILE_PATH" ]; then
    UPLOAD_URL=\$(curl -H "authorization: $AUTH_HEADER https://$UPLOAD_URL -F file=@"\$FILE_PATH" -H "Content-Type: multipart/form-data" | jq -r '.files[0]')
    if [ -n "\$UPLOAD_URL" ]; then
        echo "\$UPLOAD_URL" | wl-copy
        notify-send "Screenshot uploaded" "URL copied to clipboard"
    else
        notify-send "Error" "Failed to upload screenshot."
    fi
    # Delete the temporary screenshot
    rm "\$FILE_PATH"
else
    notify-send "Error" "Screenshot not found."
fi
EOF

chmod +x "$NEW_SCRIPT_PATH"

echo "Hyprland-compatible temporary screenshot script created at $NEW_SCRIPT_PATH"

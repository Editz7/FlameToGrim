# Hyprland Screenshot Tool

## Description

This repository contains a script for taking and uploading screenshots in a Hyprland environment. The script is designed to capture fullscreen screenshots, upload them to a specified server, and then delete the local copy, making the screenshot process quick and efficient.

## Features

- **Fullscreen Capture**: Captures the entire screen seamlessly.
- **Temporary Local Storage**: Saves screenshots temporarily in the `/tmp` directory.
- **Automatic Upload**: Uploads screenshots to a predefined server.
- **Clipboard URL**: Copies the URL of the uploaded screenshot to the clipboard.
- **Clean Up**: Deletes the local screenshot file after upload.

## Requirements

- `grim`: For capturing screenshots.
- `curl`: For uploading screenshots.
- `jq`: For parsing the upload server's response.
- `wl-copy`: For copying the URL to the clipboard (Wayland).
- `notify-send`: For desktop notifications.

## Installation

Download the Flameshot Script (zipline.sh):

Ensure you download the zipline.sh script, which is initially set up for Flameshot. This script will be converted for use with Hyprland.

Clone the repository:

```bash
git clone [https://github.com/Editz7/FlameToGrim]
```

Navigate to the downloaded directory:

```bash
cd FlameToGrim
```

Make the script executable:

```bash
chmod +x screenshot.sh
```

## Usage

Run the script:

```bash
./hyprland_screenshot_temp.sh
```

The script will take a fullscreen screenshot, upload it, copy the upload URL to the clipboard, and then delete the local copy of the screenshot.

## Contribution

Contributions are welcome. Please fork the repository and submit a pull request with your changes.

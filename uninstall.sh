#!/bin/bash

# === CONFIG ===
BIN_NAME="jamf-ddm-sofa"
INSTALL_PATH="/usr/local/bin"
MAN_PATH="/usr/local/share/man/man1"

# === FUNCTIONS ===
function check_root() {
    if [[ "$EUID" -ne 0 ]]; then
        echo "❌ Please run this uninstaller with sudo:"
        echo "   sudo $0"
        exit 1
    fi
}

function uninstall_cli() {
    if [[ -f "$INSTALL_PATH/$BIN_NAME" ]]; then
        echo "🧹 Removing CLI from $INSTALL_PATH"
        rm -f "$INSTALL_PATH/$BIN_NAME"
    else
        echo "ℹ️  No CLI binary found at $INSTALL_PATH/$BIN_NAME"
    fi
}

function uninstall_man_page() {
    if [[ -f "$MAN_PATH/$BIN_NAME.1" ]]; then
        echo "🧹 Removing man page from $MAN_PATH"
        rm -f "$MAN_PATH/$BIN_NAME.1"
        echo "🔄 Updating man database..."
        mandb >/dev/null 2>&1 || echo "ℹ️  mandb not found or failed, man page index may be stale."
    else
        echo "ℹ️  No man page found at $MAN_PATH/$BIN_NAME.1"
    fi
}

function confirm_removal() {
    echo "✅ $BIN_NAME uninstalled."
}

# === MAIN ===
check_root
uninstall_cli
uninstall_man_page
confirm_removal

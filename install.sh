#!/bin/bash

# === CONFIG ===
BIN_NAME="jamf-ddm-sofa"
INSTALL_PATH="/usr/local/bin"
MAN_PATH="/usr/local/share/man/man1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# === FUNCTIONS ===
function check_root() {
    if [[ "$EUID" -ne 0 ]]; then
        echo "❌ Please run this installer with sudo:"
        echo "   sudo $0"
        exit 1
    fi
}

function install_cli() {
    echo "📦 Installing $BIN_NAME to $INSTALL_PATH"
    install -m 755 "$SCRIPT_DIR/bin/$BIN_NAME" "$INSTALL_PATH/$BIN_NAME" || {
        echo "❌ Failed to install CLI to $INSTALL_PATH"
        exit 1
    }
}

function install_man_page() {
    echo "📘 Installing man page to $MAN_PATH"
    mkdir -p "$MAN_PATH"
    install -m 644 "$SCRIPT_DIR/man/$BIN_NAME.1" "$MAN_PATH/$BIN_NAME.1" || {
        echo "❌ Failed to install man page to $MAN_PATH"
        exit 1
    }
    echo "🔄 Updating man database (may require sudo)..."
    mandb >/dev/null 2>&1 || echo "ℹ️  mandb not found or failed, man page may not be indexed."
}

function confirm_success() {
    echo "✅ $BIN_NAME installed!"
    echo "   Run: $BIN_NAME --help"
    echo "   View manual: man $BIN_NAME"
}

# === MAIN ===
check_root
install_cli
install_man_page
confirm_success

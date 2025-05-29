#!/bin/bash
set -e

echo "🔧 Installing jamf-ddm-sofa..."

# Create target bin and man directories if they don't exist
mkdir -p /usr/local/bin
mkdir -p /usr/local/share/man/man1

# Install script
install -Dm755 bin/jamf-ddm-sofa /usr/local/bin/jamf-ddm-sofa

# Install man page
install -Dm644 man/jamf-ddm-sofa.1 /usr/local/share/man/man1/jamf-ddm-sofa.1

# Update man database
mandb || true

echo "✅ jamf-ddm-sofa installed successfully!"

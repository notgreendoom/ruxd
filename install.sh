#!/bin/sh
set -e
echo "Installing Rust..."
if ! command -v rustc >/dev/null 2>&1; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi
. "$HOME/.cargo/env"
echo "Rust is ready."
echo "Building ruxd..."
cd "$(dirname "$0")"
cargo build --release
echo "Installing ruxd..."
mkdir -p "$HOME/.local/bin"
cp target/release/ruxd "$HOME/.local/bin/ruxd"
chmod +x "$HOME/.local/bin/ruxd"
echo "Done!"
echo "Run it with: ruxd"

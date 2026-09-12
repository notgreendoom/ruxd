#!/bin/sh
# Install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh


echo "Installed Rust successfully."
sleep 1;
echo "Installing ruxd..."
cargo build --release
cp /target/release/ruxd ~/.local/share/ruxd
echo "Done!"
echo "Type ruxd in terminal to run the program."

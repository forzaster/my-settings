#!/usr/bin/env bash
set -euo pipefail

usage() {
    echo "Usage: $0 <MAC_ADDRESS> [BROADCAST_IP] [PORT]"
    echo ""
    echo "  MAC_ADDRESS    Target MAC address (e.g. AA:BB:CC:DD:EE:FF)"
    echo "  BROADCAST_IP   Broadcast address (default: 255.255.255.255)"
    echo "  PORT           UDP port (default: 9)"
    echo ""
    echo "Example:"
    echo "  $0 AA:BB:CC:DD:EE:FF"
    echo "  $0 AA:BB:CC:DD:EE:FF 192.168.1.255 9"
    exit 1
}

if [[ $# -lt 1 ]]; then
    usage
fi

MAC="$1"
BROADCAST="${2:-255.255.255.255}"
PORT="${3:-9}"

# Validate MAC address format (accepts colons or hyphens as separators)
NORMALIZED_MAC="${MAC//[-:]/:}"
if ! [[ "$NORMALIZED_MAC" =~ ^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$ ]]; then
    echo "Error: Invalid MAC address format: $MAC" >&2
    exit 1
fi

# Validate port number
if ! [[ "$PORT" =~ ^[0-9]+$ ]] || [[ "$PORT" -lt 1 || "$PORT" -gt 65535 ]]; then
    echo "Error: Invalid port number: $PORT" >&2
    exit 1
fi

if ! command -v python3 &>/dev/null; then
    echo "Error: python3 is required but not found." >&2
    exit 1
fi

python3 - "$NORMALIZED_MAC" "$BROADCAST" "$PORT" <<'PYEOF'
import socket
import sys

mac_str, broadcast, port = sys.argv[1], sys.argv[2], int(sys.argv[3])

hex_bytes = mac_str.replace(":", "")
mac_bytes = bytes.fromhex(hex_bytes)

magic_packet = b"\xff" * 6 + mac_bytes * 16

with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as sock:
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    sock.sendto(magic_packet, (broadcast, port))

print(f"Magic packet sent to {mac_str} via {broadcast}:{port}")
PYEOF

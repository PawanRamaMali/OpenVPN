#!/bin/bash

echo "Listing /etc/openvpn/ directory:"
ls -la /etc/openvpn/

echo "Starting OpenVPN server:"
openvpn --config /etc/openvpn/server.conf &

sleep 5

echo "Checking OpenVPN server process:"
ps aux | grep openvpn

echo "Keep the container running:"
tail -f /dev/null

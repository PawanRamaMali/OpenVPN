#!/bin/sh

# Start the OpenVPN server
echo "Starting OpenVPN server:"
openvpn --config /etc/openvpn/server.conf &

# Wait for the OpenVPN server to start
sleep 5

# Copy the generated certificates and keys to the /certs directory
echo "Copying certificates and keys to the /certs directory..."
cp /etc/openvpn/easyrsa/pki/ca.crt /certs/ca.crt
cp /etc/openvpn/easyrsa/pki/issued/client.crt /certs/client.crt
cp /etc/openvpn/easyrsa/pki/private/client.key /certs/client.key

# Keep the container running
echo "Keep the container running:"
tail -f /dev/null

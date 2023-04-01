FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y openvpn easy-rsa iptables iptables-persistent && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up Easy-RSA
RUN make-cadir /etc/openvpn/easyrsa

# Copy the vars file and update Easy-RSA
COPY vars /etc/openvpn/easyrsa/vars
RUN echo 'set_var EASYRSA_KEY_SIZE 2048' >> /etc/openvpn/easyrsa/vars

# Generate the CA, server and client certificates, keys, and Diffie-Hellman parameters
RUN cd /etc/openvpn/easyrsa && \
    ./easyrsa init-pki && \
    echo "MyVPN CA" | ./easyrsa build-ca nopass && \
    ./easyrsa build-server-full server nopass && \
    ./easyrsa build-client-full client nopass && \
    ./easyrsa gen-dh && \
    cp pki/ca.crt pki/issued/server.crt pki/private/server.key pki/dh.pem /etc/openvpn/

# Copy the OpenVPN server configuration file
COPY server.conf /etc/openvpn/server.conf
RUN chmod +x /etc/openvpn/server.conf
# Expose the OpenVPN server port
EXPOSE 1194/udp

RUN ls -la /etc/openvpn/

# Run the OpenVPN server
#CMD ["openvpn", "--config", "/etc/openvpn/server.conf"]
#CMD ["openvpn", "--cd", "/etc/openvpn/"]

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]




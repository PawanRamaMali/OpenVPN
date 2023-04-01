# OpenVPN
Dockerizing OpenVPN 


## OpenVPN Server using Docker and Python

This repository contains a Dockerfile and a Python script to create an OpenVPN server in a Docker container. The Python script is used for creating the certificates and keys required for the OpenVPN server, while the Docker container runs the OpenVPN server itself.

## Prerequisites

1. Docker: https://www.docker.com/
2. Docker Compose: https://docs.docker.com/compose/
3. Python 3.x: https://www.python.org/

## Setup

1. Clone this repository.

```bash
git clone https://github.com/PawanRamaMali/OpenVPN.git
cd OpenVPN
```

2. Create the necessary certificates and keys using the Python script.
```
python create_certs.py
```

3. Build the Docker image and start the container using Docker Compose.

```
docker-compose build
docker-compose up
```

The OpenVPN server should now be running on port 1194 using the UDP protocol. You can connect to the server using an OpenVPN client with the generated client certificate and key.

Configuration
You can customize the OpenVPN server configuration by modifying the server.conf file in the repository. Be sure to rebuild the Docker image and restart the container for the changes to take effect.

Contributing
If you'd like to contribute to this project, please submit a pull request with your changes.

License
This project is released under the MIT License. See the LICENSE file for more details.

import os
import subprocess

def run_command(command):
    process = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()
    return stdout.decode('utf-8'), stderr.decode('utf-8')

def main():
    # Create a directory for certificates and keys
    certs_dir = 'certs'
    if not os.path.exists(certs_dir):
        os.makedirs(certs_dir)

    # Build the Docker image
    print("Building the Docker image...")
    stdout, stderr = run_command('docker-compose build')
    print(stdout)

    # Run the Docker container
    print("Running the Docker container...")
    stdout, stderr = run_command('docker-compose up -d')
    print(stdout)

    print(f"Certificates and keys have been created in the '{certs_dir}' directory.")

if __name__ == '__main__':
    main()

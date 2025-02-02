#!/bin/bash
# Navigate to home directory
cd /home/ubuntu 

# Update package list and install required dependencies
sudo apt update -y
sudo apt install -y python3 python3-pip git apache2

# Enable and start Apache
sudo systemctl enable apache2
sudo systemctl start apache2

# Clone the Git repository
git clone https://github.com/cloudwifi/python-mysql-db-project-1.git
sleep 20

# Navigate to the project directory
cd python-mysql-db-project-1 || { echo "Directory not found! Exiting..."; exit 1; }

# Install Python dependencies
pip3 install -r requirements.txt

echo "Waiting for 30 seconds before running app.py..."
sleep 30

# Start the application in the background and log output
setsid python3 -u app.py > app.log 2>&1 &

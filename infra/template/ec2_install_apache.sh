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

# Install Python dependencies with --break-system-packages
pip3 install -r requirements.txt --break-system-packages

echo "Waiting for 30 seconds before running app.py..."
sleep 30

# Kill any process using port 5000 to avoid conflicts
PID=$(sudo netstat -tulnp | grep :5000 | awk '{print $7}' | cut -d'/' -f1)
if [ -n "$PID" ]; then
    echo "Port 5000 is in use by process $PID. Killing it..."
    sudo kill -9 "$PID"
fi

# Start the application in the background and log output
setsid python3 -u app.py > app.log 2>&1 &

echo "Application started. Check app.log for logs."

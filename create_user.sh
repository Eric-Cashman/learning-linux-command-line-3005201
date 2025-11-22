#!/bin/bash

# CodeSpace User Creation Script
# Usage: ./create_user.sh username password

# Check if username and password were provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 username password"
    echo "Example: $0 kirk abc123"
    exit 1
fi

USERNAME=$1
PASSWORD=$2
GROUPS="sudo,adm,trek"

echo "Creating user: $USERNAME..."

# Check if user already exists
if id "$USERNAME" &>/dev/null; then
    echo "Error: User $USERNAME already exists!"
    exit 1
fi

# Create the user with home directory and groups
sudo useradd -m -d /tmp/${USERNAME}_home -G $GROUPS -s /bin/bash $USERNAME

if [ $? -eq 0 ]; then
    echo "User $USERNAME created successfully in groups: $GROUPS"
    
    # Set password
    echo "$USERNAME:$PASSWORD" | sudo chpasswd
    
    if [ $? -eq 0 ]; then
        echo "Password set for $USERNAME"
        echo "You can now login with: su - $USERNAME"
    else
        echo "Error setting password for $USERNAME"
        exit 1
    fi
else
    echo "Error creating user $USERNAME"
    exit 1
fi

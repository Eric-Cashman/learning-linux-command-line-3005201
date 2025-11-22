#!/bin/bash

# Wars Users Creation Script
# Star Wars Characters

echo "Creating Wars users..."

# First create wars group
sudo groupadd wars 2>/dev/null

# Luke
./create_user.sh luke abc123
# Quote: "But I was going into Toshi station!"
# Add to wars group
sudo usermod -G wars,sudo,adm -a luke

# Han
./create_user.sh han abc123
# Quote: "Never tell me the odds!"
# Add to wars group
sudo usermod -G wars,sudo,adm -a han

# Leia
./create_user.sh leia abc123
# Quote: "Into the garbage chute, flyboy!"
# Add to wars group
sudo usermod -G wars,sudo,adm -a leia

echo "Wars users created successfully!"

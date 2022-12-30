#! /bin/bash



# Change your mac address, computer name, hostname or local hostname for macOS.

printf "--- CHANGER OPTIONS ---\n"

printf "1- Set a random mac address\n2- Set a custom mac address\n3- Change computer name\n4- Change hostname\n5- Change local hostname\n"

echo "Enter your choice: "

read user_choice

# Set a random mac address

if [[ $user_choice == "1" ]]; then
    echo "Enter the name of the network interface: "
    read network_interface
    random_mac_address=`openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`
    new_mac_address=`sudo ifconfig $network_interface ether $random_mac_address`
    echo "The new mac address for the network interface $network_interface is $random_mac_address"
    ifconfig $network_interface
    
# Set a custom mac address
    
elif [[ $user_choice == "2" ]]; then
    echo "Enter a mac address with format xx:xx:xx:xx:xx:xx "
    read custom_mac_address
    echo "Enter the name of the network interface: "
    read network_interface
    new_mac_address=`sudo ifconfig $network_interface ether $custom_mac_address`
    echo "The new mac address for the network interface $network_interface is $custom_mac_address"
    ifconfig $network_interface

# Change computer name

elif [[ $user_choice == "3" ]]; then
    echo "Enter a new computer name: "
    read new_computer_name
    sudo scutil --set ComputerName $new_computer_name
    echo "The new computer name is $new_computer_name"

# Change hostname

elif [[ $user_choice == "4" ]]; then
    echo "Enter a new hostname: "
    read new_hostname
    sudo scutil --set HostName $new_hostname
    echo "The new hostname is $new_hostname"
    
# Change local hostname

elif [[ $user_choice == "5" ]]; then
    echo "Enter a new local hostname: "
    read new_local_hostname
    sudo scutil --set LocalHostName $new_local_hostname
    echo "The new local hostname is $new_local_hostname"
    
else
    echo "Error"
fi



# Version 1.0 - 2022
# Coded with love & benevolence by 8l4ckc4T



#!/bin/bash
# Script to create a reverse SSH Tunnel
USER="enter_user_name"
PORT="50000"
HOST="your_server_host_or_ip"

# Function to create the tunnel
createTunnel(){
  /usr/bin/ssh -N -R $PORT:localhost:22 $USER@$HOST
  if [[ $? -eq 0 ]]; then
    logger SSH Tunnel created Successfully
  else
    logger SSH Tunnel failed, error $?
  fi
}

/bin/pidof ssh > /dev/null
if [[ $? -ne 0 ]]; then
  logger Creating Reverse SSH Tunnel
  createTunnel
fi

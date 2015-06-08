#!/bin/bash
# Script to start Liquidsoap and connect to our HTTP Streaming
# server

# Function to start liquidsoap
NOW=$(date +"%Y-%m-%d %T")

function spawnSoap(){
  /usr/bin/liquidsoap ~/scripts/liquidsoap.liq &
  if [[ $? -eq 0 ]]; then
    echo $NOW Liquidsoap Started Successfully
  else
    echo $NOW Liquidsoap failed, error $?
  fi
}

# Run pidof to see if liquidsoap is running
# Liquidsoap uses ocamlrun as an interpreter for liq, this is the
# parent process as pidof liquidsoap will always return nothing so test for ocamlrun instead
/bin/pidof ocamlrun > /dev/null #bin the output of pidof otherwise log is full of numbers
if [[ $? -ne 0 ]]; then
  echo $NOW Starting Liquidsoap receiver
  spawnSoap
fi

### END OF FILE

#!/bin/bash
logger "Setting up GPIO Pins with WiringPi"
/usr/local/bin/gpio export 4 out #Set Pin 4 as an output pin (Ready Light)
/usr/local/bin/gpio export 17 out #Set Pin 17 as an output pin (Error Light)
/usr/local/bin/gpio -g mode 4 out #Set the mode to BCM GPIO Output (Pi Pin numbers)
/usr/local/bin/gpio -g mode 17 out #Same as above for the error light
logger "Finished setting up WiringPi pins"

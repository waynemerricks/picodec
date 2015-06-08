#!/bin/bash
# Script to amend GPIO and then send an email via sendemail with TLS enabled
FROM="picodec001@your_mail_host"
TO="your_alert_address"
SUBJECT="PICODEC001 Audio Started"
MESSAGE="Hi\n\nJust letting you know that I've successfully connected and started playing.\n\nYay!"
USER="pi_mail_user"
PASS="pi_mail_password"
SERVER="your_mail_server"
PORT=25

#Add event to syslog
logger "PiCodec - Playback Stopped"

#Turn off error LED
/usr/local/bin/gpio -g write 17 0

#Turn on ready LED
/usr/local/bin/gpio -g write 4 1

#sendemail below should be all on one line
sendemail -f "$FROM" -t "$TO" -u "$SUBJECT" -m "$MESSAGE" -s "$SERVER":"$PORT" -o tls= no -xu "$USER" -xp "$PASS"

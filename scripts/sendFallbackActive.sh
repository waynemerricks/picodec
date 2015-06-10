#!/bin/bash
# Script to amend GPIO and then send an email via sendemail with TLS enabled
FROM="picodec001@your_mail_host"
TO="your_alert_address"
SUBJECT="PICODEC001 Audio Stopped!"
MESSAGE="Hi\n\nI've lost audio and I'm playing local emergency files.\n\nBoo!"
USER="pi_mail_user"
PASS="pi_mail_password"
SERVER="your_mail_server"
PORT=25

#Add event to syslog
logger "PiCodec - Fallback Active"

#Turn off ready LED
/usr/local/bin/gpio -g write 4 0

#Turn on error LED
/usr/local/bin/gpio -g write 17 1

#sendemail below should be all on one line
sendemail -f "$FROM" -t "$TO" -u "$SUBJECT" -m "$MESSAGE" -s "$SERVER":"$PORT" -o tls= no -xu "$USER" -xp "$PASS"

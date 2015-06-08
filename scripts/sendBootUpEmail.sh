#!/bin/bash
# Script to send an email via sendemail with TLS enabled
FROM="picodec001@your_mail_host"
TO="your_alert_address"
SUBJECT="PICODEC001 Powered On"
MESSAGE="Hi\n\nJust letting you know that I've been turned on.\n\nYay!"
USER="pi_mail_user"
PASS="pi_mail_password"
SERVER="your_mail_server"
PORT=25

#sendemail below should be all on one line
sendemail -f "$FROM" -t "$TO" -u "$SUBJECT" -m "$MESSAGE" -s "$SERVER":"$PORT" -o tls= no -xu "$USER" -xp "$PASS"

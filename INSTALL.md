#INSTALL INFO

This file only explains the software setup, for parts lists and hardware info
check out HARDWARE instead.

###Pi Specific Setup

Install Raspbian onto your Pi (I was using a model B, the revision that came
with mounting holes however these aren't required you just need a case so you 
can easily mount it to some backing board).

Be sure to install/enable ssh (pretty sure this is an install option however 
"sudo apt-get install openssh-server" works just as well).

*Change your Pi user name and password*

As far as I know newer builds of Raspbian let you change usernames etc as part
of the install.  Mine was old enough that I had to do this manually.

* Enable root (temporary, don't panic):
```
sudo passwd
```
* Log out and log in as root then amend the default pi user to your desired 
user name:
```
usermod -m -d /home/newusername -l newusername pi
visudo

#Change pi ALL=(ALL:ALL) ALL to
newusername ALL=(ALL:ALL) ALL
```
* Log out and back in as your new user and disable root:
```
sudo passwd -d -l root
```

If I was doing this where audio quality was paramount, I'd buy a USB sound card
small enough to hack into a 1U case (with all the other parts).  I have used 
things like a Roland Duo-Capture Ex before and they sound fine to my ears.

For the purposes of this guide, I'll be sticking to the standard Pi analogue 
output and using unbalanced to balanced converters (not ideal but it works).

* Set the Pi to use analogue audio out as default:
```
sudo amixer cset numid=3 1
```

Now start alsamixer and set the output to about -1db.  Don't add gain it may end
up distorting your audio even if you think it sounds ok.

Make sure you quit out of alsamixer and reboot normally at least once otherwise
the volume levels seem to default back down to something pretty quiet.


###Other Software

If you already know how to use liquidsoap to output a HTTP stream over ALSA
then skip to the GPIO section.

* Copy all of the files in the scripts directory to your ~/scripts we'll use 
  these later.
* Install liquidsoap, its alsa plugin and sendemail (for sending emails):
```
sudo apt-get install liquidsoap liquidsoap-plugin-alsa sendemail
```

In testing I've found that if you can produce an ogg stream liquidsoap has much
more immediate play back.  If you use MP3 streams, you get a much longer buffer
(usual is about 5 - 10 seconds).

Feel free to mess with your Icecast and liquidsoap settings to reduce this.
Buffering to this length of time was not an issue for this project.


###GPIO Software

You can use the Pi's built in GPIO libraries with Python however this requires
root access and also means you have Python scripts everywhere.  I found it much
simpler to just use WiringPi (https://github.com/WiringPi/WiringPi).

This is a set of C utilities that run on the command line to turn GPIO pins on
and off (and much more).  All I want to use it for is to turn LEDs on or off
and best of all you don't need root access.

* Get and build WiringPi:
```
cd ~
git clone https://github.com/WiringPi/WiringPi
cd WiringPi
./build
```

Once built/installed you should have a utility called gpio in /usr/local/bin

If you have LEDs connected you can test it with:
```
#Set up the pins
gpio export 4 out
gpio -g mode 4 out

#Test it
gpio -g write 4 1 #led on
gpio -g write 4 0 #led off
```


###Reverse SSH Tunnel for remote administration

As you can never be sure what firewall access you'll have in random companies
(usually none).  Its easier to just set up a reverse SSH tunnel to one of your
servers and punch a hole in your own firewall.

**There are security concerns with this**, the usual stuff like try not to use 
port 22, have good passwords and only use ssh keys apply but I won't go into 
that for this guide (fail2ban, iptables of known clients etc is also worth 
using).

* Create an SSH key on the Pi and add it to your public server:
```
ssh-keygen -t rsa #don't use a password the Pi needs to be able to auto login
ssh-copy-id admin-user@my_public_server
```

At this stage if you ssh onto your public server from the Pi you shouldn't be 
prompted for a password.  If you are check your ssh-copy-id worked and or your
ssh settings on the public server.

* Connect the reverse tunnel:
```
ssh -N -R 50000:localhost:22 admin-user@my_public_server
```
* On your public server, check it works:
```
ssh -l pi_user -p 50000 localhost
```
You should be on the Pi from your public server.  If not check your settings.

###Using all the scripts to make this run

If you haven't already, copy everything in the scripts directory to your
~/scripts

You'll need to edit each of the following scripts for your particular settings:
* create_ssh_tunnel - USER, PORT, HOST
* sendAudioStarted - All email settings and message tweaking (optional)
* sendAudioStopped - As above
* sendBootUpEmail - As above

The other scripts don't need any alteration unless you wish to change log 
messages.

With those amended add them to cron:
```
crontab -e

#On Reboot
@reboot ~/scripts/create_ssh_tunnel.sh >> tunnel.log 2>&1
@reboot ~/scripts/sendBootUpEmail.sh >> email.log 2>&1
@reboot ~/scripts/setup_gpio.sh >> setup_gpio.log 2>&1
@reboot ~/scripts/liquidsoap_watchdog.sh >> liquidsoap_watchdog.log 2>&1

#Every 60 seconds
*/1 * * * * ~/scripts/liquidsoap_watchdog.sh >> liquidsoap_watchdog.log 2>&1
*/1 * * * * ~/scripts/create_ssh_tunnel.sh >> tunnel.log 2>&1
```

**Adding the logs to logrotate:

This is relatively easy you just need to add a new log definition for logrotate.

```
sudo nano /etc/logrotate.d/picodec

/home/your_pi_user/*.log {
  compress
  size 300k
  missingok
  notifempty
  daily
  create 0660 your_pi_user pi
}
```
Obviously change "your_pi_user" to whatever user you're using for all of this.

With all of that in place, everything should be working.

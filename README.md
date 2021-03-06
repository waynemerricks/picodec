# picodec - Build your own 1U audio receiver
**Raspberry Pi Remote audio receiver**


Working in broadcast, we often have to send devices to other companies so that
they can receive our audio for rebroadcasting or internal streaming purposes.

Traditionally we used ISDN Codecs on private leased lines (Bad old days) but 
over the last 10 years have moved to IP Codecs (Bad in different ways).  About
2 years ago our "expensive" (£2,000) 1U Rack mount codec died so I took it apart
to see if there was anything fixable.

I'm not sure what I expected for £2,000 but a mini ITX motherboard with a VIA 
nano chip, a CF card as a hard drive, a custom sound card board and a bunch of 
LEDs was not it.

As an estimation there is no way this device costs more than £500 in parts 
(it may actually be as low as £300) so £2,000 is almost approaching Apple 
territory for a "healthy" markup.  If you work in broadcasting you'll have
noticed "broadcast" means you add at least 1 or 2 zero's to the price so this is
not unusual.


**The Problem**

We found ourselves working with a new organisation which normally meant we'd be
spending another £2,000 except this time management didn't want to spend £2,000.

So with not much more than 12 hours notice, I had to retrofit our internal Pi
streamer into a 1U case as a plug and play rack mount device.

I only had time to use parts and tools I had lying around or could get hold of
the same day which has meant some compromises in finish so this is effectively
the prototype build.

**Bill of Materials:** < £150

**Reliability:** Internally this has been working for almost 2 years without
any problems.  Externally its been running for approx 72 hours as of today
(08/06/2015).

**Features:**

So this repo walks you through building a 1U Rack mount system using a Pi and
easily available hardware (and open source software) in order to get the
following:
* Remote re-streaming anywhere in the world with an Internet connection
* Local file failover for when an Internet connection is not available
* Silence Detection failover (as above)
* Balanced Audio Out
* Standard IEC and XLR connectors all round
* Status LED indicators (Orange Power, Green OK, Red Problem)
* Email Notifications
* Reverse SSH connections for remote administration

**Future plans**

* Amend liquidsoap to have structured fallback audio instead of random mp3s
* It would be nice to have a web interface for local admins
* A local icecast server would also be helpful for the remote (not possible
  on the Pi as the CPU chokes.  Need to test on a Pi 2)
* Potential for an LED display to show you the IP the device has picked up
* DVI and USB Connectors on the panel for local admins
* Get plans for the panel holes drawn up so that any good company can precut
  the panels for you

**Further Info**

Check out INSTALL for a quick run through, more images are available in the 
images directory.

![alt tag](https://raw.github.com/waynemerricks/picodec/master/images/IMG_20150605_114416.jpg)

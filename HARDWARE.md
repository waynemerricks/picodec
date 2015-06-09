#HARDWARE INFO

This file only explains the hardware you need for the project.  Check out 
INSTALL for the software side.

**Danger (not just for Will Robinson)**

For this build you will be messing with electrical mains voltage wiring.  If you
don't know what you're doing please don't do this!

I will only be giving examples for standard UK wiring (I think Euro is the same
now).

This is: 
* Brown/Red ==> Live
* Blue/Black ==> Neutral
* Green/Yellow ==> Earth/Ground

Pay close attention to this stuff you can get a nasty jolt if you screw it up!

###Parts List
* Raspberry Pi (Any model although be aware there are extra pins on the B+ 
  and v2)
* Pi Case with a removable lid so you can screw through it to mount the Pi
* 4GB+ SD Card (I recommend 8 or more if you plan to have local playback as a 
  failover option with lots of storage)
* 5v 1.2A+ Power Supply.  To fit in a 1U case maximum height is about 30mm.
  Ideally with a detachable lead to a plug rather than one of those moulded plug
  transformers that is the usual Pi Power Supply

**Note:** You can get a normal Pi PSU and hack it to bits, desolder the pins and 
use that instead.  I broke two PSU's trying this technique, one of them arced 
and burnt out.  Its safer and less hard work hacking to just get a ready made 
adapter from somewhere.

**Note 2:** The euro style pins with the holes are ideal for soldering and just
about fit in a 1U case if you have nothing else.

* Fused and Switched IEC Panel Mount Socket (I couldn't wait for this to come
  in stock so ended up using a standard panel mount socket)
* Audio Lead 3.5mm Stereo Jack to 1/4" Mono Jacks
* 2 x XLR Panel Mounts
* 1 x RJ45 Panel mounts (IDC connector reverse)
* Unbalanced to balanced converters (I used Studio Spares RED 502's).  If you 
  only need mono audio, you only need 1 of these.  2 for Stereo.
* 1U Standard rack mount case (approx 100mm in depth).  All Metal Parts are 
  pretty good if you're in the UK.  They can even pre-cut holes for you if you
  talk to them (sadly I didn't do this).
* 3 x 5mm LEDs (I went red, orange and green).  Try to get roughly equal 
  brightness or you find one drowns out the others (also if one has a diffused
  lense try and get them all diffused).
* 3 LED Holders (sadly I didn't have time for these either)
* 3 x 270 Ohm resistors (anything from 130 Ohm up to about 300 is fine)
* A selection of heat shrink, 3mm dia is fine for most of it but 5mm is handy
  and approx 10mm would have been great for the IEC connector terminals.
* Breadboard jumper cables (or an old IDE cable you don't mind cutting up)
* Some contact adhesive
* 5mm thick plywood to screw mount some of the boards
* 5mm wood screws to screw into the plywood
* 3 - 4mm dia machine screws (3 - 5mm in length) and appropriate nuts to use
  as fasteners for the XLR, IEC and RJ45 Connectors
* Cable ties
* Sticky pad tie holders (for the cable ties to loop through)
* A selection of drill bits (5mm for LEDs or approx 10mm if you use the holders,
  22mm for the XLRs, 18mm for the RJ45 port)
* A Jigsaw with a metal blade (For the IEC Connector)
* Some random electrical wire (1.5mm dia minimum for the Mains power in).
* Some random audio wire (thin electrical will work but most of it is not
  stranded which makes it more difficult to bend.  You can use network cabling
  it works fine but is quite thin, consider doubling up the wires)
* Some electrical insulation tape (different colours help to remember which ones
  might jolt you)
* A length of network cable < 100mm (with an RJ45 connector on one end)
* A soldering iron
* A Stanley knife (for cutting the IDE cable)
* Safety goggles (if you like being able to see)
* Ear plugs (if you like being able to hear)


###Putting it all together

**Back Panel:**
On the back panel of the 1U case you will need 3 round holes (From left to right
as you look at it from the back):

Left Hand Side:
* 2 x 22mm for the XLRs (L & R Output.. only need 1 for mono)
* 4 x 4mm holes for the XLR mounting screws

Somewhere roughly middle:
* 1 x 18mm hole for the Network port
* 2 x 4mm holes for the mounting screws

Right Hand Side:
* IEC Connector rectangle (ish)
* 2 x 4mm holes for the mounting screws

**Note:** I used a cone/christmas tree bit for these.  Safety goggles help a lot
when you have tiny fragments of metal flying around.  Ear plugs also help reduce
the annoying metal on metal screeching of drills.

I had to jigsaw out the IEC connector after first drilling some holes for the 
blade to fit.

A file helps a lot to remove the left over bits of metal all around the holes 
but can scratch your paintwork to pieces.

**Front Panel:**
On the front, if you don't have LED holders 3 x 5mm holes roughly in the middle
work fine.  If not most holders are usually approx 10mm in diameter.  Get
holders, they cover a multitude of ugly drilling!

###After cutting all the holes
Mount up all your components in the holes.  I also ringed them with contact
adhesive to help cover up random bits of metal I'd filed away and as a just in
case way of holding them to the case.

Orient the LEDs with legs left to right rather than vertically as it gives you
easier access when soldering later.

Leave the glue to dry fully before pulling on them and breaking things.

###Laying out the components

![alt tag](https://raw.github.com/waynemerricks/picodec/master/images/IMG_20150605_110715.jpg)

As you can see the layout gets a bit cramped on the "finished" internals.  I 
used standard connectors wherever possible to make it easy to replace bits even
though it would be cleaner to cut XLR ports and wire directly to the back panel.

Block diagram of the layout:

![alt tag](https://raw.github.com/waynemerricks/picodec/master/images/Parts_Layout.png)

###Connecting everything up

First the easy stuff:

**Audio Out:**
* First remove all the metal casing from the RED502s or they won't fit.
* You will also have to remove the nut fasteners on the jack and phono
  connectors in order to remove the metal side panels.
* I drilled two holes through the RED502s on an empty area of the PCB (so that 
  no connections were severed) and screwed into the plywood to mount them.
* The 3.5mm jack to 1/4" (6.35mm) lead was then plugged from the Pi into the 
  unbalanced inputs of the RED502s.
* A standard XLR lead (1 - Ground, 2 +, 3 -) was taken out of the RED502's and 
  soldered onto the XLR ports on the back panel.

**Network Out:**
* I chopped an old network cable to about 15cm in length keeping one end with 
  the RJ45 attached and punched down the other into the IDC network connector.

**Power In:**
* I cut the micro USB connector off an old (dead) Pi PSU and cut the standard
  jack power connector from my 5v 2.2A PSU (make sure you have 5v and 1.2A or 
  above).
* I soldered the Pi USB connector to the PSU taking care to keep the + and - 
  the right way around.
* On the AC side of the PSU, I cut the plug off the clover connector and 
  soldered it directly to the IEC connector on the back panel.
* I used contact glue to stick the PSU to the plywood.
* I also wired the earth cable to a screw terminal in the metal case.

**Note:** Its a good idea to put a fuse on the live wire of the IEC connector or
even better buy an IEC connector with a built in fuse holder (and if you want
to go the whole hog, get a switched fused IEC connector).

###LEDS/GPIO###

As you can see from the block diagram, the LEDs are quite a simple circuit that 
go from the Pi, via a 270 Ohm resistor and back to ground on the Pi. 

*Orange*: This is the power indicator, it comes from the 3.3v pin on the Pi and
goes to ground.

*Red*: Error LED, fired from GPIO pin 17.

*Green*: Ready LED, fired from the GPIO pin 4.

From what I've read there is only 50ma available on the Pi for GPIO.  Most LEDs
use a typical current of around 25ma. If my maths is correct a 130 Ohm resistor
would have been enough however at short notice I could only get 220 Ohm.  You
may have more luck getting 270 Ohm which are more common and will work.

**Why the IDE cable?**

Its probably easier to use breadboard jumper cables so you can plug those onto
each pin of the Pi (you'll need 4 of them).  However I had a lot of old IDE
cables around and no breadboard cables.  This fits perfectly on the Pi GPIO 
header but you do have 6 or 8 pins over hanging the header.

From there I trimmed the IDE wire to length so that it would reach the front
panel with a couple of inches to spare.  I then used a Stanley knife to cut
through the edges of each wire to separate them out (if any of you used to make
rounded IDE cables you'll know what I mean).

IDE Connectors usually have wiring running from left to right and the 
pins/wiring increases as you would expect e.g. Top Left = 1, under that is 2, 
the next along 3, under that 4 etc...

Be aware that depending on which end you cut off some of the wires are twisted 
and present backwards at the opposite end.

Whatever you do just use a multimeter and find the wires you need before
soldering up LEDs.  The worst thing you can do is accidentally wire up the +5v
to some other part of the Pi and break it.


###All Done###

With all that connected, test all your connections before powering it up.

The hardware is all off the shelf stuff with cases removed and connectors
changed for convenience.  There is no reason why you can't leave all of this
plugged together in a shoe box without having to solder a thing.  You could even
hook up the LEDs to a bread board.

But most places expect rack mount hardware that is "idiot proof."  To this end
IEC power connectors are a must and some sort of "green means good, red means
bad" lights to work from.

Be sure to check out the INSTALL file for the software info and setup.

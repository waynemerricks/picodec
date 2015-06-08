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
* Some electrical insulation tape (different colours help to remember which ones
  might jolt you)
* A length of network cable < 100mm (with an RJ45 connector on one end)


###Putting it all together

TODO

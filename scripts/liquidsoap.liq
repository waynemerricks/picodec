# Simple script that plays from our HTTP Stereo MP3 stream and spews it
# out over the system speakers via ALSA 

# HTTP Stream Location 
HTTPSTREAM="http://YOUR_ICECAST_STREAM" 

# Audio Fall back location
DIRECTORY="/var/audio/"

# LOG File Location 
set("log.file.path", "~/liquidsoap.log") 

# Define playbackStopped so we can do things if the output stops 
# This will log to syslog that playback stopped
# Then turn off the green ready led
# and turn on the red error led
def playbackStopped() 
  system("~/scripts/sendAudioStopped.sh")
end 

# Define playbackStarted so we can do things when the output starts
# This will log to syslog that playback started
# Then turn off the red error led
# and turn on the green ready led
def playbackStarted()
  system("~/scripts/sendAudioStarted.sh")
end

# Define fallbackActive(fromSource, toSource)
# Switches from one source to another when the live stream is lost
# Emails (if possible) about it and sets error LED
def fallbackActive(a,b)
  system("~/scripts/sendFallbackActive.sh")
  sequence([a,b])
end

# Define fallbackInActive(fromSource, toSource)
# Reverse of fallbackActive putting the ready LED back on
def fallbackInActive(a,b)
  system("~/scripts/sendAudioStarted.sh")
  sequence([a,b])
end

# Emergency fallback 
emergency = playlist(DIRECTORY)

# Get the input from the HTTP Stream (MP3 Stereo)
liveStream = (input.http(id="picodec",HTTPSTREAM):source(2,0,0)) 
liveStream = strip_blank(liveStream, length=10.0) #10 second silence detect
liveStream = fallback(track_sensitive=false,transitions=[fallbackInActive,fallbackActive],[liveStream,emergency])

# Output the stream to ALSA 
output.alsa(fallible=true,on_start=playbackStarted,on_stop=playbackStopped,liveStream) 
# fallible = true means this is expected to fail so reconnect if possible 
 

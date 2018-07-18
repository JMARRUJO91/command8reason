# command8reason
Reason remote mapping for Digidesign command 8 controller running in Stand-alone mode.

This is a basic setup I've done to control the master section with the Command 8 from a mixing perspective. As the Command 8 is pretty limited in the amount of usable buttons, faders and knobs I've tried to focus on what I deemed the most used functions in a daily mixing situation.

If this doesn't suit you well feel free to fork this and build your own setup, I'd love to see if anyone else can take this to the next level! :) 

# Mapping
The following is how I've mapped the Command 8

|Command 8|Reason mixer|
|---|---|
|Faders|Faders|
|Mute|Mute|
|Solo|Solo|
|Select|EQ On/Off|
|Encoder|Gain|
|Page Left|Move base channel 8 steps left|
|Page Right|Move base channel 8 steps right|
|Master bypass|Move base channel 1 step left|
|ESC|Move base channel 1 step right|

# Installation
Find your *Propellerhead Software* folder and copy this whole folder structure into the *Remote* folder.

# Preparing the Command 8
This mapping works almost out of the box with a default configured Command 8 running in Stand-alone mode. There are however a few buttons I've changed from their default mapping, simply because they weren't assigned a midi CC value out of the box.

In general, the Command 8 is set up by default so each channels fader, knob and buttons are sending the same CC-value over the whole controller, but on it's own respective midi channel. For example the Faders are all sending a CC value of 7 on midi channel 1-8. I've honed this same setup when adding CC-values to unassigned buttons as much as possible. The exception is the top row of buttons that are used for global purposes.

|Function|Midi CC|Midi channel|
|---|---|---
|Select buttons|16|1-8|
|Master bypass|110|1|
|ESC|111|1|

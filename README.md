# Wyoming Satellite Scripts

Scripts to help install and manage [Wyoming remote voice satellites](https://github.com/rhasspy/wyoming-satellite).
* Install wyoming-satellite, wyoming-openwakewords, speaker drivers and home assistant wakeword collection in one command
* Includes defining, enabling and starting systemd services.
* Provided menu functions that will:
  - Select your wake word or show your installed wake word
  - Refresh wakeword list from github source  
  - Restart all the associated systemd services  
  - Initiate menu with the ```m``` or ```menu``` command  


Full Install script, copy this command and run in on your device  
```bash
bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/main/scripts/install.sh)"
```
Install menu functions, copy this command and run in on your device    
```bash
bash -c "$(wget -qLO - https://github.com/dreed47/wyoming-satellite-scripts/raw/main/scripts/menu-install.sh)"
```

## Reference Links
* Works with [Home Assistant](https://www.home-assistant.io/integrations/wyoming)
* Local wake word detection using [Wyoming services](https://github.com/rhasspy/wyoming#wyoming-projects)
* [wyoming satellite git repo](https://github.com/rhasspy/wyoming-satellite)
* [wyoming openwakeword git repo](https://github.com/rhasspy/wyoming-openwakeword)
* [home assistant wakewords collection git repo](https://github.com/fwartner/home-assistant-wakewords-collection) 
* [blog post - Setup a Raspberry Pi Zero 2 W as a Wyoming Satellite](https://www.slacker-labs.com/setup-a-raspberry-pi-zero-2-w-as-a-wyoming-satellite/)
* [YouTube - Build your own Local Echo](https://www.youtube.com/watch?v=Bd9qlR0mPB0)

## IMPORTANT
These scripts assume your satellite is using a [Raspberry Pi Zero 2 W](https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/) and a [ReSpeaker 2Mic HAT](https://wiki.keyestudio.com/Ks0314_keyestudio_ReSpeaker_2-Mic_Pi_HAT_V1.0).  If you're using different hardware then you may need to modify these scripts to get them to work.



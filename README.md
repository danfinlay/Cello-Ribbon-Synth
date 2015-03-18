# Cello Ribbon Synth
## Inspired by the [Arduino ribbon synth](https://github.com/flyswatter/Arduino-ribbon-synth).

Instead of using drum-pads as the pluck-system like on the guitar, this project is dedicated to making a bowed instrument using the same type of softpot sliders.

The current plan is to use rotary encoders with long sprockets on them that will be turned with a timing-belt bow to control the volume of the MIDI strings.

The rotary encoder mounts are 3d printable and parametric, which means you can customize all sorts of their dimensions to suit the encoders you have, and generate them for printing. I'm adding the details in the [encoder readme](ENCODER_README.md).

Uses [softpot sliders](http://bildr.org/2012/11/touch-sliders-with-a-softpot-arduino/) ([500mm available on Sparkfun](https://www.sparkfun.com/products/8681)).

To use an Arduino micro as its own usb midi device, I'm using [AVCore](https://github.com/rkistner/arcore), a fork of the Arduino core libraries that includes MIDI output support.



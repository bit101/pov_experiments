#version 3.7;
#include "stdinc.inc"
#include "textures.inc"
#include "stones.inc"
#include "../lib/objects.inc"
#include "../lib/funcs.inc"
#include "./objects.inc"

global_settings { 
  assumed_gamma 1 
  ambient_light 0.3
}


light_source {
  <-4, 6, -12>
  White * 0.3
}

light_source {
  <8, 8, -8>
  White  * 0.3
}

#declare Angle = pi * 2 * clock;
#declare Cos = cos(Angle);
#declare Sin = sin(Angle);
#declare CamX = Cos * 18;
#declare CamY = Sin * 8 - 2 ;
#declare CamZ = Sin * 18;
camera {
  right x * image_width / image_height
  location <CamX, CamY, CamZ>
  look_at  <0, 0, 0>
}

object {
  Building
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0 color Black]
      [1 color Gray05]
    }
    scale 2
    translate -1
  }
}

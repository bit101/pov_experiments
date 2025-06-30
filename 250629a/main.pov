#version 3.7;
#include "stdinc.inc"
#include "textures.inc"
#include "stones.inc"
#include "blpov.inc"

global_settings {
  assumed_gamma 1
  ambient_light 0.4
}

light_source {
  <-4, 4, -3>
    White
}

light_source {
  <8, 8, 0>
    White 
}

camera {
  right x * image_width / image_height
  location <2, 0, -4>
  look_at  <0, 0, 0>
}

object {
  SphereCage(12, 12, 1.8, 0.1)
  texture { T_Stone10 }
  rotate clock*360
}

sphere {
  <0, 0, 0>, 1.0
  texture { SilverFinish }
  normal { bumps 0.5 scale 0.25 }
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0 color Blue]
      [1 color White]
    }
    scale 2
    translate -1
  }
}

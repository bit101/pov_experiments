#version 3.7;
#include "stdinc.inc"
#include "textures.inc"
#include "stones.inc"

global_settings {
  assumed_gamma 1
  ambient_light <0.1, 0.1, 0.1>
}


light_source {
  <-4, 0, -8>
    White
}

light_source {
  <8, 8, -4>
    White
}

camera {
  right x * image_width / image_height
  location <0, 0, -5>
  look_at  <0, 0, 0>
}

sphere {
  <0, 0, 0> 2
  pigment { 
    gradient y
    color_map {
      [0 color Red]
      [0.5 color Yellow]
      [1 color Red]
    }
    #declare Scale = 1+5 * (sin(clock * radians(360)) + 1);
    turbulence Scale
    scale Scale
  }
  finish { phong 0.5 }
  normal { bumps 0.5 scale 0.08 }
  rotate clock * 360

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

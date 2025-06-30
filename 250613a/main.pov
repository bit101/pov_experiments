#version 3.7;
#include "stdinc.inc"
#include "textures.inc"
#include "stones.inc"
#include "./generated.inc"

global_settings { assumed_gamma 1 }

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
  location <2, 2, -5>
  look_at  <0, 0, 0>
}

object {
  Blobby 
  pigment {
    gradient y
    color_map {
      [0 Black]
      [0.5 White]
      [1 Black]
    }
    turbulence 2
     scale 1
  }
  finish { phong 1 }
  normal { bumps 0.8 scale 0.1}
  scale 1.25
  rotate clock * 360
}

// box {
//   <-1, -1, -1>
//   <1, 1, 1>

//   texture {
//     T_Stone10
//   }
//   rotate clock*360
// }

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0 color Red]
      [1 color Blue]
    }
    scale 2
    translate -1
  }
}

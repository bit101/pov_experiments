#version 3.7;
#include "stdinc.inc"
#include "textures.inc"
#include "stones.inc"
#include "../lib/objects.inc"
#include "./box.inc"

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
  location <2, 2, -4>
  look_at  <0, 0, 0>
}

union {
  sphere {
    <0, 0, 0> 1
  }
  // box {
  //   <-1, -1, -1>
  //   <1, 1, 1>
  // }
  object {
    FBox
    translate 1.5*x
  }
  object {
    FBox
    translate 1.5*x
    rotate 90*y
  }
  object {
    FBox
    translate 1.5*x
    rotate 180*y
  }
  object {
    FBox
    translate 1.5*x
    rotate 270*y
  }
  object {
    FBox
    translate 1.5*x
    rotate 90*z
  }
  object {
    FBox
    translate 1.5*x
    rotate -90*z
  }
  pigment {
    gradient y
    color_map {
      [0 rgb <0.3, 0.3, 0.3>]
      [0.5 color White]
      [1 rgb <0.3, 0.3, 0.3>]
    }
    turbulence 10
    scale 2
  }
  finish { phong 1}
    
  scale 0.75
  rotate 360 * clock
}

// object {
//   Fractal
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

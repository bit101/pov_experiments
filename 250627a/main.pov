#version 3.7;
#include "stdinc.inc"
#include "textures.inc"
#include "stones.inc"
#include "../lib/objects.inc"

global_settings { 
  assumed_gamma 1
  ambient_light 0.1
}

#declare R1 = seed(123);

light_source {
  <-7, 4, -7>
    rgb 0.8
}

light_source {
  <7, 12, 0>
  rgb 0.3
}

#declare Angle = clock * pi * 2;
camera {
  right x * image_width / image_height
  location <cos(Angle) * 6, 3+sin(Angle), sin(Angle) * 6>
  look_at  <0, 0, 0>
}

// plane {
//   <0, 1, 0>, -1
//     texture {
//       T_Stone11
//     }
// }

box {
  <-8, -1, -8>
  <8, 18, 8>
  texture {
    T_Stone17
    scale 0.2
  }
      normal { bumps 0.5 scale 0.08}
}

union {
#for (X, -2.5, 1.5, 1)
  #for (Z, -2.5, 1.5, 1)
    #local H = -1 + rand(R1)*3;
    box {
      <X, -1, Z>
      <X+1, H, Z+1>

      texture {
        T_Stone10
        scale 0.2
      }
      normal { bumps 0.8 scale 0.02}
    }
    sphere {
      <X+0.5, H+sin(Angle*4 + rand(R1)*pi*2)*0.25, Z+0.5> rand(R1) * 0.1 + 0.25
      texture {
        SilverFinish
      }
    }
  #end
#end
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

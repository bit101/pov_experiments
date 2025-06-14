#include "stdinc.inc"
#include "textures.inc"
#include "stones.inc"
#include "woods.inc"

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

#for (T, 0, 360, 10)
torus {
  0.5, 0.05

  texture {
    Brass_Valley
  }
  translate <2, 0, 0>
  rotate T*z + clock*360*z
  rotate clock*360*y
}
#end

torus {
  2, 0.4

  texture {
    T_Stone10
  }
  rotate <90, clock * 360, 0>
}

sphere {
  <0, 0, 0> 1
  texture {
    SilverFinish 
    normal { bumps 0.4 scale 0.2 }
  }
  rotate <0, clock * 360, 0>
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

#include "stdinc.inc"
#include "textures.inc"
#include "stones.inc"
#include "skies.inc"

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

#declare R1 = seed(1234);

#for (i, 0, 100)
#declare X = RRand(-2, 2, R1);
#declare Y = RRand(-1, 1, R1);
#declare Z = RRand(-1, 1, R1);
#declare W = 0.01;
#declare D = RRand(0.5, 1, R1);
#declare H = RRand(0.5, 1, R1);
box {
  <X, Y, Z>
    <X+W, Y+D, Z+H>

    texture {
      Metal
    }
  rotate <0, floor(RRand(0, 3, R1)+0.5)*90, floor(RRand(0, 3, R1+0.5))*90>
    rotate clock*360
}
#end

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

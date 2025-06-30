#version 3.7;
#include "stdinc.inc"
#include "textures.inc"
#include "stones.inc"
#include "./aizawa.inc"

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
  location <2, 0.5, -10>
  look_at  <0, 0, 0>
}

#declare Scale = 3;

#for (I, 0, 10000)
  sphere { 
    <X*Scale, Y*Scale, (Z+Cz)*Scale>, 0.1
    texture { T_Stone10 }
    rotate clock * 360*y
  }
  #declare X1 = DX(X, Y, Z);
  #declare Y1 = DY(X, Y, Z);
  #declare Z1 = DZ(X, Y, Z);
  #declare X = X1;
  #declare Y = Y1;
  #declare Z = Z1;
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



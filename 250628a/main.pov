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
    // Pink
    White
}

camera {
  right x * image_width / image_height
  location <2, 2, -4>
  look_at  <0, 0, 0>
}

#declare R1 = seed(2343);

blob {

//////////// spheres
  #for (i, 0, 500)
  #local MaxRadius = 1.5;
  #local U = rand(R1) * 2 - 1;
  #local T = rand(R1) * pi * 2;
  #local Radius = pow(rand(R1), 1/3) * MaxRadius;
  #local X = sqrt(1-U*U) * cos(T) * Radius;
  #local Y = sqrt(1-U*U) * sin(T) * Radius;
  #local Z = U * Radius;

  #local Size = rand(R1) * 0.5 + 0.1;
  #local Size = Size * (sin((rand(R1) + clock) * pi * 2) * 0.5 + 1);
  sphere {
    <X, Y, Z> Size * 0.65
    strength Size*3
    // pigment { rgb <rand(R1) * 0.2 + 0.8, rand(R1) *0.1 + 0.6, rand(R1) * 0.2 + 0.4> }
    pigment { RandomRGB()}
    finish { 
      phong rand(R1) * 0.4
    }
    normal { bumps rand(R1) * 0.04+0.05 scale 0.02}
  }
  #end
//////////// spheres
  rotate 360*clock
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

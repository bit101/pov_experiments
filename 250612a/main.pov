#version 3.7;
#include "stdinc.inc"
#include "textures.inc"
#include "stones.inc"

global_settings { assumed_gamma 1 }

light_source {
  <-4, 4, -3>
  rgb <1, 0.5, 0.5>
}

light_source {
  <8, 8, 2>
  rgb <1, 1, 0.5>
}

camera {
  right x * image_width / image_height
  location <2, 2, -6>
  look_at  <0, 0, 0>
}


#declare Base_box = box {
  <-1, -1, -1>
  <1, 1, 1>
};


#declare Sub_box = union {
  object { Base_box }
  #for (i, 0, 3)
  object {
    Base_box 
    scale 0.5
    translate 1.5*x
    rotate i * 90 * y
  }
  #end
  object {
    Base_box 
    scale 0.5
    translate 1.5*x
    rotate 90 * z
  }
  object {
    Base_box 
    scale 0.5
    translate 1.5*x
    rotate -90 * z
  }
  rotate 90*z
  texture {
    T_Stone10
  }
};

// Sub_sub
union {
  object { Base_box }
  #for (i, 0, 3)
  object {
    Sub_box
    scale 0.5
    translate 1.5 * x
    rotate i * 90 * y
  }
  #end
  object {
    Sub_box
    scale 0.5
    translate 1.5 * x
    rotate 90*z
  }
  object {
    Sub_box
    scale 0.5
    translate 1.5 * x
    rotate -90*z
  }

  texture {
    T_Stone10
  }
  rotate clock * 360
}


sky_sphere {
  pigment {
    gradient x
    color_map {
      [0 color Red]
      [1 color Yellow]
    }
    scale 2
    translate -1
  }
}

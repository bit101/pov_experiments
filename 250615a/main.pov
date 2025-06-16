#version 3.7;
#include "stdinc.inc"
#include "textures.inc"
#include "stones.inc"
#include "../lib/objects.inc"
#include "../lib/funcs.inc"

global_settings { 
  assumed_gamma 1 
  ambient_light 0.3
}

#declare R1 = seed(1234);

light_source {
  <-4, 6, -12>
  White * 0.3
}

light_source {
  <8, 8, -8>
  White  * 0.3
}

camera {
  right x * image_width / image_height
  location <10, sin(pi*2*clock) * 8 - 2, -16>
  look_at  <0, 0, 0>
}

#macro PartitionX(X, Z)
  #local PHeight = rand(R1)*2;
  #if (PHeight < 0.75)
    #local PHeight = 0;
  #end
  #local PWidth = 2;
  #if (rand(R1) < 0.5 & PHeight > 1.5)
    #local PWidth = 0.5;
  #end
  #local PX = rand(R1) * (2-PWidth);
  box {
    <X+PX, 0, Z>
    <X+PX+PWidth, PHeight, Z+0.1>
  }
#end

#macro PartitionZ(X, Z)
  #local PHeight = rand(R1)*2;
  #if (PHeight < 0.75)
    #local PHeight = 0;
  #end
  #local PWidth = 2;
  #if (rand(R1) < 0.5 & PHeight> 1.5)
    #local PWidth = 0.5;
  #end
  #local PZ = rand(R1) * (2-PWidth);
  box {
    <X, 0, Z+PZ>
    <X+0.1, PHeight, Z+PZ+PWidth>
  }
#end

#declare Floor = box {
  <-10, 0, -10>
  <10.1, 0.1, 10.1>
};

#declare RedLight = true;

#declare Globe = sphere {
  <0, 0.1, 0> 0.1
};

#macro GlobeLight(X, Z)
  #local LightColor = rgb <0.9, 0.7, 0.3>;
  #if (RandomBool(R1))
    #local LightColor = rgb <0.5, 0.5, 0.7>;
  #end
  #if (RedLight & RandomWeightedBool(0.05, R1))
    #declare RedLight = false;
    #local LightColor = rgb <1, 0, 0>;
  #end
  #if (rand(R1) < 0.2 & Z < 9) 
    light_source {
      <X + 1, 1.9, Z+1>
      LightColor
      looks_like {
        object {
          Globe
          pigment { LightColor }
        }
      }
    }
  #end
#end


union {
  #for (Y, -10, 4, 2)
    union {
      object {Floor}
      #for (Z, -10, 10, 2)
        #for (X, -10, 9 2)
          PartitionX(X, Z)
          GlobeLight(X, Z)
        #end
      #end
      #for (Z, -10, 9, 2)
        #for (X, -10, 10, 2)
          PartitionZ(X, Z)
        #end
      #end
      translate Y*y
    }
  #end
  box {
    <-10.2, 6, -10.2>
    <10.3, 7, 10.3>
  }
  box {
    <-9.8, -10, -9.8>
    <-10.2, 6, -10.2>
  }
  box {
    <-9.8, -10, 9.9>
    <-10.2, 6, 10.3>
  }
  box {
    <9.9, -10, -9.8>
    <10.3, 6, -10.2>
  }
  box {
    <9.9, -10, 9.9>
    <10.3, 6, 10.3>
  }
  pigment {
    rgb 0.1
  }
  rotate 360*clock*y
}
sky_sphere {
  pigment {
    gradient y
    color_map {
      [0 color Black]
      [1 color Gray05]
    }
    scale 2
    translate -1
  }
}

#declare R1 = seed(1234);
#macro RandomBool(RNG)
  #local B = false;
  #if (rand(RNG) < 0.5)
    #local B = true;
  #end
  B
#end

#macro RandomWeightedBool(W, RNG)
  #local B = false;
  #if (rand(RNG) < W)
    #local B = true;
  #end
  B
#end

/////////////////////////////////////
// Zero walls and desks
/////////////////////////////////////
// #macro PartitionX(X, Z)
//   #local PHeight = rand(R1)*2;
//   #if (PHeight < 0.75)
//     #local PHeight = 0;
//   #end
//   #local PWidth = 2;
//   #if (rand(R1) < 0.5 & PHeight > 1.5)
//     #local PWidth = 0.5;
//   #end
//   #local PX = rand(R1) * (2-PWidth);
//   box {
//     <0, 0, 0>
//     <0, 0, 0>
//   }
// #end

// #macro PartitionZ(X, Z)
//   #local PHeight = rand(R1)*2;
//   #if (PHeight < 0.75)
//     #local PHeight = 0;
//   #end
//   #local PWidth = 2;
//   #if (rand(R1) < 0.5 & PHeight> 1.5)
//     #local PWidth = 0.5;
//   #end
//   #local PZ = rand(R1) * (2-PWidth);
//   box {
//     <0, 0, 0>
//     <0, 0, 0>
//   }
// #end

// #macro Desk(X, Z)
//   #local Dx = X + rand(R1) * 1.25;
//   #local Dz = Z + rand(R1) * 1.25;
//   #local Dy = rand(R1) * 0.3 + 0.45;
//   box {
//     #if (RandomBool(R1))
//       <1000, 0, 0>
//       <1000, 0, 0>
//     #else
//       <1000, 0, 0>
//       <1000, 0, 0>
//     #end
//     pigment {rgb rand(R1) * 0.5 + 0.1 }
//   }
//   #if (RandomWeightedBool(0.2, R1))
//     cylinder {
//       <1000, 0, 0>
//       <1000, 0.01, 0>
//       0.05 + rand(R1) * 0.025
//       pigment {
//         rgb <rand(R1) * 0.4 + 0.25, rand(R1) * 0.4 + 0.25,rand(R1) * 0.4 + 0.25>
//       }
//     }
//   #end
// #end
/////////////////////////////////////
// END - Zero walls and desks
/////////////////////////////////////

/////////////////////////////////////
// Grow walls and desks
/////////////////////////////////////
// to shrink...
#declare Clock = 1-clock;
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
    <X+PX+PWidth, PHeight*Clock, Z+0.1>
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
    <X+0.1, PHeight*Clock, Z+PZ+PWidth>
  }
#end

#macro Desk(X, Z)
  #local Dx = X + rand(R1) * 1.25;
  #local Dz = Z + rand(R1) * 1.25;
  #local Dy = rand(R1) * 0.3 + 0.45;
  box {
    #if (RandomBool(R1))
      <Dx, 0.05, Dz>
      <Dx + 0.75, Dy*Clock, Dz + 0.5>
    #else
      <Dx, 0.05, Dz>
      <Dx + 0.5, Dy*Clock, Dz + 0.75>
    #end
    pigment {rgb rand(R1) * 0.5 + 0.1 }
  }
  #if (RandomWeightedBool(0.2, R1))
    cylinder {
      <Dx + 0.25, 0.05, Dz + 0.38>
      <Dx + 0.25, (Dy + 0.2)*Clock, Dz + 0.38>
      0.05 + rand(R1) * 0.025
      pigment {
        rgb <rand(R1) * 0.4 + 0.25, rand(R1) * 0.4 + 0.25,rand(R1) * 0.4 + 0.25>
      }
    }
  #end
#end
/////////////////////////////////////
// END - Grow walls and desks
/////////////////////////////////////

/////////////////////////////////////
// Full walls and desks
/////////////////////////////////////
// #macro PartitionX(X, Z)
//   #local PHeight = rand(R1)*2;
//   #if (PHeight < 0.75)
//     #local PHeight = 0;
//   #end
//   #local PWidth = 2;
//   #if (rand(R1) < 0.5 & PHeight > 1.5)
//     #local PWidth = 0.5;
//   #end
//   #local PX = rand(R1) * (2-PWidth);
//   box {
//     <X+PX, 0, Z>
//     <X+PX+PWidth, PHeight, Z+0.1>
//   }
// #end

// #macro PartitionZ(X, Z)
//   #local PHeight = rand(R1)*2;
//   #if (PHeight < 0.75)
//     #local PHeight = 0;
//   #end
//   #local PWidth = 2;
//   #if (rand(R1) < 0.5 & PHeight> 1.5)
//     #local PWidth = 0.5;
//   #end
//   #local PZ = rand(R1) * (2-PWidth);
//   box {
//     <X, 0, Z+PZ>
//     <X+0.1, PHeight, Z+PZ+PWidth>
//   }
// #end

// #macro Desk(X, Z)
//   #local Dx = X + rand(R1) * 1.25;
//   #local Dz = Z + rand(R1) * 1.25;
//   #local Dy = rand(R1) * 0.3 + 0.45;
//   box {
//     #if (RandomBool(R1))
//       <Dx, 0.05, Dz>
//       <Dx + 0.75, Dy, Dz + 0.5>
//     #else
//       <Dx, 0.05, Dz>
//       <Dx + 0.5, Dy, Dz + 0.75>
//     #end
//     pigment {rgb rand(R1) * 0.5 + 0.1 }
//   }
//   #if (RandomWeightedBool(0.2, R1))
//     cylinder {
//       <Dx + 0.25, 0.05, Dz + 0.38>
//       <Dx + 0.25, (Dy + 0.2), Dz + 0.38>
//       0.05 + rand(R1) * 0.025
//       pigment {
//         rgb <rand(R1) * 0.4 + 0.25, rand(R1) * 0.4 + 0.25,rand(R1) * 0.4 + 0.25>
//       }
//     }
//   #end
// #end
/////////////////////////////////////
// END - Full walls and desks
/////////////////////////////////////

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
  // #local LightColor = LightColor * clock;
  #if (rand(R1) < 0.2) 
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


#declare Building = union {
  #for (Y, -10, 4, 2)
    union {
      object {Floor}
      #for (Z, -10, 10, 2)
        #for (X, -10, 9 2)
          PartitionX(X, Z)
          #if (Z < 9)
            GlobeLight(X, Z)
            Desk(X, Z)
          #end
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
    <10.3, 8, 10.3>
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
  text {
    ttf "cyrvetic.ttf" "bit101" 1, 0
    scale <0.9, 0.9, 0.2>
    rotate 180*y
    translate <-1.5, -1.9, 9.9>
    pigment { rgb 0.4}
  }
  pigment {
    rgb 0.1
  }
}


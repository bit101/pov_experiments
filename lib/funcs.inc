// Creates a random number generator with the seed based on the current time.
#macro RandomSeed()
  seed(now * 24 * 60 * 60)
#end

// Creates a random RGB color.
#macro RandomRGB(RNG)
  rgb <rand(RNG), rand(RNG), rand(RNG)>
#end

#macro RandomBool(RGB)
  #local B = false;
  #if (rand(RGB) < 0.5)
    #local B = true;
  #end
  B
#end

#macro RandomWeightedBool(W, RGB)
  #local B = false;
  #if (rand(RGB) < W)
    #local B = true;
  #end
  B
#end

// Creates a 3D vector with random values on each axis from -Range to +Range.
#macro RandomLocation(Range, RNG) 
  <
    rand(RNG) * Range * 2 - Range,
    rand(RNG) * Range * 2 - Range,
    rand(RNG) * Range * 2 - Range
    >
#end

// Creates a box of the given dimensions, centered on the origin.
#macro Box(W, H, D)
  box {
    <-W/2, -H/2, -D/2>
    <W/2, H/2, D/2>
  }
#end


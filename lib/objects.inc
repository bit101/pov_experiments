#declare RedBlueSky =
sky_sphere {
  pigment {
    gradient y
    color_map {
      [0 color Red]
      [1 color Blue]
    }
    scale 2
    translate 1*y
  }
}

#declare BlueWhiteSky =
sky_sphere {
  pigment {
    gradient y
    color_map {
      [0 color Blue]
      [1 color White]
    }
    scale 2
    translate 1*y
  }
}

#declare BlackWhiteSky =
sky_sphere {
  pigment {
    gradient y
    color_map {
      [0 color Black]
      [1 color White]
    }
    scale 2
    translate 1*y
  }
}

// Package main ...
package main

import (
	"fmt"
	"math"
	"os"
	"strings"

	"github.com/bit101/bitlib/blmath"
)

func main() {
	blobs := strings.Builder{}
	radius := 0.98
	for t := 0.0; t < 4; t++ {
		angle := t / 4 * blmath.Tau
		x := math.Cos(angle) * radius
		z := math.Sin(angle) * radius
		blobs.WriteString(fmt.Sprintf(sphere, x, -radius/math.Sqrt2, z))
		blobs.WriteString(fmt.Sprintf(sphere, x, radius/math.Sqrt2, z))
	}
	out := fmt.Sprintf(blobby, blobs.String())
	os.WriteFile("generated.inc", []byte(out), 0777)
}

const sphere = `
  sphere {
    <%f, %f, %f> 1, 2
  }`

const blobby = `
#declare Blobby = blob {
  threshold 1
  %s
}
`

// #declare Radius = 0.99;
// #for (i, 0, 3)
//   #declare Angle = i / 4 * pi*2;
//   sphere {
//     <cos(Angle) * Radius, -Radius / sqrt(2), sin(Angle) * Radius> 1, 2
//   }
// #end
// #for (i, 0, 3)
//   #declare Angle = i / 4 * pi*2;
//   sphere {
//     <cos(Angle) * Radius, Radius / sqrt(2), sin(Angle) * Radius> 1, 2
//   }
// #end

// Package main is the main program
package main

import (
	"os"
	"strings"
)

//////////////////////////////
// MAIN
//////////////////////////////

func main() {
	box := strings.ReplaceAll(fractalSphereTemplate, "$subtype$", fractalSphereTemplate)
	box = strings.ReplaceAll(box, "$subtype$", fractalSphereTemplate)
	box = strings.ReplaceAll(box, "$subtype$", fractalSphereTemplate)
	box = strings.ReplaceAll(box, "$subtype$", fractalSphereTemplate)
	// box = strings.ReplaceAll(box, "$subtype$", `box {
	// <-0.5, -0.5, -0.5>
	// <0.5, 0.5, 0.5>`)
	box = strings.ReplaceAll(box, "$subtype$", `sphere {
    <0, 0, 0>, 0.5`)
	os.WriteFile("../box.inc", []byte("#declare FBox="+box+"}"), 0777)

}

const fractalSphereTemplate = `union {
  sphere {
    <0, 0, 0> 0.5
  }
  $subtype$ 
    translate 1.5*x
    scale 0.5
  }
  $subtype$ 
    translate 1.5*x
    scale 0.5
    rotate 90*z
  }
  $subtype$ 
    translate 1.5*x
    scale 0.5
    rotate -90*z
  }
  $subtype$ 
    translate 1.5*x
    scale 0.5
    rotate 90*y
  }
  $subtype$ 
    translate 1.5*x
    scale 0.5
    rotate -90*y
  }`

const fractalTemplate = `union {
  box {
    <-0.5, -0.5, -0.5>
    <0.5, 0.5, 0.5>
  }
  $subtype$ 
    translate 1.5*x
    scale 0.5
  }
  $subtype$ 
    translate 1.5*x
    scale 0.5
    rotate 90*z
  }
  $subtype$ 
    translate 1.5*x
    scale 0.5
    rotate -90*z
  }
  $subtype$ 
    translate 1.5*x
    scale 0.5
    rotate 90*y
  }
  $subtype$ 
    translate 1.5*x
    scale 0.5
    rotate -90*y
  }`

// const fractalTemplate = `
// union {
//   box {
//     <-0.5, -0.5, -0.5>
//     <0.5, 0.5, 0.5>
//   }
//   box {
//     <-0.25, -0.25, -0.25>
//     <0.25, 0.25, 0.25>
//     translate 1.5*x
//   }
//   box {
//     <-0.25, -0.25, -0.25>
//     <0.25, 0.25, 0.25>
//     translate 1.5*x
//     rotate 90*z
//   }
//   box {
//     <-0.25, -0.25, -0.25>
//     <0.25, 0.25, 0.25>
//     translate 1.5*x
//     rotate -90*z
//   }
//   box {
//     <-0.25, -0.25, -0.25>
//     <0.25, 0.25, 0.25>
//     translate 1.5*x
//     rotate 90*y
//   }
//   box {
//     <-0.25, -0.25, -0.25>
//     <0.25, 0.25, 0.25>
//     translate 1.5*x
//     rotate -90*y
//   }
// }`
// }

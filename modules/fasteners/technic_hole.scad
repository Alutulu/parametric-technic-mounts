// This module defines the geometry for a LEGO Technic pin hole.
// It is used to subtract the hole from a solid shape.

include <../../parameters.scad>

// Module for a LEGO Technic pin hole
// Diameter adjusted for 3D printing (e.g., 4.9 mm)
module technic_hole() {
  union() {
    translate([0, 0, beam_height / 2])
      cylinder(d = extremity_hole_diameter + 2*drool, h = 2, $fn = 50, center = true);
    translate([0, 0, -beam_height / 2])
      cylinder(d = extremity_hole_diameter + 2*drool, h = 2, $fn = 50, center = true);
  }
  cylinder(d = technic_hole_diameter + 2*drool, h = beam_height + 2, $fn = 50, center = true);
}
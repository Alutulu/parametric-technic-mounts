// This module defines the base geometry of a LEGO Technic compatible beam.

include <../parameters.scad>

// Module for a LEGO Technic beam with rounded ends, centered at the origin
// The length is in LEGO units (1 unit = 8mm)
module technic_beam(length_units) {
  // We check if the beam is long enough to have a central linear part
  if (length_units > 1) {
    // Length of the central rectangular part of the beam
    linear_part_length = (length_units * 8) - beam_width; 

    // Use hull() to create the rounded shape
    hull() {
      // Cylinder for the first rounded end (left side)
      translate([-linear_part_length / 2, 0, 0])
        cylinder(r = round_radius, h = beam_height, $fn = 50, center = true);

      // Cylinder for the second rounded end (right side)
      translate([linear_part_length / 2, 0, 0])
        cylinder(r = round_radius, h = beam_height, $fn = 50, center = true);
    }
  } else {
    // For a 1-unit beam, it's just a single cylinder
    cylinder(r = round_radius, h = beam_height, $fn = 50, center = true);
  }
}
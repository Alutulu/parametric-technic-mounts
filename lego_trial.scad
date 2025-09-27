// User parameters
drool = 0.25; // Extra material to account for 3D printing inaccuracies
beam_length_units = 3; // Beam length in LEGO units (1 unit = 8mm)

// Parameter definitions
technic_hole_diameter = 4.9; // Diameter for Technic pin holes, adjusted for 3D printing
extremity_hole_diameter = 5.9; // Diameter for extremity holes, adjusted for 3D printing
beam_width = 8; // Standard Technic beam width
beam_height = 8; // Standard Technic beam height
round_radius = beam_width / 2; // Radius for the rounded ends, typically half the beam width

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

// Final part creation
difference() {
  // 1. The base beam, now properly centered at the origin
  technic_beam(beam_length_units);

  // 2. Drilling the holes in a loop
  for (i = [0 : beam_length_units - 1]) {
    // Position of each hole, relative to the beam's center
    // We adjust the x-position to get to the first hole, then add 8mm for each subsequent hole
    translate([ -((beam_length_units - 1) * 8) / 2 + (i * 8), 0, 0]) 
      technic_hole();
  }
}
// Parameter definitions
beam_length = 3; // Beam of 3 units (3 x 8mm)

// Module for a LEGO Technic pin hole
// Diameter adjusted for 3D printing (e.g., 4.9 mm)
module technic_hole() {
  cylinder(d = 4.9, h = 10, $fn = 50); 
}

// Module for a LEGO Technic beam
// The length is in LEGO units (1 unit = 8mm)
module technic_beam(length_units) {
  beam_width = 8;
  beam_height = 8;

  cube([length_units * 8, beam_width, beam_height]);
}

// Final part creation
difference() {
  // 1. The base beam
  technic_beam(beam_length);

  // 2. Drilling the holes in a loop
  for (i = [0:beam_length - 1]) {
    // Positioning each hole
    // (the -1mm on the Z axis ensures the hole passes through the entire part)
    translate([4 + i * 8, 4, -1]) 
      technic_hole();
  }
}
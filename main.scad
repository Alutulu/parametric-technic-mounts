// This is the main file for your parametric parts.
// All you need to do is adjust the user parameters below and render!

include <./parameters.scad>
include <./modules/technic_base.scad>
include <./modules/fasteners/technic_hole.scad>
include <./modules/fasteners/square_mount.scad>
include <./modules/peg_plate.scad>

// USER PARAMETERS
beam_length_units = 4;
mount_side = 6;
mount_hole_diameter = 3;
mount_height = 2;
mount_positions_x = [-8]; // from x=0 (middle of the beam)

// FINAL ASSEMBLY
difference() {
  union() {
  // 1. The base beam
    technic_beam(beam_length_units);
    // 2. Placing the square mount on the beam
    for (pos_x = mount_positions_x) {
      translate([pos_x, 0 , 0])
        square_mount(
          side = mount_side, 
          hole_diameter = mount_hole_diameter, 
          height = mount_height,
          is_on_top=true,
          is_on_left=false
        );
    }
  }
  for (i = [0 : beam_length_units - 1]) {
    translate([ -((beam_length_units - 1) * 8) / 2 + (i * 8), 0, 0])
      technic_hole();
  }
  
}
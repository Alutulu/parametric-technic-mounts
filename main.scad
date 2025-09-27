// This is the main file for your parametric parts.
// All you need to do is adjust the user parameters below and render!

include <./parameters.scad>
include <./modules/technic_base.scad>
include <./modules/fasteners/technic_hole.scad>
include <./modules/fasteners/square_mount.scad>

// USER PARAMETERS
beam_length_units = 5;
mount_side = 6;
mount_hole_diameter = 3;
mount_height = 2;

// FINAL ASSEMBLY
union() {
  // 1. The base beam
  difference() {
    technic_beam(beam_length_units);
    for (i = [0 : beam_length_units - 1]) {
      translate([ -((beam_length_units - 1) * 8) / 2 + (i * 8), 0, 0])
        technic_hole();
    }
  }
  
  // 2. Placing the square mount on the beam
  square_mount(side = mount_side, hole_diameter = mount_hole_diameter, height = mount_height);
}
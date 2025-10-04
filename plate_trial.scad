// This is the main file for your parametric parts.
// All you need to do is adjust the user parameters below and render!

include <./parameters.scad>
include <./modules/technic_base.scad>
include <./modules/fasteners/technic_hole.scad>
include <./modules/fasteners/square_mount.scad>
include <./modules/peg_plate.scad>

// USER PARAMETERS
peg_plate_length = 30;
peg_plate_width = 22;
peg_plate_height = 2;
peg_radius = 2.7/2;
peg_length = 17;

// List of [x, y] coordinates for the pegs (relative to the plate's center)
peg_mount_positions = [
    [-10, -8.5],
    [-10, 8.5],
]; 

// FINAL ASSEMBLY
peg_plate(
        plate_length = peg_plate_length, 
        plate_width = peg_plate_width, 
        plate_height = peg_plate_height,
        peg_radius = peg_radius,
        peg_length = peg_length,
        peg_positions = peg_mount_positions
    );
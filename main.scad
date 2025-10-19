// This is the main file for your parametric parts.
// All you need to do is adjust the user parameters below and render!

include <./parameters.scad>
include <./modules/technic_base.scad>
include <./modules/fasteners/technic_hole.scad>
include <./modules/fasteners/square_mount.scad>
include <./modules/peg_plate.scad>
include <./modules/fasteners/corner.scad>
include <./modules/fasteners/tt_motor_mount.scad>

// USER PARAMETERS
beam_length_units = 9;
mount_side = 5.5;
mount_hole_diameter = 3;
mount_height = 2;
mount_positions_x = [-58.8/2, +58.8/2]; // from x=0 (middle of the beam)

// USER PARAMETERS
peg_plate_length = 10;
peg_plate_width = 22;
peg_plate_height = 2;
peg_radius = 3.2/2;
peg_length = 20;

// CORNER PARAMETERS
corner_thickness = 2.5;
corner_length = 12;
corner_round_radius = 3.2;



// List of [x, y] coordinates for the pegs (relative to the plate's center)
peg_mount_positions = [
    [0, -8.8],
    [0, 8.8],
]; 

// FINAL ASSEMBLY
// difference() {
//   union() {
//   // 1. The base beam
//     technic_beam(beam_length_units);
//     // 2. Placing the square mount on the beam
//     for (pos_x = mount_positions_x) {
//       translate([pos_x, 0 , 0])
//         square_mount(
//           side = mount_side, 
//           hole_diameter = mount_hole_diameter, 
//           height = mount_height,
//           y_extension=2,
//           is_on_top=false,
//           is_on_left=true
//         );
//     }

//   // 3. Cubic corners
//   // rotate([0,0,0])
//   // translate([-corner_length/2,beam_width/2 - join_margin,-beam_height/2])
//   //   rotate([0,0,90])
//   //   translate([0,-corner_length,0])
//   //   corner_mount(length = corner_length, thickness = corner_thickness, round_radius=corner_round_radius);



//     // rotate([0, 0, 90]) {
//     //   translate([peg_plate_length/2 + beam_width/2 - join_margin/2, 0, -peg_plate_height/2 + beam_height / 2])
//     //     peg_plate(
//     //         plate_length = peg_plate_length, 
//     //         plate_width = peg_plate_width, 
//     //         plate_height = peg_plate_height,
//     //         peg_radius = peg_radius,
//     //         peg_length = peg_length,
//     //         peg_positions = peg_mount_positions
//     //     );
//     // }
//   }
//   for (i = [0 : beam_length_units - 1]) {
//     translate([ -((beam_length_units - 1) * 8) / 2 + (i * 8), 0, 0])
//       technic_hole();
//   }
// }

// Example: TT motor mount cylinder
// translate([50, 0, 0])
  TT_motor_mount(d=5.42, h=25, hole_d=2, width=3.65);

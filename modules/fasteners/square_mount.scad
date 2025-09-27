// This module defines a simple, parametric square mount with a countersunk hole.

include <../../parameters.scad>

// The dimensions are fully customizable
module square_mount(side = 6, hole_diameter = 3, height = 2, is_on_top = false, is_on_left = false) {
  join_margin = 0.5; // Margin to ensure the hole doesn't touch the edges
  screw_head_diameter = 6; // Diameter for the countersink (for a typical 3mm screw head)
  countersink_height = 2; // Height of the countersink

  mount_z_offset = is_on_top ? beam_height/2 - height/2 : -beam_height/2 + height/2;
  mount_y_offset = is_on_left ? -beam_width/2 - mount_side/2 : beam_width/2 + mount_side/2;

  translate([0, mount_y_offset, mount_z_offset]) {

    difference() {
      margin_y_offset = is_on_left ? join_margin/2 : -join_margin/2;
      // Base of the mount
      translate([0,margin_y_offset,0])
        cube([side, side + join_margin, height], center = true);
        
      // The union of shapes to subtract from the mount's base
      union() {
        // 1. The main hole for the screw shaft
        cylinder(d = hole_diameter + 2*drool, h = height + 2, $fn = 50, center = true);
        
        // 2. The countersink for the screw head
        translate([0, 0, (height / 2) - countersink_height])
          cylinder(d1 = hole_diameter + 2*drool, d2 = screw_head_diameter + 2*drool, h = countersink_height + 2, $fn = 50);
      }
    }
  }
}
// This module defines a corner mount composed of three orthogonal square plates.

include <../../parameters.scad>

/**
 * Creates a corner mount where three square plates meet at a single point.
 * The internal corner is at the origin [0, 0, 0].
 * * @param length The side length of the square plates (excluding thickness).
 * @param thickness The uniform thickness of all three plates.
 */
module corner_mount(length = 20, thickness = 5, round_radius = 4) {
    
    // Safety check to ensure positive dimensions
    if (length > 0 && thickness > 0) {
        
        union() {
            // 1. The solid corner block
            // This is the small cube where the three plates meet.
            // cube([thickness, thickness, thickness], center = false);
            
            // 2. Plate on the X-Y plane (the "base")
            // Extends along X and Y, starting from the corner block's edge.
            union() {
                translate([thickness, thickness, 0]) {
                    difference() {
                        cube([round_radius, round_radius, length], center = false);
                        translate([round_radius, round_radius, (thickness + length) / 2])
                        cylinder(d = round_radius*2, h = length - thickness + join_margin*2, $fn = 50, center = true);
                    }
                }

                cube([length, length, thickness], center = false);
            
                cube([length, thickness, length], center = false);
            
                cube([thickness, length, length], center = false);

            }
            
            // 3. Plate on the X-Z plane (the "back")
            // Extends along X and Z, starting from the corner block's edge.
            // translate([thickness, 0, thickness])
            //     cube([length, thickness, thickness], center = false);
            
            // translate([0, 0, thickness])
            //     cube([thickness, thickness, length], center = false);
            
            // 4. Plate on the Y-Z plane (the "side")
            // Extends along Y and Z, starting from the corner block's edge.
            // translate([0, thickness, thickness])
            //     cube([thickness, length, thickness], center = false);
            
            // translate([0, thickness, 0])
            //     cube([thickness, thickness, length], center = false);
        }
    }
}
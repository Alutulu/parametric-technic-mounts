// This module generates a rectangular plate with multiple perpendicular pegs (cylinders).

include <../parameters.scad>

/**
 * Creates a rectangular plate with an array of pegs.
 * * @param plate_length The length (X-axis) of the base plate.
 * @param plate_width The width (Y-axis) of the base plate.
 * @param plate_height The height (Z-axis) of the base plate.
 * @param peg_radius The radius of all pegs.
 * @param peg_length The length of all pegs.
 * @param peg_positions A list of [x, y] coordinates for each peg.
 */
module peg_plate(plate_length, plate_width, plate_height, 
                 peg_radius, peg_length, peg_positions) {
    
    // Safety check to prevent errors if radius is too small or list is empty
    if (peg_radius > 0 && len(peg_positions) > 0) {
        

        // Group the plate and the pegs
        union() {
            // 1. The base plate
            // The plate is centered on the X/Y axes
            cube([plate_length, plate_width, plate_height], center = true);
            
            // 2. The pegs
            for (pos = peg_positions) {
                // Pos[0] is X, Pos[1] is Y
                translate([pos[0], pos[1], plate_height/2]) {
                    // The peg starts from the top surface (plate_height/2)
                    // We add a small drool to the radius for 3D printing tolerance
                    cylinder(r = peg_radius - drool, 
                             h = peg_length, 
                             $fn = 50, 
                             center = false // Starts from Z=0 of this translate block
                    );
                }
            }
        }
    } else {
        // Fallback: If no pegs are defined, just show the plate
        cube([plate_length, plate_width, plate_height], center = true);
    }
}

// TT_motor_mount.scad
include <../../parameters.scad>

module TT_motor_mount(d=25, h=20, hole_d=0, width=3.5, center=true, $fn=128) {
    if (d <= 0 || h <= 0) {
        echo("TT_motor_mount: invalid dimensions");
    } else {
        difference() {
            cylinder(d=d - 2*drool, h=h, $fn=$fn, center=true);

            if (hole_d > 0) {
                cylinder(d=hole_d + 2*drool, h=h + 2*join_margin, $fn=$fn, center=true);
            }

            translate([0,d/2 + width/2 - drool,0])
                cube([5,5,h + 2*join_margin], center = true);
            translate([0,-(d/2 + width/2 - drool),0])
                cube([5,5,h + 2*join_margin], center = true);
        }
    }
}

// Simple visual wrapper
module TT_motor_mount_show(d=25, h=20, hole_d=0, width=3.5, center=true, $fn=128, color_value=[0.6,0.6,0.6]) {
    color(color_value)
        TT_motor_mount(d, h, hole_d, width, center, $fn);
}

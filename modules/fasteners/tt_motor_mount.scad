// TT_motor_mount.scad
include <../../parameters.scad>

module TT_motor_mount(d=25, h=20, hole_d=0, width=3.5, cross_height=10, cross_width=5, cross_thickness=1.8, join_width=1.5, separation_length=2, center=true, $fn=128) {
    union() {
        color([0.8,0.4,0.4]) {
            translate([0,0,h/2]) {
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
        }
        union() {
            translate([0,0,-cross_height/2]) {
                difference() {
                    cylinder(d=cross_width+join_width, h=cross_height, $fn=$fn, center=true);
                    cube([cross_width,cross_thickness,cross_height+join_margin], center = true);
                    rotate([0, 0, 90])
                    cube([cross_width,cross_thickness,cross_height+join_margin], center = true);
                }
            }
            difference() {
                cylinder(d=cross_width+join_width, h=separation_length, $fn=$fn, center=true);
                if (hole_d > 0) {
                    cylinder(d=hole_d + 2*drool, h=h + 2*join_margin, $fn=$fn, center=true);
                }
            }
        }
    }
}

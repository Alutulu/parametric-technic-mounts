// This file centralizes all global parameters and constants for the project.
// Modules should include this file to access these values.

// General printing and tolerance settings
drool = 0.25; // Extra material to account for 3D printing inaccuracies

// LEGO Technic system dimensions (in mm)
beam_width = 8;
beam_height = 8;
round_radius = beam_width / 2;

// Hole dimensions for compatibility
technic_hole_diameter = 4.9; // Diameter for Technic pin holes
extremity_hole_diameter = 5.9; // Diameter for extremity holes

// Screw mount dimensions (for a common M3 screw)
screw_diameter = 3; 
screw_head_diameter = 6;
countersink_height = 2;
join_margin = 0.5;
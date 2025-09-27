// Paramètres
brique_largeur = 2;
brique_longueur = 4;
diametre_vis = 3.5;

// Module pour une brique de base
module brique() {
  cube([brique_largeur * 8, brique_longueur * 8, 9.6]);
  // ... Ajout de la logique pour les tenons ...
}

// Module pour le trou de vis
module trou_de_vis() {
  cylinder(d=diametre_vis, h=15, $fn=50); // $fn augmente la qualité du cercle
}

// Création de la pièce finale
difference() {
  brique();
  translate([8, 8, -1])
    trou_de_vis();
}
// --- Parameter ---
platte_breite = 200;
platte_hoehe = 60;
platte_tiefe = 15; 

pin_d = 8.2;
pin_loch_tiefe = 13;  

flasche_innen = 40;   
flasche_hoehe = 8;    
flasche_aussen = flasche_innen + 10; 

anzahl_halter = 4; 
lochabstand_einheit = 38; 
anzahl_loecher = 3; 
rand_puffer = 4; 

$fn = 60; 

// --- Berechnungen ---
gesamtbreite_halter = anzahl_halter * flasche_aussen;
start_x_halter = -gesamtbreite_halter / 2;

module montageplatte() {
    nutzbare_breite = platte_breite - (2 * rand_puffer);
    max_schritte = floor(nutzbare_breite / lochabstand_einheit);
    max_loecher = max_schritte + 1;
    loecher = min(anzahl_loecher, max_loecher);
    
    spannweite = max_schritte * lochabstand_einheit;
    
    difference() {
        // Grundplatte
        translate([-platte_breite/2, 0, 0])
            cube([platte_breite, platte_tiefe, platte_hoehe]);
        
        // Loch-Logik
        if (loecher > 1) {
            schritt_weite = floor(max_schritte / (loecher - 1)) * lochabstand_einheit;
            zentrierte_spannweite = (loecher - 1) * schritt_weite;
            for(i = [0 : loecher - 1]) {
                translate([-(zentrierte_spannweite/2) + i * schritt_weite, -1, platte_hoehe / 2])
                    rotate([-90, 0, 0])
                    cylinder(h = pin_loch_tiefe + 2, d = pin_d);
            }
        } else {
            translate([0, -1, platte_hoehe / 2])
                rotate([-90, 0, 0])
                cylinder(h = pin_loch_tiefe + 2, d = pin_d);
        }
    }
}

module flaschenhalter(x_pos) {
    stuetzen_dicke = 5;
    stuetzen_hoehe = platte_hoehe - flasche_hoehe; 
    stuetzen_tiefe = flasche_aussen; 
    z_arm = platte_hoehe - flasche_hoehe; 
    r_stuetze = platte_hoehe - flasche_hoehe; // Radius der Rundung

    union() {
        difference() {
            // Grundkörper Arm
            translate([x_pos, platte_tiefe, z_arm])
                cube([flasche_aussen, flasche_aussen, flasche_hoehe]);
            
            // Der Drop-In Schlitz (geschlossenes Loch)
            // Wir lassen hinten 5mm Platz zur Wand für mehr Stabilität
            translate([x_pos + (flasche_aussen - flasche_innen) / 2, platte_tiefe, z_arm - 1])
                cube([flasche_innen, flasche_innen+5, flasche_hoehe + 2]);
            
            // KORREKTUR: Fase an der belasteten Vorderkante des Ausschnitts
            // Die Kante liegt bei Y = platte_tiefe + 5 (Versatz) + flasche_innen
            translate([x_pos + flasche_aussen/2, platte_tiefe + 5 + flasche_innen, z_arm + flasche_hoehe])
                rotate([45, 0, 0])
                cube([flasche_innen, 6, 6], center=true);
        }

        // Stützen von unten (statisch optimal für Drop-In)
        for(off = [0, flasche_aussen - stuetzen_dicke]) {
            translate([x_pos + off, platte_tiefe, z_arm])
                rotate([90, 0, 90])
                linear_extrude(height = stuetzen_dicke)
                    polygon(points = [[0,0], [stuetzen_tiefe, 0], [0, -stuetzen_hoehe]]);
        }
        
        for(off = [0, flasche_aussen - stuetzen_dicke]) {
            translate([x_pos + off, platte_tiefe, z_arm])
                rotate([0, 00, 180])
                linear_extrude(height = stuetzen_dicke)
                    difference() {
                        // Ein Quadrat als Basis
                        translate([-r_stuetze, 0])
                            square([r_stuetze, r_stuetze]);
                        // Ein Kreis, der die Rundung herausschneidet (konkav)
                        translate([0, r_stuetze])
                            circle(r = r_stuetze);
                    }
        }
    }
}

// --- Render ---
montageplatte();
for(i = [0 : anzahl_halter - 1]) {
    flaschenhalter(start_x_halter + i * flasche_aussen);
}
//Differential Altazimuth Telescope Mount

include <MCAD/stepper.scad>
include <MCAD/bearing.scad>
include <MCAD/metric_fastners.scad>

include <gears/gears.scad>


//motors
translate([35,0,-28]) rotate([0,180,0]) motor(Nema17, 1, dualAxis=false);
translate([25,0,0]) rotate([0,90,0])rotate([0,0,180]) bevel_herringbone_gear_pair(modul=1, gear_teeth=37, pinion_teeth=18, axis_angle=90, tooth_width=7, gear_bore=22, pinion_bore=5, pressure_angle = 20, helix_angle=30, together_built=true);

translate([-35,0,-28]) rotate([0,180,0]) motor(Nema17, 1, dualAxis=false);
translate([-25,0,0]) rotate([0,-90,0]) bevel_herringbone_gear_pair(modul=1, gear_teeth=37, pinion_teeth=18, axis_angle=90, tooth_width=7, gear_bore=22, pinion_bore=5, pressure_angle = 20, helix_angle=30, together_built=true);

//base plate
translate([0,0,-65]) difference(){
    cylinder(d=120, h=5, center=true);
    cylinder(d=8, h=6, center=true);
}

//Support Beams
translate([48,0,0]) rotate([0,90,0])union(){
    difference(){
        translate([0,-20, -2.5])cube([65,40,10]);
        cylinder(d=8, h=8, center=true);
    }
}

translate([-53,0,0]) rotate([0,90,0])union(){
    difference(){
        translate([0,-20, -2.5])cube([65,40,10]);
        cylinder(d=8, h=8, center=true);
    }
}

//rotate([$t*360,0,0])
rotate([45,0,0])
union(){
//central axis
    rotate([0,90,0])cylinder(d=8, h=130, center=true);
//Telescope grip
    union(){
    translate([0,0,31.1]) difference(){
        cube([70,110,20], center=true);
        cylinder(d=8, h=51, center=true);
        translate([0,0,-5]) scale([1,3,1])rotate([0,0,45])cylinder(16,41,31,$fn=4);
        #translate([40,0,3]) rotate([0,-90,0]) bolt(4,20);
        translate([0,17.5,-4]) rotate([0,180,0])bolt(3,15);
        translate([0,-17.5,-4]) rotate([0,180,0])bolt(3,15);
        translate([17.5,0,-4]) rotate([0,180,0])bolt(3,15);
        translate([-17.5,0,-4]) rotate([0,180,0])bolt(3,15);

    }
}
    
//Differential gears
union(){
    translate([0,0,18])bearing(center=true);
    translate([0,0,-18])bearing(center=true);
    rotate([0,90,0])bearing(center=true);
    translate([25,0,0])rotate([0,90,0])bearing(center=true);
    translate([-25,0,0])rotate([0,90,0])bearing(center=true);
    translate([0,0,16])cylinder(d=8, h=12, center=true);
    translate([0,0,-16])cylinder(d=8, h=12, center=true);
    translate([0,0,20.5]) rotate([0,180,0])union(){
        bevel_herringbone_gear_pair(modul=2, gear_teeth=23, pinion_teeth=19, axis_angle=90, tooth_width=7, gear_bore=22, pinion_bore=22, pressure_angle = 30, helix_angle=30, together_built=true);
      }
    translate([0,0,-20.5]) union(){
         bevel_herringbone_gear_pair(modul=2, gear_teeth=23, pinion_teeth=19, axis_angle=90, tooth_width=7, gear_bore=22, pinion_bore=22, pressure_angle = 30, helix_angle=30, together_built=true);
      }
  }
}



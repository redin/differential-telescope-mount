//Differential Altazimuth Telescope Mount

include <MCAD/stepper.scad>
include <MCAD/bearing.scad>
include <MCAD/metric_fastners.scad>

include <gears/gears.scad>


//motors
translate([40,0,-60]) rotate([0,-90,0]) motor(Nema17, 1, dualAxis=false);
translate([-40,0,-60]) rotate([0,90,0]) motor(Nema17, 1, dualAxis=false);
//base plate
translate([0,0,-84]) difference(){
    cylinder(d=100, h=5, center=true);
    cylinder(d=8, h=6, center=true);
}

//Support Beams
translate([40,0,0]) rotate([0,90,0])union(){
    bearing(center=true);
    cylinder(d=8, h=30, center=true);
    difference(){
        translate([-15,-25, -2.5])cube([100,50,5]);
        cylinder(d=22, h=8, center=true);
        translate([60,0,0])cylinder(d=23, h=8, center=true);
        
    }
}

translate([-40,0,0]) rotate([0,90,0])union(){
    bearing(center=true);
    cylinder(d=8, h=30, center=true);
    difference(){
        translate([-15,-25, -2.5])cube([100,50,5]);
        cylinder(d=22, h=8, center=true);
        translate([60,0,0])cylinder(d=23, h=8, center=true);
    }
}

//rotate([$t*360,0,0])
union(){
//central axis
    cylinder(d=8, h=60, center=true);

//Telescope grip
    union(){
    translate([0,0,35.1]) difference(){
        cube([70,110,20], center=true);
        cylinder(d=22, h=51, center=true);
        translate([0,0,-5]) scale([1,3,1])rotate([0,0,45])cylinder(16,41,31,$fn=4);
        #translate([40,0,3]) rotate([0,-90,0]) bolt(4,20);
        translate([0,17.5,-4]) rotate([0,180,0])bolt(3,15);
        translate([0,-17.5,-4]) rotate([0,180,0])bolt(3,15);
        translate([17.5,0,-4]) rotate([0,180,0])bolt(3,15);
        translate([-17.5,0,-4]) rotate([0,180,0])bolt(3,15);

    }
}
    
//Differential gears
  translate([0,0,24.5]) rotate([0,180,0])union(){
      bearing(center=true);
      bevel_herringbone_gear_pair(modul=2, gear_teeth=29, pinion_teeth=23, axis_angle=90, tooth_width=7, gear_bore=22, pinion_bore=8, pressure_angle = 30, helix_angle=30, together_built=true);
  }

  translate([0,0,-24.5]) union(){
      bearing(center=true);
      bevel_herringbone_gear_pair(modul=2, gear_teeth=29, pinion_teeth=23, axis_angle=90, tooth_width=7, gear_bore=22, pinion_bore=8, pressure_angle = 30, helix_angle=30, together_built=true);
  }
}



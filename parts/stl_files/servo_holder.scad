// --- Printer setings ---
$fn = 25;
$fs = .4;
$fa = 1;

// --- Holder sides ---
module back_side(a=2) {
    translate([0,0,-10])
    rotate([90,0,0])
    difference() {
        color("black")
        cube([18.7,32,a]);
        translate([6.5,4.7,-.1])
            cube([12.3,22.5,a+1]);
        
        translate([6.5+6.1,2.3,-.1])
            cylinder(h=a+1,r=1.2);
        
        translate([6.5+6.1,27.3+2.3,-.1])
            cylinder(h=a+1,r=1.2);
    }
}

module left_side(a=2) {
    difference() {
        translate([0,-a,0])
            rotate([0,-90,0])
                color("green")
                cube([22,17+a,a]);

        translate([.1,17,0])
        rotate([0,-90,0])
            cylinder(h=a+2,r=7);
    }
}

module rigth_side(a=2) {
    union(){
        difference() {
            translate([18.7+a,-a,0])
                rotate([0,-90,0])
                    cube([22,17+a,a]);
                
            translate([18.7+a+.2,17,22-4.7-6])
                rotate([0,-90,0])    
                    cylinder(h=a+1,r=7);
        }


        difference() {
            translate([18.7+a,0,0])
                rotate([0,-90,0])    
                    cylinder(h=a,r=10);
                
            translate([18.7+a+.2,-10-a,-10])
                rotate([0,-90,0])
                    cube([20,10,a+2]);
        }
    }
}

module front_side(a=2) {
    difference() {
        translate([18.7-1,17,0])
        rotate([90,0,0])
            color("violet")
            cube([1,22,a]);
        
        translate([18.7+1,17,22-4.7-6])
            rotate([0,-90,0])    
                cylinder(h=a+1,r=7);
   }
}


// --- Servo holders ---
module servoHolderA(mm=2) {
    union() {
        back_side(mm);
        left_side(mm);
        rigth_side(mm);
        front_side(mm);
    }
}

module servoHolderB(mm=2) {
    mirror([1,0,0])
        servoHolderA(mm);
}

// --------------------------------------------

servoHolderA(mm=2);
servoHolderB(mm=2);

// --- Printer setings ---
$fn = 25;
$fs = .4;
$fa = 1;

// --- Components ---
module servo_back(a=2) {
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

module servo_left(a=2) {
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

module servo_rigth(a=2) {
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

module servo_front(a=2) {
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


// --- Parts ---
module partA(mm=2) {
    union() {
        servo_back(mm);
        servo_left(mm);
        servo_rigth(mm);
        servo_front(mm);
    }
}

module partB(mm=2) {
    mirror([1,0,0])
        partA(mm);
}

// --------------------------------------------

partA(mm=2);
partB(mm=2);



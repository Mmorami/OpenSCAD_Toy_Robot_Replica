module Skull(){
    color([0.9,0.9,0.81])
    for(i=[-1:2:1]){
        translate([i*8.25,0,0])
        Skull_Main();
        translate([i*-6.65,0,18])
        Skull_Bump();
    }
        
}

module Skull_Main(){
        /* Main cube */
        minkowski(){
            cube([15,30,30], true);
            sphere(3, $fn=80);
        }
}

module Skull_Bump(){
    /* Small bump on top */
    minkowski(){
        cube([12.5, 25, 1],true);
        sphere(1, $fn=60);
    }
}

module Face(){
    for (i=[-1:2:1]){
        translate([19.25,i*8,6]) Eye();
    }
    color([0.9,0.9,0.81]) translate([18.75,0,-2.3]) Nose();
    for (i=[-2:4:2]){
        color([1,1,1]) translate([19.05,0,-10+i]) Mouth(i);
    }
}
module Eye(){
    /* Red outter circles */
    color([1,0,0])    
    difference(){
        rotate([0,90,0]) circle(6, $fn=30);
        rotate([0,90,0]) circle(5.1, $fn=30);
    }
    /* Yellow inner circles */
    color([1,1,0.6])
    rotate([0,90,0]) circle(2.3, $fn=30);
}

module Nose(){
    /* Nose */
    minkowski(){
        rotate([0,-90,]) scale([2.2,1.2,1]) cylinder(1, 0, 2.2, $fn=3);
        sphere(1,$fn=50);
    }
}
module Mouth(i){
    /* Mouth */
    difference(){
        rotate([0,i,0]) cube([0.4,20,4],true);
        translate([1.1,0,i*-1])rotate([90,0,0]) cylinder(19.5,1,1,$fn=50, true);
    }
}
module Ears(){
    color([1,0,0]) Concha();
    for(i=[-1:2:1]){
        color([0.6,0.6,0.6]) translate([0,i*24,12.35])Antenas();
            color([1,0,0]) translate([0,0,-4]) Antenas_Tops(i);
    }
}
module Concha(){
    hull(){
        rotate([90,0,0]) cylinder(38.5,7.5,7.5, $fn=60, true);
        rotate([90,0,0]) cylinder(40.5,6.5,6.5, $fn=60, true);
    }
    hull(){
        rotate([90,0,0]) cylinder(40.5,6.5,6.5, $fn=60, true);
        rotate([90,0,0]) cylinder(43,6,6, $fn=60, true);
    }
    hull(){
        rotate([90,0,0]) cylinder(43,6,6, $fn=60, true);
        rotate([90,0,0]) cylinder(45,5,5, $fn=60, true);
    }
    hull(){
        rotate([90,0,0]) cylinder(45,5,5, $fn=60, true);
        rotate([90,0,0]) cylinder(47.5,4.2,4.2, $fn=60, true);
    }
}
module Antenas(){
    /* Antenas */
    union(){
        cylinder(18
        , 0.6, 0.6, $fn=50, true);
        minkowski(){
            translate([0,0,-11.35]) cube([2,0.2,6],true);    
            sphere(0.1, $fn=50);
        }
    }
}
module Antenas_Tops(i){
    translate([0,i*24,27])
    union(){
        Antenas_Tops_Sphere();
        translate([0,0,-2.2]) Antenas_Tops_Cones();
        translate([0,0,-0.05]) Antenas_Tops_Rings();
    }
}

module Antenas_Tops_Sphere(){
    /* Red Spheres */
    difference(){
        sphere(2.5,$fn=50 ,true);
        translate([0,0,-0.11]) sphere(2.4,$fn=50 ,true);
    }
}
module Antenas_Tops_Cones(){
    /* Red Cones */
    difference(){
        cylinder(2, 1.45, 1.05, $fn=50,true);
        cylinder(2.1, 1.25, 0.75, $fn=50,true);
    }
}
module Antenas_Tops_Rings(){
    /* Red Rings */
    difference(){
        cylinder(0.4, 2.65, 2.65, $fn=50,true);
        cylinder(0.4, 2.55, 2.55, $fn=50,true);
    }
}
module Hat(){
    color([0.5,0.5,0.5]) translate([0,0,20]) Hat_Ring();
    color([1,0.2,0.2]) translate([0,0,24.5]) Hat_Top();
}

module Hat_Ring(){
    /* Metal ring */
    minkowski(){
        cylinder(1, 7.75, 7.75, $fn=80, true);
        sphere(1, $fn=60);
    }
}
module Hat_Top(){
    /* Red hat */
    hull(){
        minkowski(){
            cylinder(6.2, 6, 5.65, $fn=60, true);
            sphere(1, $fn=40);
        }
        translate([0,0,4])
        minkowski(){
            cylinder(0.25, 5.1, 5.1, $fn=60, true);
            sphere(1, $fn=40);
        }
    }
}

module Neck(){
    color([0.9,0.9,0.81])
    translate([0,0,-20]) cylinder(4.5,13,13, $fn=100,true);
}
module Head(){
    Skull();
    Face();
    Ears();
    Hat();
    Neck();
}
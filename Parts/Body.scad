module copy_mirror(vec){
    children();
    mirror(vec) children();
}
module Skelaton(){
    difference(){
        color([0.9,0.9,0.81])
        translate([-3.5,0,24.5])
        union(){
            translate([21.5,0,-23.05]) 
            Skelaton_Front();
            translate([0,0,-25.1])
            Skelaton_Back();
            Skelaton_Back_Top();
        }
        color([0,0,0])
        translate([17,0,7])
        minkowski(){
            cube([15,40,35],true);
            sphere(1);
        }
    }
}
module Skelaton_Front(){
    /* Front cube */
    minkowski(){
        cube([4.5,45,47], true);
        sphere(3, $fn=80);
    }
}
module Skelaton_Back(){
    /* Back cube */
    minkowski(){
        cube([35.5,45,43], true);
        sphere(3, $fn=80);
    }
}
module Skelaton_Back_Top(){
    /* Back top cube */
    minkowski(){
        cube([35.5,45,0.75], true);
        sphere(3, $fn=80);
    }
}
module Slot_Machine(){
    translate([20,0,7])
    Hole_Frame();
    color([0.9,0.9,0.81])
    for(i=[-1:2:1]){
        translate([18,i*10,7])
        Spinner();
    }
    copy_mirror([0,1,0])
    translate([35.1,0,7])
    Paints();
}

module Spinner(){
    rotate([90,0,0])
        difference(){
            cylinder(18.5,17.6,17.6,$fn=80,true);
            translate([-4,0,0])
            cylinder(20,17.5,17.5,$fn=80,true);
        }
}
module Hole_Frame(){
    color([0.05,0,0])
    union(){    
        translate([-5,0,0])
        Barrel();
        translate([-11,0,0])
        Box();
        translate([-1,0,0])
        Scaffold();
    }
}
module Barrel(){
    rotate([90,0,0])
        difference(){
            cylinder(40,18.5,18.5,$fn=80,true);
            translate([14,0,0])
            cylinder(38.5,18.4,18.4,$fn=80,true);
        }
}
module Box(){
    minkowski(){
        difference(){
            cube([26,41.9,36],true);
            translate([1,0,0])
            cube([26,40,37],true);
        }
        sphere(0.4);
    }
}

module Scaffold(){
    rotate([90,0,0])
    cylinder(39, 2, 2, $fn=60,true);
    for(i=[-1:2:1]){
        translate([0,i*10,0])
        for(j=[0:120:360]){
            rotate([0,j,0])
            cylinder(33, 2, 2, $fn=60,true);
        }
    }
}
module Paints(){
    for(j=[-1:2:1]){
        translate([-5.1,j*10,11.2])
        rotate([0,48,0])
        Paint_Blue_Gauge();
        rotate([0,90,0])
        translate([-2.5,j*10,0])
        Paint_Red_Triangle();
        translate([0,j*7+10,0])
        scale([1,0.7,0.7])
        Paint_Bolts();
        translate([-5.1,j*10,-11.5])
        rotate([0,-48,0])
        Paint_Blue_Ball();
    }
    Paint_Red_Bar();
}
module Paint_Blue_Gauge(){
    color([0,0,1])
    Blue_Square();
    color([1,1,1])
    White_Square();
    for(j=[-1:2:1]){
        rotate([0,-90,0])
        translate([1.3,5.3,j*3.6])
        scale([0.4,0.4,0.4])
        Paint_Bolts();
    }
}
module Blue_Square(){
    minkowski(){
        cube([11.5,15.5,1.8],true);
        sphere(0.4, $fn=30,true);
    }
}
module White_Square(){
    cube([10.1,13.6,2.9],true);
}
module Paint_Red_Triangle(){
    color([1,0,0])
    Red_Triangle();
    color([10,10,10])
    White_Triangle();
    color([0,0,1])
    scale([1.15,1,1])
    Blue_Cony_Bottle();
}
module Red_Triangle(){
    cylinder(1,5.5,5.5,$fn=3, true);
}
module White_Triangle(){
    cylinder(1.2,3.4,3.4,$fn=3, true);
}
module Blue_Cony_Bottle(){
    translate([0.25,0,0])
    rotate([0,0,60])
    minkowski(){
        cylinder(1.3,1.4,1.4,$fn=3, true);
        sphere(0.1);
    }
    translate([-1,0,0])
    minkowski(){
        cylinder(1.275,0.4,0.4,$fn=3, true);
        sphere(0.1, $fn=20);
    }
}
module Paint_Red_Bar(){
    color([1,0,0])
    translate([-0.8,2.75,-4.4])
    Red_Background();
    color([1,1,1])
    translate([0.206,4.05,-5.5])
    rotate([0,-90,0])
    for(j=[0:1.75:14]){        translate([0,j,0])
        White_Stripe();
    }
}
module Red_Background(){
    minkowski(){
        cube([0.01,14.5,0.01]);
        sphere(1.5, $fn=40);
    }
}
module White_Stripe(){
    polygon(points=[[0,0],[0,-0.7],[2,-2],[2,-1.3]], paths=[[0,1,2,3]]);
}
module Paint_Blue_Ball(){
    color([0,0,1])
    Blue_Square();
    color([1,1,1])
    White_Square();
    for(j=[-1:2:1]){
        rotate([0,90,0])
        translate([1.3,5.3,j*3.6])
        scale([0.4,0.4,0.4])
        Paint_Bolts();
    }
}
module Paint_Bolts(){
    rotate([0,90,0])
    union(){
        color([0,0,0])
        circle(1.7, $fn=30, true);
        color([0.9,0.9,0.81])
        translate([0,0,0.1])
        union(){
            difference(){
                circle(1.55, $fn=30, true);
                circle(1.35, $fn=30, true);
            }
            difference(){
                circle(1.25, $fn=30, true);
                square([0.35,2.5], true);
            }
        }
    }
}
module Body(){
    Skelaton();
    Slot_Machine();
}

Body();
use <Parts/Head.scad>;
use <Parts/Body.scad>;

module Assamble(){
    translate([0,0,100]) Head();
    translate([0,0,50]) Body();
}

Assamble();
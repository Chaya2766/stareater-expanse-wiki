module disc(){
    color([0.9,0.9,0.9]){
        difference(){
            cylinder(h=1,d=120,center=true);
            cylinder(h=2,d=15,center=true);
        }
    }
}

module tape(){
    difference(){
    color([0.5,0.5,0.5]){
        cube([100,20,50]);
    }
    color([0.9,0.9,0.9]){
        translate([25,-1,49]){
        cube([50,22,2]);
    }}
    }
}

disc();
translate([40,60,0]){rotate([0,0,-30]){
    tape();
}}

translate([80,10,0]){rotate([0,0,-60]){
    color([0.9,0.9,0.9]){
        cube([50,10,5]);
    }
}}
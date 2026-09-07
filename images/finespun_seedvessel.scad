module pillship(){
    
    //pill core start
    difference(){
        union(){
            color([0.4,0.4,0.4])sphere(50);
            color([0.2,0.25,0.5])cylinder(h=100,r=50);
            color([0.4,0.4,0.4])translate([0,0,100]){sphere(50);}
        }
        union(){
            color([0.4,0.4,0.4])sphere(49);
            color([0.2,0.25,0.5])cylinder(h=100,r=49);
            color([0.4,0.4,0.4])translate([0,0,100]){sphere(49);}
        }
    }
    //pill core end
    
    //engine start
    difference(){
        color([0.5,0.5,0.5])translate([0,0,-50]){
            translate([0,0,-7])cylinder(h=8,r=8);
            translate([0,0,-15])cylinder(h=8,r1=2,r2=8);
            translate([0,0,-23])cylinder(h=8,r1=8,r2=2);
            translate([0,0,-31])cylinder(h=8,r1=10,r2=8);
        }
        color([0.2,0.2,0.2])translate([0,0,-50]){
            translate([0,0,-24])cylinder(h=8,r1=8,r2=2);
            translate([0,0,-31.5])cylinder(h=8,r1=10,r2=8);
        }
    }
    //engine end
    
    //hangar bays
    color([0.5,0.5,0.5]){
        for(i=[90:90:360]){
            rotate([0,0,i]){
                //front hangars
                translate([-50,-5,100])cube([10,10,30]);
                translate([-49,-4,130])cube([8,8,1]);
                //rear hangars
                translate([-50,-5,-30])cube([10,10,30]);
                translate([-49,-4,-31])cube([8,8,1]);
            }
        }
    }
    /*
    //hangar bay elevator rails
    color([0.6,0.6,0.6]){
        intersection(){
        union(){
            translate([4,0,100])rotate([0,90,0]){cylinder(r=51,h=1,center=true);}
            translate([-4,0,100])rotate([0,90,0]){cylinder(r=51,h=1,center=true);}
            translate([0,4,100])rotate([90,0,0]){cylinder(r=51,h=1,center=true);}
            translate([0,-4,100])rotate([90,0,0]){cylinder(r=51,h=1,center=true);}
        }
        difference(){
            cylinder(r=45,h=200);
            cube([20,20,500],true);
        }
        }
    }
    */
    //runways
    color([0.5,0.5,0.5]){
        difference(){
            translate([0,0,125])cylinder(r=50,h=15);
            cylinder(r=49,h=300);
        }
        difference(){
            translate([0,0,-40])cylinder(r=50,h=15);
            cylinder(r=49,h=300,center=true);
        }
    }
}

pillship();
$vpt=[0,0,50];
$vpr=[90+45*sin($t*360),0,360*$t];
$vpd=800;
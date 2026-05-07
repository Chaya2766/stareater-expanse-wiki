module thread(radius=100, base_size=25, tip_size=0, thread_height=50, separation=55, deg_step=20,num_turns=10){
    difference(){
    union(){
    for(i=[deg_step-360:deg_step:360*(num_turns+1)]){
        hull(){
        rotate([0,90,i]){
            translate([(separation)*i/360,0,radius]){
                cylinder(thread_height,base_size,tip_size);
            }
        }
        rotate([0,90,i-deg_step]){
            translate([(separation)*(i-deg_step)/360,0,radius]){
                cylinder(thread_height,base_size,tip_size);
            }
        }
        }
    }
    }
    //cutting off the thread sharply to not leave an incomplete helix - this also makes the thread naturally ease in and out at the ends
    translate([0,0,2*separation]){cube([3*radius,3*radius,2*separation],true);}
    translate([0,0,-2*separation-(separation*num_turns)]){cube([3*radius,3*radius,2*separation],true);}
    }
}

module airlock_half(open=false,door=true,deg_step=10){
    difference(){
    cylinder(r=825,h=1000);
    translate([0,0,-100]){cylinder(r=925-200,h=1200);}
    cylinder(r=500,h=1100);
    }
    //angled cap
    difference(){
    translate([0,0,1000]){cylinder(r1=825,r2=0,h=825);}
    translate([0,0,1000-100]){cylinder(r1=825,r2=0,h=825);}
    translate([0,0,1000-100]){cylinder(r1=500,r2=500,h=1000);}
    translate([0,0,1275]){cylinder(r1=1000,r2=1000,h=100);}
    }
    //cap handles
    for(i=[1:1:8]){rotate([0,0,i*45]){
        hull(){
            translate([700,0,1100]){sphere(d=40);}
            translate([800-20,0,1200-20]){sphere(d=40);}
        }
        hull(){
            translate([800-20,0,1200-20]){sphere(d=40);}
            translate([650-20,0,1350-20]){sphere(d=40);}
        }
        hull(){
            translate([650-20,0,1350-20]){sphere(d=40);}
            translate([550,0,1250]){sphere(d=40);}
        }
    }}
    //outer thread
    difference(){
        translate([0,0,1000]){
        thread(radius=825,deg_step=deg_step,num_turns=18,thread_height=25,base_size=25,separation=55);
        }
        translate([0,0,1100]){cube([2000,2000,200],true);}
        translate([0,0,-100]){cube([2000,2000,200],true);}
    }
    //inner thread
    /*
    difference(){
        translate([0,0,500]){
        thread(radius=-1750/2,deg_step=10,num_turns=9);
        }
        translate([0,0,-100]){cube([2000,2000,210],true);}
    }
    */
    if(door){
    if(open){
        translate([400,0,0200]){
        rotate([0,90,0]){
            cylinder(d=1100,h=100);
            cylinder(d=900,h=200);
        }}
    } else {
        translate([0,0,0800]){
            cylinder(d=1100,h=100);
            cylinder(d=900,h=200);
        }
    }
    }
}

module airlock_connector(gap=5,deg_step=10){
    difference(){
        cylinder(h=1000,r=925,center=true);
        cylinder(h=1100,r=825+5,center=true);
        translate([0,0,500]){
        thread(radius=825,deg_step=deg_step,num_turns=18,base_size=25+2*gap, tip_size=gap, thread_height=25+gap);
        }
    }
}

//for illustration

difference(){
airlock_half(false,false);
translate([0,-500,1000]){cube([2100,1000,2200],true);}
}

difference(){
translate([0,0,-35]){rotate([180,0,0]){airlock_half(false,false);}}
translate([0,-500,-1000]){cube([2100,1000,2200],true);}
}

difference(){
translate([0,0,5]){airlock_connector();}
translate([0,-500,0]){cube([2100,1000,1100],true);}
}
/*
difference(){
translate([0,0,1270]){airlock_connector(7.5);}
translate([0,-500,1300]){cube([2100,1000,1100],true);}
}
*/

//for print:
/*
scale(0.04){
translate([0,0,0]){airlock_half(false,false,deg_step=3);}
translate([2500,0,0]){airlock_half(false,false,deg_step=3);}
translate([1250,1750,500]){airlock_connector(deg_step=3);}
}
*/
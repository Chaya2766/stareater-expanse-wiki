module thread(radius=100, base_size=25, tip_size=0, thread_height=50, separation=55, deg_step=20,num_turns=10){
    for(i=[deg_step:deg_step:360*num_turns]){
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

module airlock_half(open=false,door=true){
    difference(){
    cylinder(d=1850,h=1000);
    translate([0,0,-100]){cylinder(d=1750,h=1050);}
    cylinder(d=1000,h=1100);
    }
    //outer thread
    difference(){
        translate([0,0,1000]){
        thread(radius=1850/2,deg_step=10,num_turns=18);
        }
        translate([0,0,1100]){cube([2000,2000,210],true);}
        translate([0,0,-100]){cube([2000,2000,210],true);}
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

module airlock_connector(){
    difference(){
        cylinder(h=1000,d=2000,center=true);
        cylinder(h=1100,d=1900,center=true);
        translate([0,0,500]){
        thread(radius=1850/2,deg_step=10,num_turns=18,base_size=30, tip_size=5, thread_height=55);
        }
    }
}

difference(){
airlock_half(false,false);
translate([0,-500,500]){cube([2100,1000,1100],true);}
}

difference(){
translate([0,0,-40]){rotate([180,0,0]){airlock_half(false,false);}}
translate([0,-500,-500]){cube([2100,1000,1100],true);}
}

difference(){
airlock_connector();
translate([0,-500,0]){cube([2100,1000,1100],true);}
}

//for print:
/*
scale(0.01){
translate([0,0,1000]){rotate([180,0,0]){airlock_half(false,false);}}
translate([2500,0,1000]){rotate([180,0,0]){airlock_half(false,false);}}
translate([1250,1750,500]){airlock_connector();}
}
*/
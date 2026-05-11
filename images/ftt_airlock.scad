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
    translate([0,0,1000-100]){cylinder(r1=600,r2=600,h=1000);}
    translate([0,0,1175]){cylinder(r1=1000,r2=1000,h=100);}
    translate([0,0,1025]){cylinder(r1=500,r2=700,h=200);}
    }
    //outer handles
    for(i=[1:1:8]){rotate([0,0,i*45]){
        hull(){
            translate([750,0,1050]){sphere(d=40);}
            translate([800,0,1100]){sphere(d=40);}
        }
        hull(){
            translate([800,0,1100]){sphere(d=40);}
            translate([700,0,1200]){sphere(d=40);}
        }
        hull(){
            translate([700,0,1200]){sphere(d=40);}
            translate([650,0,1150]){sphere(d=40);}
        }
    }}
    //inner handles
    for(a=[-30,0,30,150,180,210]){rotate([0,0,a]){
        hull(){
            translate([760,0,750]){sphere(d=40);}
            translate([660,0,850]){sphere(d=40);}
        }
        hull(){
            translate([660,0,850]){sphere(d=40);}
            translate([660,0,1000]){sphere(d=40);}
        }
    }}
    //base handles
    for(a=[45:45:360]){rotate([0,0,a]){
        hull(){
            translate([760,0,050]){sphere(d=40);}
            translate([660,0,150]){sphere(d=40);}
        }
        hull(){
            translate([660,0,150]){sphere(d=40);}
            translate([660,0,250]){sphere(d=40);}
        }
        hull(){
            translate([660,0,250]){sphere(d=40);}
            translate([760,0,350]){sphere(d=40);}
        }
    }}
    //door supports
    translate([0,0,900]){
        difference(){
        translate([0,0,0]){cylinder(h=120,r1=800,r2=800);}
        translate([0,0,-50]){
            cylinder(h=50+150,r1=650+200-15-(sqrt(2)*50),r2=600+100-15-(sqrt(2)*50));
        }
        translate([0,650,0]){
            cube([2000,500,300],true);
        }
        translate([0,400,120]){
            rotate([45,0,0]){
                cube([2000,100,100],true);
            }
        }
        translate([0,-650,0]){
            cube([2000,500,300],true);
        }
        translate([0,-400,120]){
            rotate([45,0,0]){
                cube([2000,100,100],true);
            }
        }
    }
    }
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
        translate([-300,0,1072-750]){
        rotate([0,-90,0]){
            airlock_door();
        }}
    } else {
        translate([0,0,1072]){
            airlock_door();
        }
    }
    }
}

module airlock_door(gap=1){
    difference(){
        //cylinder(h=100,r1=650,r2=550);
        translate([0,0,2*gap-50]){cylinder(h=100+50-2*gap,r1=650+50-2*gap,r2=550);}
        //cylinder(h=50,r1=650-(sqrt(2)*50),r2=600-(sqrt(2)*50));
        /*translate([0,0,-50]){
            cylinder(h=50+50,r1=650+50-(sqrt(2)*50),r2=600-(sqrt(2)*50));
        }*/
        translate([0,0,0.-100]){
            cylinder(h=50+100,r1=650+100-(sqrt(2)*50),r2=600-(sqrt(2)*50));
        }
        translate([0,550,-50]){
                cube([2000,400,100],true);
        }
        translate([0,350,-sqrt(2)*50]){
            rotate([45,0,0]){
                cube([2000,100,100],true);
            }
        }
        translate([0,-550,-50]){
                cube([2000,400,100],true);
        }
        translate([0,-350,-sqrt(2)*50]){
            rotate([45,0,0]){
                cube([2000,100,100],true);
            }
        }
    }
    //translate([0,0,100]){cylinder(h=100,r=550);}
    //cap handles
    for(i=[1:1:8]){rotate([0,0,i*45]){
        //outer
        hull(){
            translate([500,0,100]){sphere(d=40);}
            translate([500,0,150]){sphere(d=40);}
        }
        hull(){
            translate([500,0,150]){sphere(d=40);}
            translate([350,0,150]){sphere(d=40);}
        }
        hull(){
            translate([350,0,150]){sphere(d=40);}
            translate([350,0,100]){sphere(d=40);}
        }
        //inner
        hull(){
            translate([500,0,50]){sphere(d=40);}
            translate([500,0,0]){sphere(d=40);}
        }
        hull(){
            translate([500,0,0]){sphere(d=40);}
            translate([350,0,0]){sphere(d=40);}
        }
        hull(){
            translate([350,0,0]){sphere(d=40);}
            translate([350,0,50]){sphere(d=40);}
        }
    }}
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

//false for illustration, true for print
print=false;

if(!print){
//for illustration
echo("rendering a 100% scale illustration");

difference(){
airlock_half();
translate([0,-500,1000]){cube([2100,1000,3200],true);}
}

difference(){
translate([0,0,-35]){rotate([180,0,0]){airlock_half(true);}}
translate([0,-500,-1000]){cube([2100,1000,3200],true);}
}

difference(){
translate([0,0,5]){airlock_connector();}
translate([0,-500,0]){cube([2100,1000,1100],true);}
}

difference(){
translate([0,0,1270]){airlock_connector(6);}
translate([0,-500,1300]){cube([2100,1000,1100],true);}
}

difference(){
translate([0,0,2600-50]){rotate([180,0,0]){airlock_half(false);}}
translate([0,-500,2600]){cube([2100,1000,3200],true);}
}

}else{
echo("rendering 4% scale model parts");
//for print:
scale(0.04){
translate([0,0,0]){airlock_half(false,false,deg_step=3);}
translate([2000,0,500]){rotate([0,180-45,0]){airlock_door(gap=10);}}
translate([1250,1750,500]){airlock_connector(gap=6,deg_step=3);}
}

}
//openscad ftt_airlock.scad -o ftt_airlock_printables.stl -D print=true
//when printing with 0.2mm layer height, the thread looks like garbage but somehow still works, still recomend using 0.16mm
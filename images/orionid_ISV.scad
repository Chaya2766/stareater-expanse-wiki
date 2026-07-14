module orionid_rcs_thruster(){
    //nozzle size based on spacex's raptor engine
    translate([0,0,-2.5]){
        scale([1,1,3/1.3]){
            difference(){
                sphere(1.3,$fn=16);
                sphere(1.29,$fn=16);
                translate([0,0,-1.3]){cube(size=2*1.3,center=true);}
            }
        }
    }
}

module radiator(){
    color([0.5,0.5,0.5]){
        translate([25,0,6]){cube([60,3,1],true);}
        translate([25,0,-6]){cube([60,3,1],true);}
        for(x=[6:11:50]){
            translate([x,0,0]){cube([10,1,10],true);}
            translate([x-4.5,0,0]){cube([1,1,12],true);}
            translate([x+4.5,0,0]){cube([1,1,12],true);}
        }
    }
}

module orionid_ISV(electric_sail=false){

//cylinder(d=60,h=780);
color([0.3,0.3,0.3]){
cylinder(d=60,h=3);//pusher plate
}
color([0.5,0.5,0.5]){
step=360/6;
for(i=[step:step:360]){
    rotate([0,0,i]){
        translate([20,0,0]){
            cylinder(h=100,d=3);//pusher plate springs
        }
    }
}
}

color([0.95,0.95,0.95]){
translate([0,0,100]){cylinder(h=7,d1=60-7,d2=60);}//main body
translate([0,0,107]){cylinder(h=555-14,d=60);}
translate([0,0,100+555-7]){cylinder(h=7,d1=60,d2=60-7);}
}

//text
color([0.2,0.2,0.2]){
    translate([0,0,275]){
        rotate([90,-90,-10]){
            translate([0,0,29.1]){
                linear_extrude(1,true){
                text("ISV Orionid",8,valign="center",font="noto sans");
                }//size 20
            }
        }
        rotate([90,-90,10]){
            translate([0,0,29.1]){
                linear_extrude(1,true){
                text("# 000 000 000 001",5,valign="center",font="noto sans");
                }//size 12.5
            }
        }
    }
}

color([0.5,0.5,0.5]){
step=360/6;
for(i=[step:step:360]){
    rotate([0,0,i]){
        translate([20,0,655]){
            cylinder(h=100,d=3);//debris shield springs
        }
    }
}
}

color([0.5,0.5,0.5]){
translate([0,0,753.5]){
    difference(){//debris shield holder ring
        cylinder(h=3,r1=18.5,r2=21.5,center=true);
        cylinder(h=5,r1=18.5-4,r2=21.5-2,center=true);
    }
}
}

color([0.3,0.3,0.3]){
translate([0,0,737]){
    difference(){//debris shield cone
        cylinder(h=40,r1=1,r2=40);
        translate([0,0,1]){cylinder(h=40,r1=1,r2=40);}
    }
}
}

for(rot=[0,90,180,270]){
    for(pos=[150,172,194,216,238,502,524,546,568,590]){
        rotate([0,0,rot]){
            translate([30,0,pos]){radiator();}
        }
    }
}

//lower thrusters
for(pos=[120]){
    for(rot=[0,90,180,270]){
        rotate([0,0,rot]){
            translate([31,0,pos]){
                color([0.9,0.9,0.9]){
                    sphere(1.5,$fn=16);
                    rotate([0,-90,0]){cylinder(h=3,r=1.5,$fn=16);}
                }
                color([0.5,0.5,0.5]){
                    rotate([90,0,-20]){translate([0,0,-1]){orionid_rcs_thruster();}}
                    rotate([-90,0,20]){translate([0,0,-1]){orionid_rcs_thruster();}}
                    rotate([0,-20,0]){translate([0,0,-1]){orionid_rcs_thruster();}}
                }
            }
        }
    }
}

//upper thrusters
for(pos=[630]){
    for(rot=[0,90,180,270]){
        rotate([0,0,rot]){
            translate([31,0,pos]){
                color([0.9,0.9,0.9]){
                    sphere(1.5,$fn=16);
                    rotate([0,-90,0]){cylinder(h=3,r=1.5,$fn=16);}
                }
                color([0.5,0.5,0.5]){
                    rotate([90,0,-20]){translate([0,0,-1]){orionid_rcs_thruster();}}
                    rotate([-90,0,20]){translate([0,0,-1]){orionid_rcs_thruster();}}
                    rotate([0,20-180,0]){translate([0,0,-1]){orionid_rcs_thruster();}}
                }
            }
        }
    }
}

if(electric_sail){
    step=360/1024;
    for(i=[step:step:360]){
    rotate([90,0,i]){translate([30,0,0]){cylinder(h=200e3,r1=0.02,r2=10);}}
    }
}

}

if($t<0.85){
orionid_ISV(false);
}else{
orionid_ISV(true);
}

//$vpd=2000+min(1.1e6,pow(1e6,0.8*$t+0.4));
//$vpt=[0,0,400];
//$vpr=[55*(0.6+0.9*$t),0,25];

$vpd=2250;
$vpr=[66.9,0,25.5];
$vpt=[0,0,400];

/*
$vpr=[55,0,25];
$vpt=[0,0,400];
$vpd=2000;
//$vpd=1e5;
*/
/*
NOTES ABOUT THE HOUSE
the doors have windows to look through which also points out which side of the door will swing - the side with pointy end of the window swings around, the side with the wide end of the window is where the hinges are
both doors in the airlock swing into the airlock, not outside
the bathroom door swings out from the bathroom
*/

module pathouse_door(open=0,swingdirection=1){
    //open is the percentage of door's opening sequence completed, 0=closed 1=open, inbetween is in the middle of opening or closing
    //at open=0.5 the handle is moved fully up, above 0.5 the door angle changes, at open=1 the door is fully opened
    //swingdirection is either 1 or -1, alternatively something not zero less than 1 or more than -1 would limit the door's range of angles so that it opens to less than 90 degrees in that direction
rotate([0,0,90*swingdirection*min(1,max(0,2*open-1))]){
translate([0,-1000,0]){
    difference(){
    translate([-10,0,0]){
        cube([75+20,1000,2000]);
    }
    //inner handle cavity
    hull(){
        translate([10,200,1000]){
            rotate([0,-90,0]){
                cylinder(h=30,d=100);
            }
        }
        translate([10,700,1300]){
            rotate([0,-90,0]){
                cylinder(h=30,d=100);
            }
        }
        translate([10,800,1200]){
            rotate([0,-90,0]){
                cylinder(h=30,d=100);
            }
        }
        translate([10,800,800]){
            rotate([0,-90,0]){
                cylinder(h=30,d=100);
            }
        }
        translate([10,700,700]){
            rotate([0,-90,0]){
                cylinder(h=30,d=100);
            }
        }
    }
    //outer handle cavity
    hull(){
        translate([60,200,1000]){
            rotate([0,90,0]){
                cylinder(h=30,d=100);
            }
        }
        translate([60,700,1300]){
            rotate([0,90,0]){
                cylinder(h=30,d=100);
            }
        }
        translate([60,800,1200]){
            rotate([0,90,0]){
                cylinder(h=30,d=100);
            }
        }
        translate([60,800,800]){
            rotate([0,90,0]){
                cylinder(h=30,d=100);
            }
        }
        translate([60,700,700]){
            rotate([0,90,0]){
                cylinder(h=30,d=100);
            }
        }
    }
    //viewing cavity hole
    hull(){
        translate([70,400,1000]){
            rotate([0,-90,0]){
                cylinder(h=70,d=100);
            }
        }
        translate([70,600,1100]){
            rotate([0,-90,0]){
                cylinder(h=70,d=100);
            }
        }
        translate([70,650,1050]){
            rotate([0,-90,0]){
                cylinder(h=70,d=100);
            }
        }
        translate([70,650,950]){
            rotate([0,-90,0]){
                cylinder(h=70,d=100);
            }
        }
        translate([70,600,900]){
            rotate([0,-90,0]){
                cylinder(h=70,d=100);
            }
        }
    }
    }
    //inner handle
    translate([-15-10,200,1000]){
        rotate([0,90,0]){cylinder(d=30,h=40);}
        rotate([-90-30+(min(1,max(0,2*open))*60),0,0]){cylinder(d=30,h=600);}
        sphere(d=30);
    }
    //outer handle
    translate([60+25,200,1000]){
        rotate([0,-90,0]){cylinder(d=30,h=40);}
        rotate([-90-30+(min(1,max(0,2*open))*60),0,0]){cylinder(d=30,h=600);}
        sphere(d=30);
    }
    //viewing pane
    color([0,0.5,0.5,0.5]){
    hull(){
        translate([50,400,1000]){
            rotate([0,-90,0]){
                cylinder(h=30,d=100);
            }
        }
        translate([50,600,1100]){
            rotate([0,-90,0]){
                cylinder(h=30,d=100);
            }
        }
        translate([50,650,1050]){
            rotate([0,-90,0]){
                cylinder(h=30,d=100);
            }
        }
        translate([50,650,950]){
            rotate([0,-90,0]){
                cylinder(h=30,d=100);
            }
        }
        translate([50,600,900]){
            rotate([0,-90,0]){
                cylinder(h=30,d=100);
            }
        }
    }
    }
}
}
}

module pathouse_toilet(){
        cube([300,300,1200]);
        pos=[//pipe
            [300,150,150],
            [350,150,150],
            [400,150,200],
            [425,150,250],
            [425,150,350],
            [400,150,500],
            [390,150,700],
            [390,150,900]
        ];
        for(i=[1:1:len(pos)-1]){
            hull(){
                translate(pos[i-1]) sphere(d=30);
                translate(pos[i]) sphere(d=30);
            }
        }
        difference(){//pee funnel
            translate([390,150,900]){cylinder(d1=30,d2=100,h=100);}
            translate([390,150,900]){cylinder(d1=20,d2=95,h=110);}
        }
        //pee funnel holder
        difference(){
            union(){
                translate([300,50,950]){cube([100,200,30]);}
                translate([400,150,950]){cylinder(d=200,h=30);}
            }
            translate([400,150,900]){cylinder(d1=40,d2=110,h=100);}
            translate([400,130,940]){cube([100,50,60]);}
        }
        //tap
        translate([300,135,1170]){cube([100,30,30]);}
        translate([400,150,1120]){cylinder(d=30,h=80);}
        
        //storage tank - pill shape, radius 250mm, side length 500mm, gives volume 163.625L
        hull(){
            translate([250,-400,300]) sphere(250);
            translate([250,-400-500,300]) sphere(250);
        }
        translate([0,-400,0]){cube([500,30,300]);}
        translate([0,-400-500,0]){cube([500,30,300]);}
        translate([250,-400+250-10,300]){rotate([-90,0,0])cylinder(h=40,d=40);}
        
        pos2=[//pipe from toilet to storage tank
            [250,-120,300],
            [250,-100,300],
            [225,-80,200],
            [150,-20,150],
            [150,0,150]
        ];
        for(i=[1:1:len(pos2)-1]){
            hull(){
                translate(pos2[i-1]) sphere(d=30);
                translate(pos2[i]) sphere(d=30);
            }
        }
}

module pathouse(doorstate=[0,0,1]){
//floor is at z=0, with corner exactly at x0y0
//doorstate [outer airlock, inner airlock, bathroom]

//outer 4 walls
difference(){
    translate([-75,-75,-75]){
        cube([4000,4000,4000]);
    }
    cube([3850,3850,3850]);
    translate([3800,2850-100,100]){
        cube([200,1000,2000]);
    }
}

//internal airlock wall
difference(){
    translate([2850-75,0,0]){
        cube([75,3850,2200]);
    }
    translate([2750,100,100]){
        cube([200,1000,2000]);
    }
}

//airlock doors
translate([2850,0100,100]){//inner door
    rotate([0,0,180]){pathouse_door(swingdirection=-0.9,open=doorstate[1]);}
}
translate([3850,3850-100,100]){//outer door
    pathouse_door(swingdirection=-0.9,open=doorstate[0]);
}
//both doors hinge inwards

//airlock door rails
translate([3800,100,25]){
    cube([50,3800,50]);
}
translate([3800,100,2125]){
    cube([50,3800,50]);
}
translate([2850,100,25]){
    cube([50,3800,50]);
}
translate([2850,100,2125]){
    cube([50,3800,50]);
}

//second floor
difference(){
translate([0,0,2200]){
    cube([3850,3850,75]);
}
translate([0,1000,2100]){
    cube([1000,2200,275]);
}
}


//stairs
//stepsize=300;
stepsize=2275/7;//stair step size 325mm
for(step=[stepsize-75:stepsize:2200]){
    translate([0,1000+step-stepsize*0.5,step]){
        cube([1000,stepsize,75]);
    }
    translate([0,1000+step-stepsize*0.5,step-stepsize]){
        cube([1000,75,stepsize]);
    }
}

//stairs wall
difference(){
    union(){
        hull(){
            translate([1000,1075,0]){
                cube([75,75,stepsize]);
            }
            translate([1000,3275-stepsize,2200-stepsize]){
                cube([75,75,stepsize]);
            }
            translate([1000,3000,2200]){
                cube([75,125,75]);
            }
            translate([1000,3000,0]){
                cube([75,125,75]);
            }
        }
        //filling to fit with bathroom wall
        translate([1000,2800,0])cube([75,150,2200]);
    }
    translate([950,2800,0]){
        cube([200,1000,1875]);
    }
}
//bathroom wall
difference(){
    translate([1000,2800,0])cube([1850,75,2200]);
    translate([1175,2750,100])cube([1000,175,2000]);
}
//bathroom door
translate([1175,2800,100]){
    rotate([0,0,90])pathouse_door(swingdirection=-1,open=doorstate[2]);
}

//bathtub / shower boundary
translate([2175,2850,0]){
    cube([75,1000,600]);
    //cube([600,75,600]);
}

translate([100,3000]) pathouse_toilet();

}//end of pathouse module


/*
//1m reference cube
translate([1700,2750,2275]){
    color([0,1,0,0.5]){
        cube(1000);
    }
}
*/
/*
//human simulant
translate([2300,3000,0]){
    color([0,0,1,0.5]){
        cube([450,200,1800]);
    }
}
*/



$vpt=[2000,2000,2000];
$vpr=[55,0,360*$t];
$vpd=1.7e4;

//half-cut viewing
/*
difference(){
    pathouse();
    translate($vpt){
        rotate($vpr){
            translate([0,0,$vpd]){
                cube(2*$vpd,center=true);
            }
        }
    }
}
*/
/*
#intersection(){
    pathouse();
    translate($vpt){
        rotate($vpr){
            translate([0,0,$vpd]){
                cube(2*$vpd,center=true);
            }
        }
    }
}
*/

//for a render:
intersection(){
    union(){
        pathouse([1.2*sin(260*$t),1.2*sin(260*$t),1.2*sin(260*$t)]);
    }
    translate($vpt){
        rotate($vpr){
            translate([0,0,-$vpd]){
                cube(1.98*$vpd,center=true);
            }
        }
    }
}

//door preview
//translate([0,-1000,0]){pathouse_door(open=1);}
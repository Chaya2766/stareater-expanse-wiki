module pathouse_door(){
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
        rotate([-90-30,0,0]){cylinder(d=30,h=600);}
        sphere(d=30);
    }
    //outer handle
    translate([60+25,200,1000]){
        rotate([0,-90,0]){cylinder(d=30,h=40);}
        rotate([-90-30,0,0]){cylinder(d=30,h=600);}
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

module pathouse(){
//floor is at z=0, with corner exactly at x0y0

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
translate([2775,100,100]){
    pathouse_door();
}
translate([3850,2850-100,100]){
    pathouse_door();
}

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
hull(){
    translate([1000,1000,0]){
        cube([75,75,75]);
    }
    translate([1000,3200,2200]){
        cube([75,75,75]);
    }
}

}//end of pathouse module


/*
//1m reference cube
translate([2850,0,0]){
    color([0,1,0,0.5]){
        cube(1000);
    }
}
*/



$vpt=[2000,2000,2000];
//$vpr=[55,0,360*$t];
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
    pathouse();
    translate($vpt){
        rotate($vpr){
            translate([0,0,-$vpd]){
                cube(1.98*$vpd,center=true);
            }
        }
    }
}
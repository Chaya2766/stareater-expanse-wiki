module radiator(){
    color([0.5,0.5,0.5]){
        translate([25,0,6]){cube([60,3,1],true);}
        translate([25,0,-6]){cube([60,3,1],true);}
        for(x=[6:11:50]){
            translate([x,0,0]){cube([10,0.1,10],true);}
            translate([x-4.5,0,0]){cube([1,0.1,12],true);}
            translate([x+4.5,0,0]){cube([1,0.1,12],true);}
        }
    }
}

module orionid_ISV(electric_sail=false){

//cylinder(d=60,h=780);
color([0.3,0.3,0.3]){
cylinder(d=60,h=1);//pusher plate
}
color([0.5,0.5,0.5]){
step=360/6;
for(i=[step:step:360]){
    rotate([0,0,i]){
        translate([20,0,0]){
            cylinder(h=100,d=1);//pusher plate springs
        }
    }
}
}

color([0.95,0.95,0.95]){
translate([0,0,100]){cylinder(h=7,d1=60-7,d2=60);}//main body
translate([0,0,107]){cylinder(h=555-14,d=60);}
translate([0,0,100+555-7]){cylinder(h=7,d1=60,d2=60-7);}
}

color([0.5,0.5,0.5]){
step=360/6;
for(i=[step:step:360]){
    rotate([0,0,i]){
        translate([20,0,655]){
            cylinder(h=100,d=1);//debris shield springs
        }
    }
}
}

color([0.5,0.5,0.5]){
translate([0,0,755]){
    difference(){//debris shield holder ring
        cylinder(h=1,r=20.5,center=true);
        cylinder(h=10,r=19.5,center=true);
    }
}
}

color([0.3,0.3,0.3]){
translate([0,0,736]){
    difference(){//debris shield cone
        cylinder(h=30,r1=1,r2=30);
        translate([0,0,1]){cylinder(h=30,r1=1,r2=30);}
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

$vpd=2000+min(1.1e6,pow(1e6,0.8*$t+0.4));
$vpt=[0,0,400];
//$vpr=[55*(0.6+0.9*$t),0,25];

/*
$vpr=[55,0,25];
$vpt=[0,0,400];
$vpd=2000;
//$vpd=1e5;
*/
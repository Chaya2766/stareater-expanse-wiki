module curved_path(rad=5E+3,mass=1,thick=1E+2){
    $fn=8*sqrt(mass);
    translate([0,rad*mass,0]){
    difference(){
    cylinder(r=rad*mass,h=thick,center=true);
    cylinder(r=(rad*mass)-thick,h=1E+3+thick,center=true);
    translate([0,rad*mass,0]){
    cube([rad*mass*3,rad*mass*2,2*thick],center=true);}
    rotate([0,0,-90]){
    translate([0,rad*mass,0]){
    cube([rad*mass*3,rad*mass*2,2*thick],center=true);}
    }
    }
    }
}

/*
for(i=[26:1:34]){
    translate([0,0,10E+3]){
        color("red"){rotate([0,0,-3*45]){
        curved_path(0.5E+3,i,3E+2);
        }}
    }
}

for(i=[42]){
    translate([0,0,10E+3]){
        color("red"){rotate([0,0,-3*45]){
        curved_path(0.5E+3,i,3E+2);
        }}
    }
}

for(i=[44:1:52]){
    translate([0,0,10E+3]){
        color("red"){rotate([0,0,-3*45]){
        curved_path(0.5E+3,i,3E+2);
        }}
    }
}

for(i=[74:1:83]){
    translate([0,0,10E+3]){
        color("red"){rotate([0,0,-3*45]){
        curved_path(0.5E+3,i,3E+2);
        }}
    }
}
*/

/*
//openscad ftt_calutron.scad --view=axes,scales -o ftt_calutron_paths.png --colorscheme=Starnight --viewall --imgsize=1000,500 --projection ortho
paths=true;
    $vpr=[0,0,0];
    $vpt=[10000,-500,0];
    $vpd=60000;
if(paths){
for(i=[1:5:267]){
    translate([0,0,10E+3]){
        color("red"){rotate([0,0,-3*45]){
        curved_path(sqrt(2)*0.05E+3,i,0.5E+2);
        }}
    }
}
}
*/

color("#888"){
//calutron structure
//intake tube
translate([0,0,0.5E+3]){
rotate([90,0,-45]){
    translate([0,0,-0.1E+3]){cylinder(d=0.4E+3,h=10E+3);}
    translate([0,0,10E+3]){cube(2E+3,center=true);}
}
}
//deflector chamber
chamber_radius=19E+3;
intersection(){
minkowski(){
intersection(){
translate([chamber_radius/sqrt(2),-chamber_radius/sqrt(2),0]){
    cylinder(r=chamber_radius,h=1E+3,$fn=128);
}
cube([30E+3,20E+3,2E+3]);
}
cylinder(r=0.2E+3,h=0.1E+3);
}
translate([-2E3,-1E+3,0]){cube([30E+3,20E+3,2E+3]);}
}

//collection tubes
for(i=[1:1:267]){
    translate([(i+1.5)*0.1E+3,-0.15E+3,0.5E+3]){rotate([90,0,45]){
        cylinder(d=0.06E+3,h=0.2E+3);
    }}
}

}

//openscad ftt_calutron.scad --view=axes,scales -o ftt_calutron.png --colorscheme=Starnight --viewall --imgsize=1000,1000
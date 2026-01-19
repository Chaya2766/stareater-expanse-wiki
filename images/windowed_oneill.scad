module windowed_oneill(l=10E+3,r=1E+3,t=10){
    color("#888"){
    difference(){
        union(){
            cylinder(h=l,r=r);
            sphere(r);
            translate([0,0,l]){sphere(r);}
        }
        translate([0,-r/2,t/2]){cube([r,r,l-t]);}
        rotate([0,0,120]){translate([0,-r/2,t/2]){cube([r,r,l-t]);}}
        rotate([0,0,240]){translate([0,-r/2,t/2]){cube([r,r,l-t]);}}
        union(){
            translate([0,0,t]){cylinder(h=l-2*t,r=r-t);}
            translate([0,0,t]){sphere(r-t);}
            translate([0,0,l-t]){sphere(r-t);}
        }
    }
    }
    
    %color("#4888"){
    difference(){
        translate([0,0,t]){cylinder(h=l-2*t,r=r*0.9999);}
        cylinder(h=l,r=r-(t*0.9999));
        rotate([0,0,60]){translate([0,-r/2,t/2]){cube([r,r,l-t]);}}
        rotate([0,0,180]){translate([0,-r/2,t/2]){cube([r,r,l-t]);}}
        rotate([0,0,300]){translate([0,-r/2,t/2]){cube([r,r,l-t]);}}
    }
    }
    
    //wait so why the fuck did I make the mirrors not flat?
    //I am not fixing this right now
    color("#CCC"){
    for(angle=[0,120,240]){
        rotate([0,0,angle]){
            for(dist=[(r/2)-4*t:r:l-r/2]){
                roperadius=t*0.2;
                    hull(){
                        translate([r*0.86,r*0.5,dist]){sphere(roperadius);}
                        translate([dist+r*1.06,r*0.5,dist]){sphere(t*0.5);}
                    }
                    hull(){
                        translate([r*0.86,-r*0.5,dist]){sphere(roperadius);}
                        translate([dist+r*1.06,-r*0.5,dist]){sphere(t*0.5);}
                    }
                }
            
            rotate([0,45,0]){
                difference(){
                translate([r*0.75,-r/2,t/2]){cube([t,r,l*sqrt(2)-t]);}
                sphere(r);
                }
                
            }
        }
    }
    }
}

rotate([90,120*$t,0]){
windowed_oneill();
}
$vpr=[108.9,0,10.3];
$vpt=[-1255,-285,2702];
$vpd=38190;
$vpf=45;

//openscad windowed_oneill.scad -o windowed_oneill.png --imgsize=1000,1000 --colorscheme=Starnight
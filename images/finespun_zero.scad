module torus(R,r,n=16){
    step = 360/n;
    union(){
    for(a=[step:step:360]){
        hull(){
            rotate([0,0,a]){translate([R,0,0]){
                sphere(r);
            }}
            rotate([0,0,a+step]){translate([R,0,0]){
                sphere(r);
            }}
        }
    }
    }
}

module runway(R,r,sup_t=0.1,run_t,n=16,gap=1){
    step = 360/n;
    union(){
    for(a=[step:step:360]){
        //support ring 1
        hull(){
            rotate([0,0,a]){translate([R,0,r]){
                sphere(sup_t);
            }}
            rotate([0,0,a+step/2]){translate([R-r-gap,0,r]){
                sphere(sup_t);
            }}
        }
        hull(){
            rotate([0,0,a]){translate([R,0,r]){
                sphere(sup_t);
            }}
            rotate([0,0,a-step/2]){translate([R-r-gap,0,r]){
                sphere(sup_t);
            }}
        }
        hull(){
            rotate([0,0,a-step/2]){translate([R-r/sqrt(2),0,r/sqrt(2)]){
                sphere(sup_t);
            }}
            rotate([0,0,a-step/2]){translate([R-r-gap,0,r]){
                sphere(sup_t);
            }}
        }
        //support ring 2
        hull(){
            rotate([0,0,a]){translate([R,0,-r]){
                sphere(sup_t);
            }}
            rotate([0,0,a+step/2]){translate([R-r-gap,0,-r]){
                sphere(sup_t);
            }}
        }
        hull(){
            rotate([0,0,a]){translate([R,0,-r]){
                sphere(sup_t);
            }}
            rotate([0,0,a-step/2]){translate([R-r-gap,0,-r]){
                sphere(sup_t);
            }}
        }
        hull(){
            rotate([0,0,a-step/2]){translate([R-r/sqrt(2),0,-r/sqrt(2)]){
                sphere(sup_t);
            }}
            rotate([0,0,a-step/2]){translate([R-r-gap,0,-r]){
                sphere(sup_t);
            }}
        }
        //landing floor
        hull(){
            rotate([0,0,a-step/2]){translate([R-r-gap,0,r]){
                sphere(run_t);
            }}
            rotate([0,0,a-step/2]){translate([R-r-gap,0,-r]){
                sphere(run_t);
            }}
            rotate([0,0,a+step/2]){translate([R-r-gap,0,r]){
                sphere(run_t);
            }}
            rotate([0,0,a+step/2]){translate([R-r-gap,0,-r]){
                sphere(run_t);
            }}
        }
    }
    }
}

module runway_lights(R,r,t=0.1,h=10,offset=0.3,n=16,gap=1){
    step = 360/n;
    for(a=[step:step:360]){
        rotate([0,0,a+step/2]){translate([R-r-gap,0,offset*r]){
            rotate([0,-90,0]){cylinder(d=t,h=h);}
            rotate([0,-90,0]){translate([0,0,10]){cube([0.5,0.2,0.1],true);}}
            rotate([0,-90,0]){translate([0,0,t]){cube([1,0.1,0.1],true);}}
            rotate([0,-90,0]){translate([0,0,t]){cube([0.1,1,0.1],true);}}
        }}
    }
}

module entrances(R,r,t,gap,entry_d,entry_offset=0.6,L,n){
    step = 360/n;
    for(a=[step:step:360]){
        difference(){//diff hollows them out
        hull(){
            rotate([0,0,a]){translate([R,-L/2,r-entry_offset*entry_d]){
                sphere(d=entry_d);
            }}
            rotate([0,0,a]){translate([R-r-entry_d-gap,-L/2,r-entry_offset*entry_d]){
                sphere(d=entry_d);
            }}
            rotate([0,0,a]){translate([R,L/2,r-entry_offset*entry_d]){
                sphere(d=entry_d);
            }}
            rotate([0,0,a]){translate([R-r-entry_d-gap,L/2,r-entry_offset*entry_d]){
                sphere(d=entry_d);
            }}
        }
        hull(){
            rotate([0,0,a]){translate([R,-L/2,r-entry_offset*entry_d]){
                sphere(d=entry_d-t);
            }}
            rotate([0,0,a]){translate([R-r-entry_d-gap,-L/2,r-entry_offset*entry_d]){
                sphere(d=entry_d-t);
            }}
            rotate([0,0,a]){translate([R,L/2,r-entry_offset*entry_d]){
                sphere(d=entry_d-t);
            }}
            rotate([0,0,a]){translate([R-r-entry_d-gap,L/2,r-entry_offset*entry_d]){
                sphere(d=entry_d-t);
            }}
        }
        }
    }
}

module finespun_zero(R=100,r=10,t=0.01){
    difference(){
torus(R,r,n=32,$fn=16);
torus(R,r-t,n=32,$fn=16);
    }

//runway
runway(R,r,0.1,t,n=100,gap=0.3);
runway_lights(R,r,t=0.1,h=10,n=24,offset=0.4);

//entries
entrances(R=R,r=r,t=t,gap=0.3,entry_d=5,L=10,n=6);
    
}

color([0.5,0.5,0.5]){
//finespun_zero(60,10,0.01);
finespun_zero();
}

//camera position for the runway & streetlamp photo
$vpd=81;
$vpr=[101.9,0,167.9];
$vpt=[73.05,-18.13,-4.94];


//notes here because I don't feel like writing the page right now
//bare mass is 730.352m3×7.9t/m3 = 5 769 780.8 kg
//if you add a floor that is 1cm thick: 856.016 m^3 × 7.9t/m3 = 6 762 526.4 kg
//presurized internal volume is 2pi^2 × 100m × (10m)^2 = 197 392.0880 m^3
//surface area is roughly 4pi^2 × 100m × 10m = 39 478.41760 m^2
//radiated heat 39 478.41760 m^2 × stefan × (290K)^4 = 15.833 MW
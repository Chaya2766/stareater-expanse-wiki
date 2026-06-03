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
        hull(){//this part honestly just handles inconsistency in the ring's thickness due to rendering precision
            rotate([0,0,a]){translate([R,0,r]){
                sphere(sup_t);
            }}
            rotate([0,0,a]){translate([R,0,r-sup_t]){
                sphere(sup_t);
            }}
            rotate([0,0,a+step]){translate([R,0,r]){
                sphere(sup_t);
            }}
            rotate([0,0,a+step]){translate([R,0,r-sup_t]){
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
        hull(){
            rotate([0,0,a]){translate([R,0,-r]){
                sphere(sup_t);
            }}
            rotate([0,0,a]){translate([R,0,-r+sup_t]){
                sphere(sup_t);
            }}
            rotate([0,0,a+step]){translate([R,0,-r]){
                sphere(sup_t);
            }}
            rotate([0,0,a+step]){translate([R,0,-r+sup_t]){
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
        hull(){
            rotate([0,0,a-step/2]){translate([R-r-gap+sup_t,0,r]){
                sphere(sup_t);
            }}
            rotate([0,0,a-step/2]){translate([R-r-gap+sup_t,0,-r]){
                sphere(sup_t);
            }}
        }
    }
    }
}

module torus_floor(R,r,t=0.1,n=100){
    step = 360/n;
    union(){
    for(a=[step:step:360]){
        //landing floor
        hull(){
            rotate([0,0,a]){translate([R,0,r]){
                sphere(t);
            }}
            rotate([0,0,a]){translate([R,0,-r]){
                sphere(t);
            }}
            rotate([0,0,a+step]){translate([R,0,r]){
                sphere(t);
            }}
            rotate([0,0,a+step]){translate([R,0,-r]){
                sphere(t);
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

module mounted_rectenna(R=100,r=10,gap=0.3,n=50){
    step = 360/n;
    translate([0,0,r-0.1/2]){
        difference(){
            cylinder(r=50.1,h=0.1,center=true,$fn=64);
            cylinder(r=49.9,h=1,center=true,$fn=64);
        }
        for(x=[-50:0.1:50]){
            //solving for width of the circle at given height using pythagorean theorem
            width = 2*sqrt(pow(50,2)-pow(x,2));
            translate([x,0,0]){cube([0.01,width,0.01],true);}
        }
        for(y=[-50:1:50]){
            //solving for height of the circle at given y position using pythagorean theorem
            height = 2*sqrt(pow(50,2)-pow(y,2));
            translate([0,y,0]){cube([height,0.1,0.1],true);}
        }
    }
    for(i=[step:step:360]){
        rotate([0,0,i+1.8]){
        hull(){
            translate([49.8,0,r]){sphere(0.1);}
            translate([R-r-gap,0,r]){sphere(0.1);}
        }
        }
    }
}

module finespun_zero(R=100,r=10,t=0.01,rectenna=false){
    difference(){
torus(R,r,n=32,$fn=16);
torus(R,r-t,n=32,$fn=16);
    }
torus_floor(R,r,t,n=100);

//runway
runway(R,r,0.1,t,n=100,gap=0.3);
runway_lights(R,r,t=0.1,h=10,n=24,gap=0.3,offset=0.4);

//entries
entrances(R=R,r=r,t=t,gap=0.3,entry_d=5,L=10,n=6);

if(rectenna){
    mounted_rectenna(R=100,r=10,gap=0.3,n=12.5);
}

}

color([0.5,0.5,0.5]){
//finespun_zero(60,10,0.01);
//finespun_zero(rectenna=true);
}

/*
//illustration shot
$vpd=600;$vpr=[76,0,328];$vpf=22.5;
color([0.5,0.5,0.5]){rotate([0,90,0]){finespun_zero(rectenna=true);}}
//add text to the render
translate($vpt){
    rotate($vpr){rotate([$vpf/2,0,0]){
        translate([-0.18*$vpd,0.18*$vpd,0]){
            color("#FFF"){
                linear_extrude(0.01){
                text("Finespun Zero habitat",$vpd*0.01*0.8,halign="left");
                }
            }
        }
        translate([-0.18*$vpd,0.17*$vpd,0]){
            color("#FFF"){
                linear_extrude(0.01){
                text(str("dist. ",$vpd,"m, FOV ",$vpf,"°"),$vpd*0.01*0.8,halign="left");
                }
            }
        }
    }}
}
//end of illustration shot
*/

//structure shot
$vpd=100;$vpr=[95,0,335];$vpf=22.5;$vpt=[-5,0,-95];
intersection(){
color([0.5,0.5,0.5]){rotate([0,90,0]){rotate([0,0,20]){finespun_zero(rectenna=true);}}}
rotate([0,0,0]){translate([0,110,0]){cube(220,true);}}
}
//add text to the render

//camera position for the runway & streetlamp photo
//$vpd=81;
//$vpr=[101.9,0,167.9];
//$vpt=[74.0,-18.13,-4.94];


//notes here because I don't feel like writing the page right now
//bare mass is 730.352m3×7.9t/m3 = 5 769 780.8 kg
//if you add a floor that is 1cm thick: 856.016 m^3 × 7.9t/m3 = 6 762 526.4 kg
//presurized internal volume is 2pi^2 × 100m × (10m)^2 = 197 392.0880 m^3
//surface area is roughly 4pi^2 × 100m × 10m = 39 478.41760 m^2
//radiated heat 39 478.41760 m^2 × 0.25 × stefan × (290K)^4 = 3.958252307 MW

//openscad finespun_zero.scad -o finespun_zero.png --colorscheme=Starnight --imgsize=1000,1000
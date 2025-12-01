//use openscad solar_system.scad -o frame.png --colorscheme=Starnight --imgsize=1000,1000

//these here are the core assumption
Camera_angle = [70,0,90];
Camera_position = [2e7, 0e6, 10e6];
Distance = 2e7;
$vpf=32;
//setting these positions the camera exactly, and calculates the focus point from that
//this means changing the distance maintains the same perspective but changes the zoom, effectively just changing the clipping planes
show_camera_hologram=false;

//CALCULATIONS BEGIN BELOW, SCROLL PAST THEM TO UNLOCK CAMERA

//camera has rotation [90,?,?] when aligned with the XY plane so the first coordinate is NOT elevation. going below the plane pushes it above 90
Elevation = 90-Camera_angle[0];
echo(Elevation);

//either the azimuth is also offset by 90 degrees or I don't know how to use these equations
//and I'm quite certain I don't fully understand these equations
//but my fix seems to work anyway
Azimuth = Camera_angle[2]-90;

Cx = Camera_position[0];
Cy = Camera_position[1];
Cz = Camera_position[2];

Px = Cx - Distance * cos(Elevation) * cos(Azimuth);
Py = Cy - Distance * cos(Elevation) * sin(Azimuth);
Pz = Cz - Distance * sin(Elevation);

target=[Px,Py,Pz];


if(show_camera_hologram){
    translate(target){
        sphere(5);
    }

    camera_cone_rotation = [
        Camera_angle[0]+180,
        Camera_angle[1],
        Camera_angle[2]
    ];

    translate([Cx,Cy,Cz]){
        rotate(camera_cone_rotation){
            color([0,1,0,0.5]){
                %cylinder(r1=1,r2=Distance*0.3,h=Distance);
            }
        }
    }
}
//CALCULATIONS END HERE

//comment these out to not set the camera to intended position every time
$vpt = target;
$vpr = Camera_angle;
$vpd = Distance;

module sol(){
    color([2,1,0]){
        sphere(6.957e8);
    }
}

module mercury(){
    color([0.6,0.6,0.6]){
        sphere(2.4397e6);
    }
}

module venus(){
    color([0.75,0.7,0.65]){
        sphere(6.0518e6);
    }
}

module terra(details=false){
    //the planet
    color([0.4,0.6,0.5]){
        sphere(6.371e6);
    }
    if(details){
        //tethered ring
        ring_H = 4e6;
        ring_R = 5.5e6;
        ring_T = 2e4;
        n_tethers=128;
        tethers_H = 5.5e6;
        tethers_R = 3e6;
        tethers_T = 4e3;
        color([0.6,0.6,0.6]){
            translate([0,0,ring_H]){
                difference(){
                    cylinder(r=ring_R,h=ring_T,center=true);
                    cylinder(r=ring_R-ring_T,h=ring_T*2,center=true);
                }
            }
            for(i=[0:1:n_tethers]){
                hull(){
                    translate([sin(i*360/n_tethers)*(ring_R-ring_T),cos(i*360/n_tethers)*(ring_R-ring_T),ring_H]){
                        sphere(tethers_T/2);
                    }
                    translate([sin(i*360/n_tethers)*tethers_R,cos(i*360/n_tethers)*tethers_R,tethers_H]){
                        sphere(tethers_T/2);
                    }
                }
            }
        }
    }
}

module luna(marker=false){
    color([0.5,0.5,0.5]){
        sphere(1.7374e6);
    }
    if(marker){
        color([0,1,0,0.5]){
            %sphere(1.7374e7);
        }
    }
}

module mars(){
    color([0.8,0.6,0.4]){
        sphere(6.371e6);
    }
}

module phobos(marker=false){
    color([0.8,0.75,0.7]){
        sphere(1.108e4);
    }
    if(marker){
        color([0,1,0,0.5]){
            %sphere(1.108e5);
        }
    }
}

module deimos(){
    color([0.8,0.75,0.7]){
        sphere(6.27e3);
    }
}


module solar_system(){
    sol();
    translate([5.791e10,0,0]){mercury();}
    
    translate([1.0821e11,0,0]){venus();}
    
    translate([1.496e11,0,0]){terra(true);}
    translate([1.496e11-3.84784e8,0,0]){luna();}
    
    translate([2.2794e11,0,0]){mars();}
    translate([2.2794e11,9.376e6,0]){phobos();}
    translate([2.2794e11,2.34632e7,0]){deimos();}
}


translate([-1.496e11,0,0]){
    solar_system();
}
//the reason I'm moving the entire solar system
//is just to avoid floating point errors from large coordinates
//this is a common method in video games that work on huge scales
//for the longest time I've been disappointed by the lack
//of 3d software that uses double precision float for rendering
//as far as I know OpenSCAD uses a CPU renderer
//so no reason it couldn't use double precision
//but at the same time this is a cad program
//so it was never meant to be used for modeling the entire solar system
//in real scale, with objects spanning multiple orders of magnitude
//in both their size and distance from each other
//but I heard Celestia uses text files to store objects
//so naturally I am now interested in trying it out
//and might explore using it instead for this purpose
//the only sad thing is Celestia isn't availabe through apt
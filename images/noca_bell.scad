//use <saturn.scad>

/*
//BEGIN BIG SCENE RENDERER

//these here are the core assumption
Camera_angle = [83,0,24];
Camera_position = [3E+5, -6E+5, 1E+5];
Distance = 7e5; //use 7e5 and 7e7
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


//END BIG SCENE RENDERER
*/


module icosahedron(edge=10){
    //this is genius, thanks GPT
    //edge is the length of each edge on the icosahedron
    //if you use edge=10 and look at it from top down, you will see that the most top edge indeed is 10 units long
    //I don't honestly know what the st does, other than that if it is comparably large to the edge length it turns it from an icosahedron to what looks like a cube that you cut all the edges off of, but I made it scale up and down with the edge length to avoid precision errors
    phi = (sqrt(5)+1)/2;
    st = edge*0.0001;
    hull() {
      cube([edge*phi, edge, st], center=true);
      rotate([90,90,0]) cube([edge*phi, edge, st], center=true);
      rotate([90,0,90]) cube([edge*phi, edge, st], center=true);
    }
}

module spokehab(r,h){
    cylinder(r=r,h=h-r);
    translate([0,0,h-r]){sphere(r);}
}

module noca_bell(){
    phi = (sqrt(5)+1)/2;
    pi = 3.14159265;
    core_edge=17.85E+3;
    //hab_radius = core_edge*0.28;
    hab_radius = 5E+3;
    hab_length = 50E+3;
    
    rotate([0,32,0]){icosahedron(core_edge);}
    
    for(n=[1,2,3,4,5]){
        rotate([37,0,n*72-36/2]){translate([0,0,core_edge*0.75]){
            spokehab(r=hab_radius,h=hab_length);
        }}
    }

    for(n=[6,7,8,9,10]){
        rotate([80,0,n*72-36/2]){translate([0,0,14]){translate([0,0,core_edge*0.75]){
            spokehab(r=hab_radius,h=hab_length);
        }}}
    }

    for(n=[-1,-2,-3,-4,-5]){
        rotate([101,0,n*72+18]){translate([0,0,14]){translate([0,0,core_edge*0.75]){
            spokehab(r=hab_radius,h=hab_length);
        }}}
    }

    for(n=[-6,-7,-8,-9,-10]){
        rotate([143,0,n*72+18]){translate([0,3,14]){translate([0,0,core_edge*0.75]){
            spokehab(r=hab_radius,h=hab_length);
        }}}
    }
}

color("#888"){
noca_bell();
}
$vpd=3.3E+5;

//translate([0,12E+7,0]){saturn();}

//openscad noca_bell.scad -o render.png --colorscheme=Starnight --imgsize=1000,1000
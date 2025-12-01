//these here are the core assumption
Camera_angle = [55,0,25];
Camera_position = [48.4664, -103.937, 80.3007];
Distance = 1e3;
//setting these positions the camera exactly, and calculates the focus point from that
//this means changing the distance maintains the same perspective but changes the zoom, effectively just changing the clipping planes
show_camera_hologram=true;

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

translate([-10,40,-10]){
        sphere(5);
}

translate([-0.6e4,2e4,-1e4]){
        sphere(1e3);
}

translate([-0.6e6,1e6,-1e6]){
        sphere(1e5);
}
translate([-0.4e6,1e6,-1e6]){
        sphere(1e4);
}
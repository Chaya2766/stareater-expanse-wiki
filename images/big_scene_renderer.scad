//camera has rotation [90,?,?] when aligned with the XY plane so the first coordinate is NOT elevation. going below the plane pushes it above 90

Elevation = 90-$vpr[0];
echo(Elevation);

//either the azimuth is also offset by 90 degrees or I don't know how to use these equations
//and I'm quite certain I don't understand these equations
//but my fix seems to work anyway

Azimuth = $vpr[2]-90;

Distance = $vpd;

Px = $vpt[0];
Py = $vpt[1];
Pz = $vpt[2];

Cx = Px + Distance * cos(Elevation) * cos(Azimuth);
Cy = Py + Distance * cos(Elevation) * sin(Azimuth);
Cz = Pz + Distance * sin(Elevation);

camera_cone_rotation = [
    $vpr[0]+180,
    $vpr[1],
    $vpr[2]
];

translate([Cx,Cy,Cz]){
    rotate(camera_cone_rotation){
        color([0,1,0,0.5]){
            %cylinder(r1=1,r2=Distance*0.3,h=Distance);
        }
    }
}

sphere(5);

translate([-0.6e4,2e4,-1e4]){
        sphere(1e3);
}

translate([-0.6e6,1e6,-1e6]){
        sphere(1e5);
}
translate([-0.4e6,1e6,-1e6]){
        sphere(1e4);
}
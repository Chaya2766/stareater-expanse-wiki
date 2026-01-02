module parabolic_mirror(focal_length=20,mirror_length=80,thickness=1,detail=16){
    // Parameters
    f = focal_length;           // focal length (mm)
    z_max = mirror_length;       // mirror depth (mm)
    segments = detail;   // increase for smoother curve
    thickness = thickness;    // rim thickness (optional)

    // build 2D profile points (x,z)
    pts = [for (i = [0:segments]) let(z = z_max * i/segments, x = 2*sqrt(f*z)) [x, z]];
    // optionally close inner vertex and add rim thickness
    profile = concat([[0,0]], pts, [[0,z_max+thickness]]);

    difference(){
        color("#888"){rotate_extrude($fn = segments)polygon(points = profile);}
        translate([0,0,thickness]){
            color("#CCC"){rotate_extrude($fn = segments)polygon(points = profile);}
        }
    }
}

//100,80 = 180
//50,80 = 130
//50,50 = 100
//so the radius of the mirror as seen from head on is just the focal length plus mirror length

module concentrated_solar_array(array_radius,collector_radius,thickness=1,detail=16){
    /*
    focus = array_radius*(3/4);
    depth = array_radius*(1.33/4);
    //1.33 derived empirically to achieve correct radius
    */
    focus = array_radius;
    depth = array_radius/4;
    //this new way of calculating the focus and depth also results in correct size
    //but this time it feels way too elegant to be a coincidence
    //I don't know the math behind why it should work out this way
    parabolic_mirror(focus,depth,thickness,detail);
    color("#888"){
    translate([0,0,focus]){cylinder(r=collector_radius,h=thickness);}
    for(i=[0:1:8]){
        rotate([0,0,i*45]){
            hull(){
                translate([array_radius-thickness,0,depth]){sphere(thickness/2);}
                translate([collector_radius,0,focus+thickness/2]){sphere(thickness/2);}
            }
        }
    }}
}

module mobile_concentrated_solar_array(array_radius,collector_radius,thickness=1){
    concentrated_solar_array(array_radius,collector_radius,thickness);
    translate([0,0,-array_radius/2]){cylinder(r=0.5,h=2*array_radius);}
    translate([0,0,-array_radius/2]){sphere(r=3);}
    translate([0,0,1.5*array_radius]){sphere(r=3);}
    }

rotate([0,90,0]){
concentrated_solar_array(50,5,0.1,32);
}

$vpr=[105,0,35];
$vpd=325;
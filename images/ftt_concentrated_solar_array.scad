use <ftt_solar_tile.scad>

module parabolic_mirror(focal_length=20e3,mirror_length=80e3,thickness=1e3,detail=16){
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
    //collector assembly
    pipe_th=0.2e3;//pipe thickness
    rad_len=25e3;//radiator length
    rad_rad=5.7e3;//radius to which radiators extend
    show_tiles = false;
    translate([0,0,focus]){
        if(show_tiles){
            rotate([180,0,0]){solar_array(d=2*collector_radius);}
        } else { color("#888"){cylinder(r=collector_radius,h=thickness);} }
        color("#888"){translate([0,0,0.1e3+pipe_th]){
        for(a=[90:90:360]){
            rotate([0,0,a]){
                hull(){//near pipes
                    translate([0,0,0]){sphere(pipe_th);}
                    translate([rad_rad,0,0]){sphere(pipe_th);}
                }
                for(x=[1e3:1.1e3:rad_rad]){//radiators
                    translate([x,0,rad_len/2]){cube([1e3,0.1e3,rad_len],true);}
                }
                hull(){//far pipes
                    translate([0,0,rad_len]){sphere(pipe_th);}
                    translate([rad_rad,0,rad_len]){sphere(pipe_th);}
                }
            }
        }
        hull(){//middle pipe
            translate([0,0,0e3]){sphere(pipe_th);}
            translate([0,0,rad_len]){sphere(pipe_th);}
        }
        }}
    }
    //support struts
    color("#888"){
    for(i=[0:1:8]){
        rotate([0,0,i*45]){
            hull(){
                translate([array_radius-thickness,0,depth]){sphere(thickness/2);}
                translate([collector_radius,0,focus+thickness/2]){sphere(thickness/2);}
            }
        }
    }
    }
}

module mobile_concentrated_solar_array(array_radius,collector_radius,thickness=1){
    concentrated_solar_array(array_radius,collector_radius,thickness);
    translate([0,0,-array_radius/2]){cylinder(r=0.5e3,h=2*array_radius);}
    translate([0,0,-array_radius/2]){sphere(r=3e3);}
    translate([0,0,1.5*array_radius]){sphere(r=3e3);}
    }

rotate([0,90,0]){
concentrated_solar_array(50e3,5e3,0.1e3,32);
}

$vpr=[105,0,35];
$vpt=[30e3,0,0];
$vpd=325e3;

//openscad ftt_concentrated_solar_array.scad -o ftt_concentrated_solar_array.png --colorscheme=Starnight --imgsize=1000,1000
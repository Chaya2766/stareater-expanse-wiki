target_point = [10,10,10];
target_rotation = [55,0,25];//never use the middle angle
//do not rotate about the y axis
render_distance = 140;
show_camera=true;
force_camera=true;

//this calculates the position of the viewport camera
cam_position=[
    target_point[0]+(sin(target_rotation[2])*cos(target_rotation[0])*render_distance*sqrt(2)),
    target_point[1]-(cos(target_rotation[2])*cos(target_rotation[0])*render_distance*sqrt(2)),
    target_point[2]+(sin(target_rotation[2])*render_distance*sqrt(2))-4
];

//this calculates the angle of the viewport camera
cam_rotation=[
    target_rotation[0]+180,
    target_rotation[1],
    target_rotation[2]
];

//comment these out if you don't want to force camera into position
$vpt=target_point;
$vpr=target_rotation;
$vpd=render_distance;
//todo, figure out how to transform these such that the vpt becomes more distant without actually affecting the real position of the camera

if(show_camera){
    color([1,0,0]){
        translate(cam_position){sphere(1);}
    }

    color([0,1,0,0.5]){
        translate(cam_position){
            rotate(cam_rotation){
                %cylinder(r1=1,r2=render_distance*0.3,h=render_distance);
            }
        }
    }

    color([0,0,1]){
        translate(target_point){sphere(1);}
    }
}

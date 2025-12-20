use <robot_arm.scad>
use <power_connector.scad>

module light_droid(paint="#EEE",metal="#888"){
    limb_lengths=[350,50,350,50,200,50,0];
    
    //main body
    translate([0,0,0]){rotate([0,90,0]){
        color(paint){cylinder(d=50,h=1000,center=true);}
    }}
    translate([-500,0,0]){rotate([0,-90,0]){
        plug();
    }}
    
    //hind legs on the main body
    translate([-250,0,0]){rotate([0,90,90]){
        color(paint){cylinder(d=50,h=100,center=true);}
    }}
    translate([-250,50,0]){rotate([0,90,90]){
        robot_arm([90,0,-60,0,60,0],//joint bends
                  [0,-45,0,0,0,0],//joint twists
                  limb_lengths,//segment lengths
                  [0,0,0,0,0,0,0,0],//finger angles
                  [100,100,100,100,100,100,100,100],
                  diameter=50,paint=paint,metal=metal);
    }}
    translate([-250,-50,0]){rotate([0,90,-90]){
        robot_arm([90,0,-60,0,60,0],//joint bends
                  [0,45,0,0,0,0],//joint twists
                  limb_lengths,//segment lengths
                  [0,0,0,0,0,0,0,0],//finger angles
                  [100,100,100,100,100,100,100,100],
                  diameter=50,paint=paint,metal=metal);
    }}
    
    
    //front legs on the main body
    translate([250,0,0]){rotate([0,90,90]){
        color(paint){cylinder(d=50,h=100,center=true);}
    }}
    translate([250,50,0]){rotate([0,90,90]){
        robot_arm([90,0,-60,0,60,0],//joint bends
                  [0,45,0,0,0,0],//joint twists
                  limb_lengths,//segment lengths
                  [0,0,0,0,0,0,0,0],//finger angles
                  [100,100,100,100,100,100,100,100],
                  diameter=50,paint=paint,metal=metal);
    }}
    translate([250,-50,0]){rotate([0,90,-90]){
        robot_arm([90,0,-60,0,60,0],//joint bends
                  [0,-45,0,0,0,0],//joint twists
                  limb_lengths,//segment lengths
                  [0,0,0,0,0,0,0,0],//finger angles
                  [100,100,100,100,100,100,100,100],
                  diameter=50,paint=paint,metal=metal);
    }}
    
    
    body_angles=[-50,-50,60,60,30];
    body_lengths=[200,1000,200,100,100,100];
    //continuation of the body
    translate([500,0,0]){rotate([0,90,0]){
        robot_arm(body_angles,
                  [0,0,0,0,0],
                  body_lengths,
                  diameter=50,paint=paint,metal=metal);
    }}
    
    //this is a massive chain of translations and rotations to move the arms onto the upper body
    translate([500+(50*1),0,0]){
    rotate([0,body_angles[0],0]){
    translate([(50*1.6)+body_lengths[0],0,0]){
    rotate([0,body_angles[1],0]){
    translate([(50*1.6)+body_lengths[1]/2,0,0]){
    //I suspect that my code does something at every joint
    //with the exception of the first joint
    //and that's why all segments are translated forward by
    //1.6 times the diameter, but the first one only by 1 times
    
    //lower arms on the upper body
    translate([-250,0,0]){rotate([0,90,90]){
        color(paint){cylinder(d=50,h=100,center=true);}
    }}
    translate([-250,50,0]){rotate([0,90,90]){
        robot_arm([60,30,-60,-60,30,30,0],//joint bends
                  [120,-5,90,0,-90,0],//joint twists
                  limb_lengths,//segment lengths
                  [60,60,60,60,60,60,60,60],//finger bends
                  [100,100,100,100,100,100,100,100],//finger lengths
                  diameter=50,paint=paint,metal=metal);
    }}
    translate([-250,-50,0]){rotate([0,90,-90]){
        robot_arm([60,30,-60,-60,30,30,0],//joint bends
                  [-120,5,-90,0,90,0],//joint twists
                  limb_lengths,//segment lengths
                  [60,60,60,60,60,60,60,60],//finger bends
                  [100,100,100,100,100,100,100,100],//finger lengths
                  diameter=50,paint=paint,metal=metal);
    }}
    
    
    //upper arms on the upper body
    translate([250,0,0]){rotate([0,90,90]){
        color(paint){cylinder(d=50,h=100,center=true);}
    }}
    translate([250,50,0]){rotate([0,90,90]){
        robot_arm([60,30,-60,-60,30,30,0],//joint bends
                  [120,-5,90,0,-90,0],//joint twists
                  limb_lengths,//segment lengths
                  [60,60,60,60,60,60,60,60],//finger bends
                  [100,100,100,100,100,100,100,100],//finger lengths
                  diameter=50,paint=paint,metal=metal);
    }}
    translate([250,-50,0]){rotate([0,90,-90]){
        robot_arm([60,30,-60,-60,30,30,0],//joint bends
                  [-120,5,-90,0,90,0],//joint twists
                  limb_lengths,//segment lengths
                  [60,60,60,60,60,60,60,60],//finger bends
                  [100,100,100,100,100,100,100,100],//finger lengths
                  diameter=50,paint=paint,metal=metal);
    }}
    
    }}}}}
}

translate([0,0,1210]){light_droid();}

//$vpr = [70,0,180*$t];
//$vpt = [0,0,50];
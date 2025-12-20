use <robot_arm.scad>
use <power_connector.scad>

module light_droid(paint="#EEE",metal="#888"){
    //lists of joint angles for posing
    limb_lengths=[350,50,350,50,200,50,0];
    body_lengths=[200,1000,200,100,100,100];
    body_angles=[-50,-50,60,60,30];
    leg_hind_left_bends = [90,0,-60,0,60,0];
    leg_hind_left_twists = [0,-45,0,0,0,0];
    leg_hind_right_bends = [90,0,-60,0,60,0];
    leg_hind_right_twists = [0,45,0,0,0,0];
    leg_front_left_bends = [90,0,-60,0,60,0];
    leg_front_left_twists = [0,45,0,0,0,0];
    leg_front_right_bends = [90,0,-60,0,60,0];
    leg_front_right_twists = [0,-45,0,0,0,0];
    arm_lower_left_bends = [60,30,-60,-60,30,30,0];
    arm_lower_left_twists = [120,-5,90,0,-90,0];
    arm_lower_right_bends = [60,30,-60,-60,30,30,0];
    arm_lower_right_twists = [-120,5,-90,0,90,0];
    arm_upper_left_bends = [60,30,-60,-60,30,30,0];
    arm_upper_left_twists = [120,-5,90,0,-90,0];
    arm_upper_right_bends = [60,30,-60,-60,30,30,0];
    arm_upper_right_twists = [-120,5,-90,0,90,0];
    
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
        robot_arm(leg_hind_left_bends,//joint bends
                  leg_hind_left_twists,//joint twists
                  limb_lengths,//segment lengths
                  [0,0,0,0,0,0,0,0],//finger angles
                  [100,100,100,100,100,100,100,100],
                  diameter=50,paint=paint,metal=metal);
    }}
    translate([-250,-50,0]){rotate([0,90,-90]){
        robot_arm(leg_hind_right_bends,//joint bends
                  leg_hind_right_twists,//joint twists
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
        robot_arm(leg_front_left_bends,//joint bends
                  leg_front_left_twists,//joint twists
                  limb_lengths,//segment lengths
                  [0,0,0,0,0,0,0,0],//finger angles
                  [100,100,100,100,100,100,100,100],
                  diameter=50,paint=paint,metal=metal);
    }}
    translate([250,-50,0]){rotate([0,90,-90]){
        robot_arm(leg_front_right_bends,//joint bends
                  leg_front_right_twists,//joint twists
                  limb_lengths,//segment lengths
                  [0,0,0,0,0,0,0,0],//finger angles
                  [100,100,100,100,100,100,100,100],
                  diameter=50,paint=paint,metal=metal);
    }}
    
    
    
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
        robot_arm(arm_lower_left_bends,//joint bends
                  arm_lower_left_twists,//joint twists
                  limb_lengths,//segment lengths
                  [60,60,60,60,60,60,60,60],//finger bends
                  [100,100,100,100,100,100,100,100],//finger lengths
                  diameter=50,paint=paint,metal=metal);
    }}
    translate([-250,-50,0]){rotate([0,90,-90]){
        robot_arm(arm_lower_right_bends,//joint bends
                  arm_lower_right_twists,//joint twists
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
        robot_arm(arm_upper_left_bends,//joint bends
                  arm_upper_left_twists,//joint twists
                  limb_lengths,//segment lengths
                  [60,60,60,60,60,60,60,60],//finger bends
                  [100,100,100,100,100,100,100,100],//finger lengths
                  diameter=50,paint=paint,metal=metal);
    }}
    translate([250,-50,0]){rotate([0,90,-90]){
        robot_arm(arm_upper_right_bends,//joint bends
                  arm_upper_right_twists,//joint twists
                  limb_lengths,//segment lengths
                  [60,60,60,60,60,60,60,60],//finger bends
                  [100,100,100,100,100,100,100,100],//finger lengths
                  diameter=50,paint=paint,metal=metal);
    }}
    
    }}}}}
    
    color("#EEE8"){union(){
    
    //skin is a bunch of hulls
    hull(){
    translate([-500,0,0]){sphere(50);}
    translate([-400,0,0]){sphere(100);}
    translate([-300,0,0]){sphere(125);}
    translate([-000,0,0]){sphere(150);}
    translate([500+(50*1),0,0]){sphere(125);}
    }
    
    hull(){
    translate([500+(50*1),0,0]){sphere(125);
    rotate([0,body_angles[0],0]){
    translate([(50*1.6)+body_lengths[0],0,0]){sphere(125);}}}
    }
    
    hull(){
    translate([500+(50*1),0,0]){
    rotate([0,body_angles[0],0]){
    translate([(50*1.6)+body_lengths[0],0,0]){sphere(125);
    rotate([0,body_angles[1],0]){
    translate([(50*1.6)+body_lengths[1]*1/3,0,0]){sphere(125);}
    translate([(50*1.6)+body_lengths[1]*1/2,0,0]){sphere(150);}
    translate([(50*1.6)+body_lengths[1]*2/3,0,0]){sphere(125);}
    translate([(50*1.6)+body_lengths[1],0,0]){sphere(75);}
    }}}}
    }
    
    hull(){
    translate([500+(50*1),0,0]){
    rotate([0,body_angles[0],0]){
    translate([(50*1.6)+body_lengths[0],0,0]){
    rotate([0,body_angles[1],0]){
    translate([(50*1.6)+body_lengths[1],0,0]){sphere(75);
    rotate([0,body_angles[2],0]){
    translate([(50*1.6)+body_lengths[2],0,0]){sphere(75);}
    }}}}}}
    }
    
    hull(){
    translate([500+(50*1),0,0]){
    rotate([0,body_angles[0],0]){
    translate([(50*1.6)+body_lengths[0],0,0]){
    rotate([0,body_angles[1],0]){
    translate([(50*1.6)+body_lengths[1],0,0]){
    rotate([0,body_angles[2],0]){
    translate([(50*1.6)+body_lengths[2],0,0]){sphere(75);
    rotate([0,body_angles[3],0]){
    translate([(50*1.6)+body_lengths[3],0,0]){sphere(75);}
    }}}}}}}}
    }
    
    hull(){
    translate([500+(50*1),0,0]){
    rotate([0,body_angles[0],0]){
    translate([(50*1.6)+body_lengths[0],0,0]){
    rotate([0,body_angles[1],0]){
    translate([(50*1.6)+body_lengths[1],0,0]){
    rotate([0,body_angles[2],0]){
    translate([(50*1.6)+body_lengths[2],0,0]){
    rotate([0,body_angles[3],0]){
    translate([(50*1.6)+body_lengths[3],0,0]){sphere(75);
    rotate([0,body_angles[4],0]){
    translate([(50*1.6)+body_lengths[4],0,0]){sphere(30);}
    translate([(50*1.6)+body_lengths[4]+40,0,0]){sphere(5);}
    }}}}}}}}}}
    }
    
    //left hind leg
    hull(){
    translate([-250,50,0]){rotate([0,90,90]){
        sphere(75);
        translate([0,0,50]){sphere(75);}
    }}
    }
    
    hull(){
    translate([-250,50,0]){rotate([0,90,90]){
    translate([0,0,50]){sphere(75);
    rotate([0,leg_hind_left_bends[0],leg_hind_left_twists[0]]){
    translate([0,0,limb_lengths[0]+(50*1.6)]){sphere(75);
    }}}}}
    }
    
    hull(){
    translate([-250,50,0]){rotate([0,90,90]){
    translate([0,0,50]){
    rotate([0,leg_hind_left_bends[0],leg_hind_left_twists[0]]){
    translate([0,0,limb_lengths[0]+(50*1.6)]){sphere(75);
    rotate([0,leg_hind_left_bends[1],leg_hind_left_twists[1]]){
    translate([0,0,limb_lengths[1]+(50*1.6)]){sphere(65);
    }}}}}}}
    }
    
    hull(){
    translate([-250,50,0]){rotate([0,90,90]){
    translate([0,0,50]){
    rotate([0,leg_hind_left_bends[0],leg_hind_left_twists[0]]){
    translate([0,0,limb_lengths[0]+(50*1.6)]){
    rotate([0,leg_hind_left_bends[1],leg_hind_left_twists[1]]){
    translate([0,0,limb_lengths[1]+(50*1.6)]){sphere(65);
    rotate([0,leg_hind_left_bends[2],leg_hind_left_twists[2]]){
    translate([0,0,limb_lengths[2]+(50*1.6)]){sphere(65);
    }}}}}}}}}
    }
    
    hull(){
    translate([-250,50,0]){rotate([0,90,90]){
    translate([0,0,50]){
    rotate([0,leg_hind_left_bends[0],leg_hind_left_twists[0]]){
    translate([0,0,limb_lengths[0]+(50*1.6)]){
    rotate([0,leg_hind_left_bends[1],leg_hind_left_twists[1]]){
    translate([0,0,limb_lengths[1]+(50*1.6)]){
    rotate([0,leg_hind_left_bends[2],leg_hind_left_twists[2]]){
    translate([0,0,limb_lengths[2]+(50*1.6)]){sphere(65);
    rotate([0,leg_hind_left_bends[3],leg_hind_left_twists[3]]){
    translate([0,0,limb_lengths[3]+(50*1.6)]){sphere(65);
    }}}}}}}}}}}
    }
    
    hull(){
    translate([-250,50,0]){rotate([0,90,90]){
    translate([0,0,50]){
    rotate([0,leg_hind_left_bends[0],leg_hind_left_twists[0]]){
    translate([0,0,limb_lengths[0]+(50*1.6)]){
    rotate([0,leg_hind_left_bends[1],leg_hind_left_twists[1]]){
    translate([0,0,limb_lengths[1]+(50*1.6)]){
    rotate([0,leg_hind_left_bends[2],leg_hind_left_twists[2]]){
    translate([0,0,limb_lengths[2]+(50*1.6)]){
    rotate([0,leg_hind_left_bends[3],leg_hind_left_twists[3]]){
    translate([0,0,limb_lengths[3]+(50*1.6)]){sphere(65);
    rotate([0,leg_hind_left_bends[4],leg_hind_left_twists[4]]){
    translate([0,0,limb_lengths[4]+(50*1.6)]){sphere(65);
    }}}}}}}}}}}}}
    }
    
    hull(){
    translate([-250,50,0]){rotate([0,90,90]){
    translate([0,0,50]){
    rotate([0,leg_hind_left_bends[0],leg_hind_left_twists[0]]){
    translate([0,0,limb_lengths[0]+(50*1.6)]){
    rotate([0,leg_hind_left_bends[1],leg_hind_left_twists[1]]){
    translate([0,0,limb_lengths[1]+(50*1.6)]){
    rotate([0,leg_hind_left_bends[2],leg_hind_left_twists[2]]){
    translate([0,0,limb_lengths[2]+(50*1.6)]){
    rotate([0,leg_hind_left_bends[3],leg_hind_left_twists[3]]){
    translate([0,0,limb_lengths[3]+(50*1.6)]){
    rotate([0,leg_hind_left_bends[4],leg_hind_left_twists[4]]){
    translate([0,0,limb_lengths[4]+(50*1.6)]){sphere(65);
    rotate([0,leg_hind_left_bends[5],leg_hind_left_twists[5]]){
    translate([0,0,limb_lengths[5]+(50*0)]){sphere(50);
    }}}}}}}}}}}}}}}
    }
    
    //and now how the fuck am I gonna calculate the positions of finger joints
    //I am tempted to just leave them skinless because
    //that's gonna be as much code as I just added, but for every finger of every limb
    //there are 32 fingers, am I really gonna do that to myself?
    
    }}
}

translate([0,0,1210]){light_droid();}

//$vpr = [70,0,180*$t];
//$vpt = [0,0,50];
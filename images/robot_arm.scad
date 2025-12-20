module robot_joint(angle=0,diameter=10){
    difference(){
        union(){
            cylinder(d=diameter,h=diameter);
            translate([0,0,diameter]){sphere(d=diameter);}
            translate([0,0,diameter*0.2]){cylinder(d=diameter*1.2,h=diameter*0.2);}
        }
        translate([0,0,diameter*1.5]){cube([diameter*1.6,diameter*0.8,diameter*1.8],true);}
    }
    translate([0,0,diameter]){rotate([0,angle,0]){
        union(){
            rotate([90,0,0]){
                cylinder(h=diameter*0.81,d=diameter*0.4,center=true);
                cylinder(h=diameter*0.7,d=diameter*0.7,center=true);
                cylinder(h=diameter*0.2,d=diameter*0.8,center=true);
            }
            translate([0,0,diameter*0.1]){cylinder(h=diameter*0.4,d=diameter*0.7);}
            translate([0,0,diameter*0.5]){cylinder(h=diameter*0.1,d1=diameter*0.7,d2=diameter);}
        }
    }}
}

module robot_arm(bends=[0,0,0], twists=[0,0,0], lengths=[100,100,100], finger_angles=[],finger_lengths=[], n=0, diameter=10){
    if(n<min(len(bends),len(twists),len(lengths))){
        rotate([0,0,twists[n]]){
            robot_joint(bends[n],diameter);
            translate([0,0,diameter]){rotate([0,bends[n],0]){translate([0,0,diameter*0.6]){
                cylinder(d=diameter,h=lengths[n]);
                translate([0,0,lengths[n]]){robot_arm(bends,twists,lengths,finger_angles,finger_lengths,n+1,diameter);}
            }}}
        }
    } else {
        effector(finger_angles,finger_lengths,diameter=diameter);
    }
}

module effector(finger_angles=[],finger_lengths=[],diameter=10){
    if(len(finger_angles)>0 && len(finger_lengths)>0){
        fa=finger_angles;
        fl=finger_lengths;
    translate([0,0,3]){cube(6,true);
        rotate([0,-90,0]){translate([0,0,3]){scale(0.5){
            robot_arm([fa[0],fa[1]],[0,0],[fl[0],fl[1]],diameter=diameter);
            }}}
            rotate([90,-90,0]){translate([0,0,3]){scale(0.5){
                robot_arm([fa[2],fa[3]],[0,0],[fl[2],fl[3]],diameter=diameter);
            }}}
            rotate([180,-90,0]){translate([0,0,3]){scale(0.5){
                robot_arm([fa[4],fa[5]],[0,0],[fl[4],fl[5]],diameter=diameter);
            }}}
            rotate([270,-90,0]){translate([0,0,3]){scale(0.5){
                robot_arm([fa[6],fa[7]],[0,0],[fl[6],fl[7]],diameter=diameter);
            }}}
        }
    } else {
        sphere(diameter/2);
    }
}

robot_arm([0,30,60,90,0],[0,0,0,0,0],[50,50,50,50,0],[90,0,90,0,90,0,90,0],[0,50,0,50,0,50,0,50],diameter=10);
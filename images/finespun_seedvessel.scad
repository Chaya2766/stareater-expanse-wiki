module pillship(){
    
    //pill core start
    difference(){
        union(){
            color([0.4,0.4,0.4])sphere(50);
            color([0.2,0.25,0.5])cylinder(h=100,r=50);
            color([0.4,0.4,0.4])translate([0,0,100]){sphere(50);}
        }
        union(){
            color([0.4,0.4,0.4])sphere(49.9);
            color([0.4,0.4,0.4])cylinder(h=100,r=49.9);
            color([0.4,0.4,0.4])translate([0,0,100]){sphere(49.9);}
            //holes for hangars
            for(i=[90:90:360]){
                rotate([0,0,i]){
                    translate([-49,-4,90])cube([8,8,50]);
                    translate([-49,-4,-31])cube([8,8,32]);
                }
            }
            //central engine hole
            translate([0,0,-51]){cylinder(r=2,h=50);}
        }
    }
    //pill core end
    
    //central structure
    color([0.4,0.4,0.4]){
        difference(){
            intersection(){
                translate([0,0,-50]){cylinder(r=8,h=200);}
                union(){
                    sphere(49.5);
                    cylinder(h=100,r=49.5);
                    translate([0,0,100]){sphere(49.5);}
                }
            }
            translate([0,0,-50]){cylinder(r=7.9,h=200);}
        }
    }
    //central structure end
    
    //rear fuel tanks start
    color([0.4,0.4,0.4]){
        for(i=[90:90:360]){
            rotate([0,0,i]){
                translate([23,0,-26]){
                    difference(){
                        sphere(15);
                        sphere(14.9);
                    }
                    translate([-15/sqrt(2),0,15/sqrt(2)]){
                        rotate([0,-45,0])cylinder(r=0.5,h=7.5);}
                    translate([-15/sqrt(2),0,-15/sqrt(2)]){
                        rotate([0,-135,0])cylinder(r=0.5,h=7.5);}
                    translate([-15/sqrt(2),15/sqrt(2),0]){
                        rotate([0,-90,-45])cylinder(r=0.5,h=3.5);}
                        
                    translate([18,0,15]){
                        rotate([0,-90,0])cylinder(r=0.5,h=33);}
                }
            }
        }
        for(i=[45:90:360]){
            rotate([0,0,i]){
                translate([33,0,-7]){
                    difference(){
                        sphere(15);
                        sphere(14.9);
                    }
                    translate([-15/sqrt(2),0,-15/sqrt(2)]){
                        rotate([0,-135,0])cylinder(r=0.5,h=21.5);}
                    translate([-15,0,0]){
                        rotate([0,-90,0])cylinder(r=0.5,h=10);}
                    translate([16,0,15]){
                        rotate([0,-90,0])cylinder(r=0.5,h=42);}
                }
            }
        }
    }
    //rear fuel tanks end
    
    //front fuel tanks start
    color([0.4,0.4,0.4]){
        for(i=[90:90:360]){
            rotate([0,0,i]){
                translate([23,0,126]){
                    difference(){
                        sphere(15);
                        sphere(14.9);
                    }
                    translate([-15/sqrt(2),0,15/sqrt(2)]){
                        rotate([0,-45,0])cylinder(r=0.5,h=7.5);}
                    translate([-15/sqrt(2),0,-15/sqrt(2)]){
                        rotate([0,-135,0])cylinder(r=0.5,h=7.5);}
                    translate([-15/sqrt(2),15/sqrt(2),0]){
                        rotate([0,-90,-45])cylinder(r=0.5,h=3.5);}
                        
                    translate([18,0,-15]){
                        rotate([0,-90,0])cylinder(r=0.5,h=33);}
                }
            }
        }
        for(i=[45:90:360]){
            rotate([0,0,i]){
                translate([33,0,107]){
                    difference(){
                        sphere(15);
                        sphere(14.9);
                    }
                    translate([-15/sqrt(2),0,15/sqrt(2)]){
                        rotate([0,-45,0])cylinder(r=0.5,h=21.5);}
                    translate([-15,0,0]){
                        rotate([0,-90,0])cylinder(r=0.5,h=10);}
                    translate([16,0,-15]){
                        rotate([0,-90,0])cylinder(r=0.5,h=42);}
                }
            }
        }
    }
    //front fuel tanks end
    
    //engine start
    difference(){
        color([0.5,0.5,0.5])translate([0,0,-50]){
            translate([0,0,-7])cylinder(h=8,r=8);
            translate([0,0,-15])cylinder(h=8,r1=2,r2=8);
            translate([0,0,-23])cylinder(h=8,r1=8,r2=2);
            translate([0,0,-31])cylinder(h=8,r1=10,r2=8);
        }
        color([0.2,0.2,0.2])translate([0,0,-50]){
            translate([0,0,-24])cylinder(h=8,r1=8,r2=2);
            translate([0,0,-31.5])cylinder(h=8,r1=10,r2=8);
            translate([0,0,-7])cylinder(h=12,r=6.9);
            translate([0,0,-15])cylinder(h=8,r1=1,r2=7);
            translate([0,0,-17])cylinder(h=3,r1=1);
        }
    }
    //engine end
    
    //hangar bays
    color([0.5,0.5,0.5]){
        for(i=[90:90:360]){
            rotate([0,0,i]){
                //front hangars
                difference(){
                    translate([-50,-5,100])cube([10,10,30]);
                    translate([-49,-4,90])cube([8,8,50]);
                }
                translate([-49,-4,130])cube([8,8,1]);
                translate([-49,-4,99])cube([8,8,1]);
                //rear hangars
                difference(){
                    translate([-50,-5,-30])cube([10,10,30]);
                    translate([-49,-4,-31])cube([8,8,32]);
                }
                translate([-49,-4,-31])cube([8,8,1]);
                translate([-49,-4,0])cube([8,8,1]);
            }
        }
    }
    /*
    //hangar bay elevator rails
    color([0.6,0.6,0.6]){
        intersection(){
        union(){
            translate([4,0,100])rotate([0,90,0]){cylinder(r=51,h=1,center=true);}
            translate([-4,0,100])rotate([0,90,0]){cylinder(r=51,h=1,center=true);}
            translate([0,4,100])rotate([90,0,0]){cylinder(r=51,h=1,center=true);}
            translate([0,-4,100])rotate([90,0,0]){cylinder(r=51,h=1,center=true);}
        }
        difference(){
            cylinder(r=45,h=200);
            cube([20,20,500],true);
        }
        }
    }
    */
    //runways
    color([0.5,0.5,0.5]){
        difference(){
            translate([0,0,125])cylinder(r=50,h=15);
            cylinder(r=49.9,h=300);
        }
        difference(){
            translate([0,0,-40])cylinder(r=50,h=15);
            cylinder(r=49.9,h=300,center=true);
        }
    }
}

difference(){
    pillship();
    translate([100,0,0])cube([300*$t,500,500],true);
}
$vpt=[0,0,50];
//$vpr=[90+45*sin(2*$t*360),0,360*$t];
$vpr=[60,0,45+(90*$t)];
$vpd=800;
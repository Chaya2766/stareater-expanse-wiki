module estimate(memory=8,learning=0.2,paralel=1,name){
    
    dec = 1000;//rounding constant
    
    memory_est = log(memory)/4.5;
    learning_est = 1.2*learning^5 - 0.4*learning^4 - 1.5*learning^2 + 1.7*learning;
    //S = [ S = 1.2x^5 - 0.4x^4 - 1.5x^2 + 1.7x ]
    paralel_est = log(10*paralel + 1)/5.5;
    //[log10(10x + 1)/5.5]
    
    est_coordinates = [memory_est,learning_est,paralel_est];
    S_est = (memory_est + learning_est + paralel_est)/3;
    
    nrm = S_est/norm(est_coordinates);//vector scaling constant
    nrm_est_coordinates = [memory_est*nrm,learning_est*nrm,paralel_est*nrm];
    
    target_radius = $vpd*0.5*fontsize;

    translate(est_coordinates){
        sphere(target_radius,$fn=8);
        rotate($vpr){
            translate([0,target_radius*2,0]){
                linear_extrude(0.01){
                    text(name,target_radius*1.2,halign="center",valign="center");
                }
            }
            translate([0,target_radius*-2,0]){
                linear_extrude(0.01){
                    text(str("S:",round(dec*S_est)/dec),target_radius*1.2,halign="center",valign="center");
                }
            }
            /*
            translate([0,target_radius*-1.5,0]){
                linear_extrude(0.01){
                    text(str("memory: ",memory,"  ->  Si:",round(dec*memory_est)/dec),target_radius*0.35,halign="center",valign="center");
                }
            }
            translate([0,target_radius*-2,0]){
                linear_extrude(0.01){
                    text(str("learn. rate: ",learning,"  ->  Si:",round(dec*learning_est)/dec),target_radius*0.35,halign="center",valign="center");
                }
            }
            */
        }
    }
}

estimate(4,0.05,1,"UEIA");
estimate(8,0.2,1,"Patricia");
estimate(24,0.488,3,"Soica");
estimate(131,0.837,32,"Serendipity");
estimate(1024,1,256,"ITON");
estimate(1048576,0.871,262144,"Torpensoor");

$vpt = [0.7,0.7,0.7];
$vpr = [60,0,30+(360*$t)];
$vpd = 6;
fontsize = 1/100;

color([1,1,1]){
translate([1,-0.16,0]){rotate([0,0,0]){linear_extrude($vpd*fontsize*0.1){text("working memory",2*$vpd*fontsize,halign="center",valign="center");}}}
translate([-0.16,0.9,0]){rotate([0,0,90]){linear_extrude($vpd*fontsize*0.1){text("learning rate",2*$vpd*fontsize,halign="center",valign="center");}}}
translate([-0.16,0,1.08]){rotate([0,-90,90]){linear_extrude($vpd*fontsize*0.1){text("parallel processes",2*$vpd*fontsize,halign="center",valign="center");}}}
}

%color([0,1,0,0.15]){hull(){
    translate([0.3*3,0,0]){sphere(0.01);}
    translate([0,0.3*3,0]){sphere(0.01);}
    translate([0,0,0.3*3]){sphere(0.01);}
}}
color([0,1,0]){translate([0.01,3*0.3-0.12,0]){rotate([0,0,-45]){linear_extrude($vpd*fontsize*0.1){text("baselines",$vpd*fontsize);}}}}

%color([1,1,0,0.15]){hull(){
    translate([0.5*3,0,0]){sphere(0.01);}
    translate([0,0.5*3,0]){sphere(0.01);}
    translate([0,0,0.5*3]){sphere(0.01);}
}}
color([1,1,0]){translate([0.01,3*0.5-0.12,0]){rotate([0,0,-45]){linear_extrude($vpd*fontsize*0.1){text("brights",$vpd*fontsize);}}}}

%color([1,0,1,0.15]){hull(){
    translate([0.9*3,0,0]){sphere(0.01);}
    translate([0,0.9*3,0]){sphere(0.01);}
    translate([0,0,0.9*3]){sphere(0.01);}
}}
color([1,0,1]){translate([0.01,3*0.9-0.12,0]){rotate([0,0,-45]){linear_extrude($vpd*fontsize*0.1){text("superbrights",$vpd*fontsize);}}}}

%color([0,1,1,0.15]){hull(){
    translate([1*3,0,0]){sphere(0.01);}
    translate([0,1*3,0]){sphere(0.01);}
    translate([0,0,1*3]){sphere(0.01);}
}}
color([0,1,1]){translate([0.01,3*1-0.12,0]){rotate([0,0,-45]){linear_extrude($vpd*fontsize*0.1){text("superiors",$vpd*fontsize);}}}}

color([1,1,1]){translate([0.01,3*1.01,0]){rotate([0,0,-45]){linear_extrude($vpd*fontsize*0.1){text("transapients",$vpd*fontsize);}}}}

/*
color([0,1,0,0.2]){rotate([0,62,60]){
    cylinder(h=3,r1=0,r2=0.5,$fn=16);
}}
*/

//openscad toposophic_estimations.scad -o toposophic_estimations.png --colorscheme=Starnight --imgsize=1000,1000 --view=axes,scales --projection=ortho
//for animated view recommend render 80 frames at 2 FPS
$vpr=[0,0,0];
$vpd=310;
$vpt=[0,sqrt(3)*25,0];
$fn=20;

module shoggoth(r=5,n=3){
    scale(r/5){
        step=1/10;
        for(a=[0,120,240]){
            for(i=[0:step:1]){
                hull(){
                    rotate([0,0,a+90*i]){
                        translate([i*5,0,0]){
                            circle(1.5-i);
                        }
                    }
                    rotate([0,0,a+90*(i-step)]){
                        translate([(i-step)*5,0,0]){
                            circle(1.5-i+step);
                        }
                    }
                }
            }
            if(n > 1){
                rotate([0,0,90+a])translate([5,0,0]){
                    scale(0.33){
                        rotate([0,0,90]){
                            shoggoth(r=5,n=n-1);
                        }
                    }
                }
            }
        }
    }
}

module godelian_warning(){

    difference(){

        hull(){
            translate([50,0,0]){circle(10);}
            translate([-50,0,0]){circle(10);}
            translate([0,sqrt(3)*50,0]){circle(10);}
        }

        hull(){
            translate([50,0,0]){circle(5);}
            translate([-50,0,0]){circle(5);}
            translate([0,sqrt(3)*50,0]){circle(5);}
        }

    }
    
    translate([0,30,0]){
        shoggoth(32,n=4);
    }
}

color("#F9AA00"){
hull(){
    translate([50,0,0]){circle(8);}
    translate([-50,0,0]){circle(8);}
    translate([0,sqrt(3)*50,0]){circle(8);}
}
}

color("#000"){linear_extrude(1){godelian_warning();}}

//render with:
//openscad godelian_danger_sign.scad -o godelian_danger_sign.png --projection=ortho --colorscheme=Nature --viewall --imgsize=1000,1000 && cwebp -lossless godelian_danger_sign.png -o godelian_danger_sign.webp
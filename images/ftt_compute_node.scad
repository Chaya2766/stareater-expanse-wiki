module civic_chip_bank(){
    z_sep = 15;
    //16 layers of 25 by 25 chips
    //that is 10 000 chips
    for(z=[0:1:16-1]){
        for(y=[0:1:25-1]){
            for(x=[0:1:25-1]){
                translate([11*x+1,11*y+1,z_sep*z]){
                    //the chips
                    color("#C84"){
                    cube([10,10,1]);
                    }
                }
            }
            translate([-10,4+y*11,z_sep*z+1]){
                //coolant lines going across the chips
                color("#888"){
                cube([11*25+1+20,4,3]);
                }
            }
        }
        translate([0,0,z_sep*z-5]){
            //plates holding the chips
            color("#444"){
            cube([11*25+1,11*25+1,5]);
            }
        }
        color("#888"){
            //horizontal coolant pipes on the sides
            translate([-14,4,z_sep*z-2]){
            cube([10,11*25-7,10]);
            }
            translate([11*25+6,4,z_sep*z-2]){
            cube([10,11*25-7,10]);
            }
        }
    }
}

module compute_node(){
    
    translate([20,20,100]){
        civic_chip_bank();
    }
    
    //vertical coolant pipes
    color("#888"){
            translate([4,138,40]){
            cube([12,50,295]);
            }
            translate([11*25+26,138,40]){
            cube([12,50,295]);
            }
        }
    
    color("#8888"){
    difference(){
        %cube([11*25+1+40,11*25+1+40,130+16*15]);
        translate([20,20,20]){
            cube([11*25+1,11*25+1,130+16*15-40]);
        }
    }
    }
}

compute_node();
//openscad ftt_compute_node.scad -o ftt_compute_node.png --colorscheme=Starnight --imgsize=1000,1000 --autocenter --viewall
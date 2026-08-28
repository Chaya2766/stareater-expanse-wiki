module recursive_crystal(l=100,s=0.75,n=3){
    hull(){
        cylinder(r=10,h=0.1);
        translate([0,0,10]){sphere(0.1);}
        translate([0,l,0]){cylinder(r=0.1,h=0.1);}
    }
    if(n>0){
        translate([0,l*(1-s),0]){
            rotate([0,0,120*(1-2*(n%2))]){
                scale(s){
                    recursive_crystal(l,s,n-1);
                }
            }
        }
    }
}

module finespun_symbol(size=140){
    scale(size/140){
        color("#FFF"){
            for(angle=[0,120,240]){
                rotate(angle){
                    recursive_crystal(100,0.8,7);
                }
            }
        }
    }
}

finespun_symbol();

//openscad finespun_flag.scad -o finespun_flag.png --imgsize=1000,1000 --colorscheme=Starnight --projection=o --camera=0,20,475,0,20,0
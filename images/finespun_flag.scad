module recursive_crystal(l=100,n=3){
    hull(){
        cylinder(r=10,h=0.1);
        translate([0,0,10]){sphere(0.1);}
        translate([0,l,0]){cylinder(r=0.1,h=0.1);}
    }
    if(n>0){
        translate([0,l/4,0]){
            rotate([0,0,120*(1-2*(n%2))]){
                scale(3/4){
                    recursive_crystal(l,n-1);
                }
            }
        }
    }
}

color("#FFF"){
for(angle=[0,120,240]){
    rotate(angle){
        recursive_crystal(100,7);
    }
}
}

//openscad finespun_flag.scad -o finespun_flag.png --imgsize=1000,1000 --colorscheme=Starnight --projection=o --camera=0,25,450,0,25,0

module spike(length=3){
    spikepoints = [
        [-1,-1,1],
        [-1,1,1],
        [1,-1,1],
        [1,1,1],
        [0,0,0],
        [0,0,1+length]
    ];

    hull(){
        for(i=spikepoints){
            translate(i){sphere(0.1);}
        }
    }
}

module star(length){
    angles=[
        [0,0,0],
        [90,0,0],
        [0,90,0],
        [-90,0,0],
        [0,-90,0],
        [180,0,0]
    ];
    union(){
        for(i=angles){
            rotate(i){spike(length);}
        }
    }
}
    
star(3);//central star


for(a=[45:45:360]){
    for(b=[45:45:360]){
        translate([sin(a)*30*cos(b),cos(a)*30*cos(b),sin(b)*30]){star(3);}
    }
}

$vpd=192;
$vpr=[75,0,79];

//openscad star_flock.scad -o star_flock.png --imgsize=1000,1000 --colorscheme=Starnight --view=edges
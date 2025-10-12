module band(radius,thickness){
    difference(){
    cylinder(h=thickness,r=radius+thickness/2,center=true);
    cylinder(h=2*thickness,r=radius-thickness/2,center=true);
}
}

module link(a,b,size=0.05e6){
    color([10,0,0]){hull(){
        translate(a){sphere(size);}
        translate(b){sphere(size);}
    }}
}

module swarm(sats,size=0.05e6){
    for(a = sats){for(b = sats){
        link(a,b,size);
    }}
}

color([10,1,0]){
    sphere(1e6);
}
swarm([
    [-1e7,5e6,0],
    [+1e7,4e6,0],
    [-4e6,-1e7,1e6],
    [2e6,+1e7,-8e6],
    [-1e6,5e6,-1e7],
    [2e6,-4e6,+1e7],
    [4e6,-5e6,-8e6],//outer
    [-2e7,1e7,1e7],
    [2e7,1e7,0e7],
    [-1e7,2e7,1e7],
    [1e7,-2e7,-1e7],
    [-1.5e7,-1e7,1e7],
    [-1.5e7,-1e7,-1e7]
],size=5e4);

band(25e6,0.05e6);
color([0,1,0]){translate([-25e6,0,0]){
    sphere(4e5);
}}
swarm([
    [-25e6,0,0e6],
    [-24e6,1e6,0e6],
    [-24e6,-1e6,0e6],
    [-25e6,0e6,1e6],
    [-25e6,0e6,-1e6],
    [-26e6,0e6,0e6],
    [-1.5e7,-1e7,1e7],
    [-1.5e7,-1e7,-1e7],
    [-2e7,1e7,1e7],
],size=3e4);

band(11e6,0.05e6);
color([0,1,0]){translate([0,-11e6,0]){
    sphere(3e5);
}}
swarm([
    [0,-11e6,0e6],
    [0,-11e6,-1e6],
    [0,-11e6,1e6],
    [0,-12e6,0e6],
    [0,-10e6,0e6],
    [1e6,-11e6,0e6],
    [-1e6,-11e6,0e6],
    [-4e6,-1e7,1e6],
    [4e6,-5e6,-8e6]
],size=3e4);

//openscad IPPACS.scad -o IPPACS.png --colorscheme=Starnight --imgsize=1000,1000 --autocenter --viewall
border_fraction = 0.8;
white = [1.2,1.2,1.2];
black = [0.2,0.2,0.2];

starpoints = [
  [0,0],
  [1/sqrt(2),1/sqrt(2)],
  [3,0],
  [1/sqrt(2),-1/sqrt(2)]
];

scale(50/3){
//core
scale([border_fraction,border_fraction,1.1]){
color(black){
rotate([0,0,0]){polygon(starpoints);}
rotate([0,0,90]){polygon(starpoints);}
}
color(white){
rotate([0,0,180]){polygon(starpoints);}
rotate([0,0,270]){polygon(starpoints);}
}
}
//border
color(white){
rotate([0,0,0]){polygon(starpoints);}
rotate([0,0,90]){polygon(starpoints);}
}
color(black){
rotate([0,0,180]){polygon(starpoints);}
rotate([0,0,270]){polygon(starpoints);}
}
}

$vpr = [0,0,0];
$vpd = 300;

//openscad felicity_icon.scad -o felicity_icon.png --projection=ortho --colorscheme=Nature --imgsize=1000,1000
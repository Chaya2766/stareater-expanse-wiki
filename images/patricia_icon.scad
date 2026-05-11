$fn=32;

border_fraction = 0.8;
white = [1.2,1.2,1.2];
black = [0.2,0.2,0.2];

black_thickness = 0.15;
black_radius = 0.85;

white_thickness = 0.15;
white_radius = 1;

module hexagon(r=1,t=0.1,h=1){
    for(a=[60:60:360]){
        hull(){
            rotate([0,0,a]){translate([0,r,0]){cylinder(d=t,h=h,center=true);}}
            rotate([0,0,a-60]){translate([0,r,0]){cylinder(d=t,h=h,center=true);}}
        }
    }
}

scale(50/2.65){

color(black){
hexagon(r=black_radius,t=black_thickness,h=2);
for(a=[0:60:120]){
rotate([0,0,a]){
    translate([sqrt(3)*1,0,0]){hexagon(r=black_radius,t=black_thickness,h=2);}
    translate([-sqrt(3)*1,0,0]){hexagon(r=black_radius,t=black_thickness,h=2);}
}
}
}

color(white){
hexagon(r=white_radius,t=white_thickness);
for(a=[0:60:120]){
rotate([0,0,a]){
    translate([sqrt(3)*1,0,0]){hexagon(r=white_radius,t=white_thickness);}
    translate([-sqrt(3)*1,0,0]){hexagon(r=white_radius,t=white_thickness);}
}
}
}

color(white){
hexagon(r=1-(2*black_thickness),t=white_thickness);
for(a=[0:60:120]){
rotate([0,0,a]){
    translate([sqrt(3)*1,0,0]){hexagon(r=1-(2*black_thickness),t=white_thickness);}
    translate([-sqrt(3)*1,0,0]){hexagon(r=1-(2*black_thickness),t=white_thickness);}
}
}
}

}

$vpr = [0,0,0];
$vpd = 300;

//openscad patricia_icon.scad -o patricia_icon.png --projection=ortho --colorscheme=Nature --imgsize=1000,1000
$vpr=[0,0,0];
$vpd=310;
$vpt=[0,sqrt(3)*25,0];
$fn=20;

module coriolis_warning(){

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

translate([0,50,0]){circle(10);}

hull(){
    translate([-5,61,0]){circle(1);}
    translate([-5,71,0]){circle(1);}
}

hull(){
    translate([0,62.5,0]){circle(1);}
    translate([0,81,0]){circle(1);}
}

hull(){
    translate([5,61,0]){circle(1);}
    translate([5,71,0]){circle(1);}
}

arrow=[
    [0,35,0],
    [0,30,0],
    [1,25,0],
    [3,20,0],
    [8,15,0],
    [15,10,0],
    [20,7,0]
];
at=2;

for(i=[1:1:len(arrow)-1]){
    hull(){
        translate(arrow[i-1]){circle(at);}
        translate(arrow[i]){circle(at);}
    }
}

translate([20,7,0]){rotate([0,0,-32-90]){
    hull(){
        translate([4*at,0,0]){circle(0.3);}
        translate([-4*at,0,0]){circle(0.3);}
        translate([0,4*at,0]){circle(0.3);}
    }
}}

}

color("#F9AA00"){
hull(){
    translate([50,0,0]){circle(8);}
    translate([-50,0,0]){circle(8);}
    translate([0,sqrt(3)*50,0]){circle(8);}
}
}

color("#000"){linear_extrude(1){coriolis_warning();}}

//render with:
//openscad coriolis_danger_sign.scad -o render.png --projection=ortho --colorscheme=Nature --viewall --imgsize=1000,1000
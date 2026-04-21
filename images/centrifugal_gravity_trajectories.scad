//$fn=64;

module station(){
difference(){
    cylinder(h=40,r=70,center=true);
    cylinder(h=41,r=69.5,center=true);
}/*
difference(){
    cylinder(h=40,r=55,center=true);
    cylinder(h=41,r=54.5,center=true);
}
difference(){
    cylinder(h=40,r=40,center=true);
    cylinder(h=41,r=39.5,center=true);
}
difference(){
    cylinder(h=40,r=25,center=true);
    cylinder(h=41,r=24.5,center=true);
}*/
difference(){
union(){
for(a=[45:45:180]){
    rotate([0,0,a]){
    cube([140,0.5,40],true);
    }
}
}
cylinder(h=41,r=25,center=true);
}

arrow=[
    [0,-70,0],
    [1.8,-65,0],
    [4,-62,0],
    [6,-60.5,0],
    [8,-60,0],
    [10,-60,0],
    [12,-60.5,0],
    [14,-62,0],
    [16,-64,0],
    [18,-67,0]
];
at=0.3;

color("#0F0"){
for(i=[1:1:len(arrow)-1]){
    hull(){
        translate(arrow[i-1]){sphere(at);}
        translate(arrow[i]){sphere(at);}
    }
}
}

}

station_rt=[0,0,45*$t];
rotate(station_rt){
    station();
}

ball_tr=[(60*$t),(35*$t)-70,0];

translate(ball_tr){
    sphere();
}


//trajectory
color("#F00"){
hull(){
    translate([0,-70,0]){sphere(0.3);}
    translate([60,35-70,0]){sphere(0.3);}
}
}

$vpt=ball_tr;
$vpr=station_rt;
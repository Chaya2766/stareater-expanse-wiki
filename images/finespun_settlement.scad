use <finespun_one.scad>
use <ftt_concentrated_solar_array.scad>

color([0.25,0.25,0.25]){sphere(5552.5E+3);}

A = 0;//between 0 and 1, fracti

settlement_center = [10E+6,0,0];

translate(settlement_center){

rotate([-90,0,0]){
color("#888"){finespun_one();}}

solar_arrays=[
    [200E+3,300E+3,100E+3],
    [-200E+3,-300E+3,-100E+3],
    [300E+3,-200E+3,-0E+3],
    [-300E+3,200E+3,-0E+3]
];

for(i = solar_arrays){
    translate(i){
    rotate([-90,0,0]){
    concentrated_solar_array(50E+3,5E+3,0.1E+3,32);
    }}
}

misc_objects=[
    [0,20E+3,24E+3],
    [0,20E+3,-24E+3],
    [-24E+3,10E+3,0],
    [0,30E+3,10E+3],
    [10E+3,30E+3,0],
    [0,50E+3,0],
    [-200E+3,200E+3,0],
    [-200E+3,210E+3,10E+3],
    [-200E+3,230E+3,40E+3],
    [200E+3,-200E+3,40E+3],
    [200E+3,-190E+3,20E+3],
    [-200E+3,-240E+3,-80E+3],
    [-150E+3,-230E+3,-100E+3],
    [-150E+3,-330E+3,-120E+3],
];

for(i = misc_objects){
    translate(i){color("#888"){
    rotate([90,90,0]){
    cylinder(d=3E+3,h=10E+3,center=true);
    }}}
}

}

$vpt=settlement_center;
$vpr=[99.8,0,117.7];
$vpd=1900000;
$vpf=22.5;

// openscad finespun_settlement.scad -o finespun_settlement.png --colorscheme=Starnight --imgsize=1000,1000
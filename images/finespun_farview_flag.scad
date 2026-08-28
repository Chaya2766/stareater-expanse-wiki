use <finespun_flag.scad>

$fn=64;

color([10,10,10]){//oversaturate so that it comes out fully white
rotate([16,0,0]){
    difference(){
        cylinder(r=20.2,h=0.2,center=true);
        cylinder(r=19.8,h=2,center=true);
    }
    rotate([0,0,45]){
        translate([20,0,0]){
            sphere(0.75);
        }
    }
}

//plane of orbit zero incline
difference(){
    cylinder(r=20.1,h=0.2,center=true);
    cylinder(r=19.9,h=2,center=true);
}
//sol
//cube([0.1,0.1,10],true);
//cube([0.1,10,0.1],true);
//cube([10,0.1,0.1],true);
}

translate([0,10,13]){
    rotate([90,0,90]){
    finespun_symbol(15);
    }
}

color([10,10,10]){
translate([0,-10,15]){
    cube([1,15,15],true);
}
}


//$vpr=[83,0,77];//this one to be used with sol cross
$vpr=[90,0,90];//this one to be used without sol cross
$vpd=80;
$vpt=[0,0,9];

//openscad finespun_farview_flag.scad -o finespun_farview_flag.png --imgsize=1000,500 --colorscheme=Starnight --projection=o && cwebp -lossless finespun_farview_flag.png -o finespun_farview_flag.webp && rm finespun_farview_flag.png
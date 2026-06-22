b=2;//border thickness

color("white"){
difference(){
cube(10,true);
cube([12,8,8],true);
cube([8,12,8],true);
cube([8,8,12],true);
}
}
color("black"){
translate([-b,-b,-b]){
difference(){
cube(10,true);
cube([12,8-b,8-b],true);
cube([8-b,12,8-b],true);
cube([8-b,8-b,12],true);
}
}
}

color("white"){
translate([-0.5,-0.5,-0.5]){
    cube([15,1,1]);
    cube([1,15,1]);
    cube([1,1,15]);
}
}

color("black"){
translate([-0.5-b,-0.5-b,-0.5-b]){
    cube([15,1+b/2,1+b/2]);
    cube([1+b/2,15,1+b/2]);
    cube([1+b/2,1+b/2,15]);
}
}

$vpr=[55,0,135];
$vpt=[0,0,2.5];
$vpd=60;

//openscad ticanode_logo.scad -o ticanode_logo.png --colorscheme=Starnight --imgsize=1000,1000 --projection=ortho
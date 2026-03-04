module eye(){

intersection(){
translate([10,0,0]){
difference(){
    circle(15);
    circle(14);
}}
translate([-10,0,0]){
    square([20,30],true);
}
}

intersection(){
translate([-10,0,0]){
difference(){
    circle(15);
    circle(14);
}}
translate([10,0,0]){
    square([20,30],true);
}
}

intersection(){
    translate([10,0,0]){circle(11);}
    translate([-10,0,0]){circle(11);}
}

}

module recursive_4eye(){

for(i=[0:90:270]){
    rotate(i){
    translate([0,15,0]){
        scale(1){eye();}
    }
    }
}

for(n=[1,2,4,8]){

for(i=[45/n:90/n:360]){
    rotate(i){
    translate([0,(sqrt((log(n)/log(2))+2)*12)+0,0]){
        scale(0.5/n){eye();}
    }
    }
}

}

}

color("#00FF80"){recursive_4eye();}

$vpr=[0,0,0];
$vpd=175;

//openscad recursive_4eye.scad -o recursive_4eye.png --colorscheme=Starnight --imgsize=1000,1000 --autocenter --viewall
//to get the real intended image, open the rendered png in gimp duplicate the layer 7 times, set the duplicates to additive mode, and give them gaussian blur starting with a radius of 100, then 50, 25 and so on, dividing by 2 each time
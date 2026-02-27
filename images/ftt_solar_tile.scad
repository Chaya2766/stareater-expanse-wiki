module solar_tile(){
    color("#222"){
    translate([0,0,0.5]){
        cube([98,98,0.1],true);
    }
    }
    color("#888"){
    difference(){
        cube([100,100,1],true);
        translate([0,0,0.6]){
            cube([98,98,0.4],true);
        }
    }
    }
}

module solar_array(d){
//give diameter in milimetres
for(x=[-5E+3:100:5E+3]){
    for(y=[-5E+3:100:5E+3]){
        if(sqrt(pow(x,2)+pow(y,2))<(d-sqrt(2)*0.1E+3)/2){
            translate([x,y,0]){
                solar_tile();
            }
        }
    }
}
translate([0,0,-11]){color("#888"){
    cylinder(h=10,d=d);
}}
}

//actual things to render below


translate([50,-50,0]){
solar_tile();
}

$vpd=425;
$vpt=[50,-50,0];

//openscad ftt_solar_tile.scad -o ftt_solar_tile.png --view=axes,scales --colorscheme=Starnight --viewall --imgsize=1200,1000

/*
solar_array(5E+3);
$vpd=8E+3;
$vpt=[0,0,-500];
*/
//openscad ftt_solar_tile.scad -o ftt_solar_tile.png --colorscheme=Starnight --viewall --imgsize=2000,1000
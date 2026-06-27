module phased_array_tile(){
    color("#554"){
    translate([0,0,0.5]){
        cube([98,98,0.1],true);
    }
    }
    color("#A64"){
        spotD=7;
        gap=1;
        for(x=[1+(spotD+gap)/2:0.8*(spotD+gap):99-(spotD+gap)/2]){
            for(y=[1+(spotD+gap)/2:spotD+gap:99-(spotD+gap)/2]){
                stag=(x/(0.8*(spotD+gap))) % 2;
            translate([x-50,-52+y+stag*(spotD+gap)/2,0.5]){
                if(y+stag*(spotD+gap)/2<98)antenna_spot(h=0.15,d=spotD);
            }
        }
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

module antenna_spot(h=0.15,d=8){
    for(i=[0:2:d-3]){
    difference(){
        cylinder(h=h,d=d-i);
        cylinder(h=h+1,d=d-1-i);
    }
    }
}

module phased_array(d){
//give diameter in milimetres
for(x=[-5E+3:100:5E+3]){
    for(y=[-5E+3:100:5E+3]){
        if(sqrt(pow(x,2)+pow(y,2))<(d-sqrt(2)*0.1E+3)/2){
            translate([x,y,0]){
                phased_array_tile();
            }
        }
    }
}
translate([0,0,-11]){color("#888"){
    cylinder(h=10,d=d,$fa=5);
}}
}

//actual things to render below


translate([50,-50,0]){
phased_array_tile();
}

$vpd=425;
$vpt=[50,-50,0];

//openscad ftt_phased_array_tile.scad -o ftt_phased_array_tile.png --view=axes,scales --colorscheme=Starnight --imgsize=1000,1000

/*
solar_array(10E+3);
$vpd=16E+3;
$vpt=[0,0,-1000];
*/
//openscad ftt_solar_tile.scad -o ftt_solar_tile.png --colorscheme=Starnight --viewall --imgsize=1000,500
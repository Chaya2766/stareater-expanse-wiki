dout=25;
din=20;
diff=dout-din;
color("#EEE"){
difference(){
    hull(){
        translate([-din/sqrt(2)-diff/2,0,0]){cylinder(d=dout,h=1,center=true);}
        translate([din/sqrt(2)+diff/2,0,0]){cylinder(d=dout,h=1,center=true);}
        translate([0,-din/sqrt(2)-diff/2,0]){cylinder(d=dout,h=1,center=true);}
        translate([0,din/sqrt(2)+diff/2,0]){cylinder(d=dout,h=1,center=true);}
    }
    translate([-din/sqrt(2)-diff/2,0,0]){cylinder(d=din,h=2,center=true);}
    translate([din/sqrt(2)+diff/2,0,0]){cylinder(d=din,h=2,center=true);}
    translate([0,-din/sqrt(2)-diff/2,0]){cylinder(d=din,h=2,center=true);}
    translate([0,din/sqrt(2)+diff/2,0]){cylinder(d=din,h=2,center=true);}
}
}

module power_symbol(){
    color("#AAA"){
        wire=1;
    for(x=[-21:wire:21]){for(y=[-21:wire:21]){
        if(sqrt(((0.9*x)^2)+((y+(0.5*wire*(x%2)))^2))<(10-(wire/2))){
            translate([0.9*x,y+(0.5*wire*(x%2)),0]){cylinder(d=wire,$fn=16,h=0.5);}
        }
    }}
    }
    //text("power",halign="center",valign="center",size=5);
}

module water_symbol(){
    color("#08F"){
    cylinder(d=din,h=0.5);
    }
    //text("water",halign="center",valign="center",size=5);
}

translate([-din/sqrt(2)-diff/2,0,0]){water_symbol();}
translate([din/sqrt(2)+diff/2,0,0]){water_symbol();}
translate([0,-din/sqrt(2)-diff/2,0]){power_symbol();}
translate([0,din/sqrt(2)+diff/2,0]){power_symbol();}

$vpr=[0,0,0];
$vpd=180;

//openscad ftt_power_cable_crossection.scad -o ftt_power_cable_crossection.png --colorscheme=Starnight --imgsize=1000,1000 --projection=ortho
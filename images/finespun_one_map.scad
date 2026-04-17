$vpr = [0,0,0];
$vpt = [35,-90,0];
$vpd = 600;

pi = 3.14159265;

color("#FFF"){
translate([225,0]){
    square([50,1],true);
    translate([0,2]){
        text("50 metres reference line",size=3,halign="center");
    }
}
}

color("#888"){square([2*pi*25,50],true);}
color("#FFF"){
translate([90,-0+5]){
    text("level 0 / runway",size=10);
    translate([0,-10]){text("gravity: 2m/s²",size=5);}
    translate([0,-20]){text("no atmosphere (exposed to space)",size=5);}
}
}

for(i=[0:1:7]){
translate([(i-3.5)*((2*pi*40/8)+10),-60,0]){
    color("#888"){square([2*pi*40/8,50],true);}
    color("#FFF"){text(str(i+1),halign="center",valign="center");}
}}
color("#FFF"){
translate([170,-60]){
    text("level 1",size=10);
    translate([0,-10]){text("gravity: 3.2m/s²",size=5);}
}
}

for(i=[0:1:7]){
translate([(i-3.5)*((2*pi*55/8)+10),-60*2,0]){
    color("#888"){square([2*pi*55/8,50],true);}
    color("#FFF"){text(str(i+9),halign="center",valign="center");}
}}
color("#FFF"){
translate([220,-60*2]){
    text("level 2",size=10);
    translate([0,-10]){text("gravity: 4.4m/s²",size=5);}
}
}

for(i=[0:1:7]){
translate([(i-3.5)*((2*pi*70/8)+10),-60*3,0]){
    color("#888"){square([2*pi*70/8,50],true);}
    color("#FFF"){text(str(i+17),halign="center",valign="center");}
}}
color("#FFF"){
translate([270,-60*3]){
    text("level 3",size=10);
    translate([0,-10]){text("gravity: 5.6m/s²",size=5);}
}
}

// openscad finespun_one_map.scad -o finespun_one_map.png --colorscheme=Starnight --projection=o --imgsize=2500,1000
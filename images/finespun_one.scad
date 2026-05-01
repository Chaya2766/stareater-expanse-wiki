$fn=64;

th=100;//thickness of hull in millimetres

room_labels = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"];
//room_labels = ["α","β","γ","δ","ε","ζ","η","θ","ι","κ","λ","μ","ν","ξ","ο","π","ρ","σ","τ","υ","φ","χ","ψ","ω"];
//room_labels = ["1/α","2/β","3/γ","4/δ","5/ε","6/ζ","7/η","8/θ","9/ι","10/κ","11/λ","12/μ","13/ν","14/ξ","15/ο","16/π","17/ρ","18/σ","19/τ","20/υ","21/φ","22/χ","23/ψ","24/ω"];
//room_labels = ["1 - α","2 - β","3 - γ","4 - δ","5 - ε","6 - ζ","7 - η","8 - θ","9 - ι","10 - κ","11 - λ","12 - μ","13 - ν","14 - ξ","15 - ο","16 - π","17 - ρ","18 - σ","19 - τ","20 - υ","21 - φ","22 - χ","23 - ψ","24 - ω"];
//room_labels = ["1 α","2 β","3 γ","4 δ","5 ε","6 ζ","7 η","8 θ","9 ι","10 κ","11 λ","12 μ","13 ν","14 ξ","15 ο","16 π","17 ρ","18 σ","19 τ","20 υ","21 φ","22 χ","23 ψ","24 ω"];

module runway_light(){
    color("#888"){cylinder(h=0.5e3,d=100);}
    color([0,5,0]){
        //translate([0,0,5e3]){sphere(d=200);}
        translate([0,0,0.5e3]){sphere(d=200);}
    }
}

module finespun_one(equipment=false){
color("#888"){
difference(){
union(){
//outer shell
difference(){
cylinder(h=50e3,r=70e3,center=true);
cylinder(h=50e3-(2*th),r=70e3-th,center=true);
}
//dividing walls
for(i=[0,45,90,135]){rotate([0,0,i]){
    cube([140e3-th,th,50e3-(th/2)],true);
    //loop below creates the dividing wall stiffening ribs
    //for(z=[-24e3:1e3:24e3]){translate([0,0,z]){
    //    cube([140e3-10,1e3,10],true);
    //}}
}}
//room labels
for(room=[0:1:23]){
    level = floor(room / 8);
    rotate([0,0,(room*360/8) + (360/16)]){
    translate([0,-32.5e3 - (level*15e3),-25e3+th]){
        linear_extrude(th){text(room_labels[room],size=5e3,halign="center",valign="center");}
    }}
}
}//end of union
cylinder(h=51e3,r=25e3,center=true);
}
//central hole wall
difference(){
cylinder(h=50e3,r=25e3+th,center=true);
cylinder(h=51e3,r=25e3,center=true);
}

//additional floors
difference(){
cylinder(h=50e3,r=55e3+th,center=true);
cylinder(h=51e3,r=55e3,center=true);
}
difference(){
cylinder(h=50e3,r=40e3+th,center=true);
cylinder(h=51e3,r=40e3,center=true);
}

}//end of color

if(equipment){
//runway lights
for(a=[0:11.46:360]){//this angle makes the lights be spaced 5m apart
    rotate([0,-90,a]){
        translate([20e3,0,-25e3]){runway_light();}
        translate([10e3,0,-25e3]){runway_light();}
    }
}

}//end of equipment

}//end of finespun

/*
//openscad finespun_one.scad -o finespun_station_cutaway.png --colorscheme=Starnight --imgsize=1000,1000
$vpr=[66.2,0,33];
$vpd=420E+3;
rotate([90,0,0]){
difference(){
    color("#888"){finespun_one(false);}
    translate([0,0,135e3]){
        rotate([0,30,0]){
            cube([400e3,400e3,200e3],true);}}
}
}
*/




//alternative view cutting paradigm
//this one requires animation
$vpr=[76.2,0,33+360*$t];
$vpd=420E+3;
difference(){
    rotate([90,0,0]){finespun_one(true);}
    rotate($vpr){
        translate([0,0,120e3]){
            cube([400e3,400e3,200e3],true);}}
}
//openscad finespun_one.scad -o finespun_station_cutaway.png --colorscheme=Starnight --imgsize=1000,1000


/*
//top down view
//openscad finespun_one.scad -o finespun_one_divisions.png --colorscheme=Starnight --imgsize=1000,1000 --projection ortho
$vpr=[0,0,0];
$vpt=[0,0,0];
$vpd=4E+5;
minkowski(){
difference(){
    finespun_one(false);
    translate([0,0,110e3]){
        cube([400e3,400e3,200e3],true);}
    translate([0,0,-110e3]){
        cube([400e3,400e3,200e3],true);}
}
cube(1E+3);
}
for(room=[0:1:23]){
    level = floor(room / 8);
    rotate([0,0,(room*360/8) + (360/16)]){
    translate([0,-32.5e3 - (level*15e3),-25e3+th]){
        linear_extrude(50e3){text(room_labels[room],size=5e3,halign="center",valign="center");}
    }}
}
*/


/*
//1 1000th scale model
scale(0.001){
    difference(){
        rotate([0,0,0]){finespun_one(false);}
        rotate([0,0,0]){
            translate([0,0,100e3]){
                cube([400e3,400e3,200e3],true);}}
    }
}
*/
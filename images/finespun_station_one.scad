module finespun_one(equipment=false){

difference(){
union(){
//outer shell
difference(){
cylinder(h=50e3,r=70e3,center=true);
cylinder(h=50e3-20,r=70e3-10,center=true);
}
//dividing walls
for(i=[0,45,90,135]){rotate([0,0,i]){
cube([140e3-10,10,50e3-5],true);}}
}//end of union
cylinder(h=51e3,r=25e3,center=true);
}
//central hole wall
difference(){
cylinder(h=50e3,r=25e3+10,center=true);
cylinder(h=51e3,r=25e3,center=true);
}

//additional floors
difference(){
cylinder(h=50e3,r=55e3+10,center=true);
cylinder(h=51e3,r=55e3,center=true);
}
difference(){
cylinder(h=50e3,r=40e3+10,center=true);
cylinder(h=51e3,r=40e3,center=true);
}

if(equipment){
    for(h=[-20e3:4e3:20e3]){
    for(a=[5:2:40]){
    rotate([0,90,a]){
    translate([h,0,-70e3]){
    cube([1e3,1e3,2e3]);
    }}
    }}
}

}


difference(){
    finespun_one(true);
    translate([0,0,130e3]){
        rotate([25,-15,50]){
            cube([400e3,400e3,200e3],true);}}
}


/*
//alternative view cutting paradigm
difference(){
    finespun_one(true);
    rotate($vpr){
        translate([0,0,110e3]){
            cube([400e3,400e3,200e3],true);}}
}
*/
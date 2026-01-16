$vpr=[100,0,20];
$vpt=[0,0,23];
$vpd=160;

color("#DD0"){cube(5,true);}

translate([-10,0,10]){color("#0FF"){cube(5,true);}}

translate([0,0,10]){color("#F00"){cube(5,true);}}

translate([10,0,10]){color("#F00"){cube(5,true);}}

translate([-15,0,20]){color("#0FF"){cube(5,true);}}

translate([-5,0,20]){color("#0FF"){cube(5,true);}}


translate([-10,0,30]){color("#F00"){cube(5,true);}}

translate([-10,10,30]){color("#F00"){cube(5,true);}}

translate([-10,-10,30]){color("#F00"){cube(5,true);}}

translate([-20,-5,30]){color("#F00"){cube(5,true);}}

translate([-20,5,30]){color("#F00"){cube(5,true);}}



translate([0,0,30]){color("#0FF"){cube(5,true);}}

translate([5,0,40]){color("#F00"){cube(5,true);}}

translate([-5,0,40]){color("#0FF"){cube(5,true);}}

translate([-5,0,50]){color("#4A4"){cube(5,true);}}


color("#0FF"){

hull(){
sphere(1);
translate([-10,0,10]){sphere(1);}
}

hull(){
sphere(1);
translate([0,0,10]){sphere(1);}
}

hull(){
sphere(1);
translate([10,0,10]){sphere(1);}
}

hull(){
translate([-10,0,10]){sphere(1);}
translate([-15,0,20]){sphere(1);}
}

hull(){
translate([-10,0,10]){sphere(1);}
translate([-5,0,20]){sphere(1);}
}

hull(){
translate([-10,0,10]){sphere(1);}
translate([-5,0,20]){sphere(1);}
}



hull(){
translate([-15,0,20]){sphere(1);}
translate([-20,5,30]){sphere(1);}
}
hull(){
translate([-15,0,20]){sphere(1);}
translate([-20,-5,30]){sphere(1);}
}
hull(){
translate([-15,0,20]){sphere(1);}
translate([-10,-10,30]){sphere(1);}
}
hull(){
translate([-15,0,20]){sphere(1);}
translate([-10,0,30]){sphere(1);}
}
hull(){
translate([-15,0,20]){sphere(1);}
translate([-10,10,30]){sphere(1);}
}

hull(){
translate([-5,0,20]){sphere(1);}
translate([0,0,30]){sphere(1);}
}

hull(){
translate([0,0,30]){sphere(1);}
translate([-5,0,40]){sphere(1);}
}
hull(){
translate([0,0,30]){sphere(1);}
translate([5,0,40]){sphere(1);}
}

hull(){
translate([-5,0,40]){sphere(1);}

//openscad versioning.scad -o versioning.png --colorscheme=Starnight --imgsize=1000,1000
translate([-5,0,50]){sphere(1);}
}

}
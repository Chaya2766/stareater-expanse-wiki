module plugpole(dout=100,din=90,h=100,cutdepth=0){
    difference(){
        cylinder(h=h,d=dout);
        translate([0,0,-h]){cylinder(h=h*3,d=din);}
        translate([-dout+cutdepth,0,0]){cube([dout*2,dout*2,h*3],true);}
    }
}
module plug_plates(h=50){
    color("#e7c583"){plugpole(80,70,h,5);}
    color("#444"){plugpole(90,75,h+5);}
    color("#e7c583"){plugpole(50,40,h,5);}
    color("#444"){plugpole(60,45,h+5);}
    //color("#e7c583"){plugpole(20,10,50+10);}
    //color("#444"){plugpole(30,15,50+10+10);}
}
module plug(d=50,h=50){
    s = d/100;
    scale([s,s,1]){
        difference(){
            color("#EEE"){cylinder(h=h,d=100);}
            rotate([0,180,0]){translate([0,0,-h-10]){
                    plug_plates(30);
            }}
        }
        translate([0,0,h-10]){
            plug_plates(30);
        }
    }
}
module plug_to_cable(d1=50,d2=24,l=100){
    color("#EEE"){
        hull(){
            cylinder(d=d1,h=1);
            translate([-d2/2,0,-50]){sphere(d=d2);}
            translate([d2/2,0,-50]){sphere(d=d2);}
        }
        hull(){
            translate([-d2/2,0,-50]){sphere(d=d2);}
            translate([d2/2,0,-50]){sphere(d=d2);}
            translate([-d2/2,0,-l-50]){sphere(d=d2);}
            translate([d2/2,0,-l-50]){sphere(d=d2);}
        }
    }
}
plug(d=50);
plug_to_cable(d1=50,d2=12,l=200);

module civic5(pins=true,cover=true){
    color("#444"){
        cube([10,10,1]);
    }
    if(cover){
        translate([0,0,-0.099]){
            color([0.8,0.9,1]){
                difference(){
                    translate([-0.1,-0.1,0.1]){
                        cube([10.2,10.2,1.1]);
                    }
                    translate([0,0,-0.1]){
                        cube([10,10,1.2]);
                    }
                }
            }
        }
        color([0.6,0.6,0.6]){translate([0,0,1.1]){linear_extrude(0.01){
            translate([1,6.5,1]){text("Civic5",size=2);}
            translate([1,5.25,1]){text("1e26bit/s",size=0.75);}
            translate([1,4.25,1]){text("1e22bit",size=0.75);}
            translate([1,3.25,1]){text("1e-25J/bit",size=0.75);}
            //translate([1,2.25,1]){text("I/O 2.07e13bit/s",size=0.75);}
            //translate([1,1.25,1]){text("16GHz",size=0.75);}
        }}}
    }
    if(pins){
        color("#ff0"){union(){
                for(x=[0.5:0.25:9.5]){
                    for(y=[0.5:0.25:9.5]){
                        translate([x,y,0]){
                            cube([0.15,0.15,0.01],true);
                        }
                    }
        }}}
    }
}

civic5();
translate([10,20,0]){rotate([90,0,180+45]){
    civic5();
}}
translate([23,12,1]){rotate([180,0,180+30]){
    civic5();
}}

//use openscad civic5.scad -o civic5.png --colorscheme=Starnight --imgsize=1000,1000 --autocenter --viewall
//$vpt=[10,15,0];$vpd=80;

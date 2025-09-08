//cube([100, 50e3, 500e3]);

//cube(1e6,true);

module side(){
    union(){
        intersection(){
            rotate([45,0,0]){cube([100,5e6,5e6],true);}
            translate([0,0.1e6,0.1e6]){cube([100,0.8e6,5e6]);}
        }
        intersection(){
            rotate([45,0,0]){cube([100,4e6,4e6],true);}
            translate([0,0.9e6,0.1e6]){cube([100,0.8e6,5e6]);}
        }
    }
}

module bodyhalf(){
    union(){
        color([0.8,0.8,0.8]){cylinder(r1=1e6,r2=0.5e6,h=1.5e6);}
        color([0.2,0.3,0.5]){
            side();
            scale([1,-1,1]){side();}
        }
        color([0.4,0.2,0.1]){rotate([0,0,90]){
            side();
            scale([1,-1,1]){side();}
        }}
    }
}

module body(){
    union(){
        bodyhalf();
        scale([1,1,-1]){bodyhalf();}
    }
}

body();
translate([-1e8,1e7,1e6]){body();}
translate([-2e8,1e7,1e6]){body();}
translate([-3e8,1e7,-1e6]){body();}

$vpr=[87.2,0,77.5];
$vpd=3e7;
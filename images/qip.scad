module qip(color1=[0.8,0.2,0.2],color2=[0.8,0.2,0.2]){
    
    fruit_parts=[
        [[0,0,0],50,color1],
        [[0,0,-10],50,(0.8*color1 + 0.2*color2)],
        [[0,0,-30],45,(0.6*color1 + 0.4*color2)],
        [[0,0,-40],40,(0.4*color1 + 0.6*color2)],
        [[0,0,-50],35,(0.2*color1 + 0.8*color2)],
        [[0,0,-65],25,color2],
        [[0,0,-90],5,color2]
    ];
    
    /*
    hull(){
        translate([0,0,0]){sphere(50);}
        translate([0,0,-10]){sphere(50);}
        translate([0,0,-30]){sphere(45);}
        translate([0,0,-40]){sphere(40);}
        translate([0,0,-50]){sphere(35);}
        translate([0,0,-65]){sphere(25);}
        translate([0,0,-90]){sphere(5);}
    }
    */
    
    for(i=[0:1:len(fruit_parts)-2]){
        color(fruit_parts[i][2]){
            hull(){
                translate(fruit_parts[i][0]){sphere(fruit_parts[i][1]);}
                translate(fruit_parts[i+1][0]){sphere(fruit_parts[i+1][1]);}
            }
        }
    }
}

qip([0.8,0.2,0.2],[0.8,0.6,0.2]);
color([0.2,0.8,0.2]){
    hull(){
        translate([0,0,50]){sphere(5);}
        translate([0,0,60]){sphere(5);}
    }
    hull(){
        translate([0,0,60]){sphere(5);}
        translate([0,-5,70]){sphere(5);}
    }
    hull(){
        translate([0,-5,70]){sphere(5);}
        translate([0,-15,80]){sphere(5);}
    }
    hull(){
        translate([0,-15,80]){sphere(5);}
        translate([0,-30,90]){sphere(5);}
    }
}

$vpd=500;
$vpr=[80,0,20];
$vpt=[0,0,-15];
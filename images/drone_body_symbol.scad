$fs=0.1;

module sinewave(length=100,height=20,thickness=0.1,step=1,end=360){
    //number of steps to reach end, within that number of steps:
    //the sinewave should go through all degrees from 0 to [end]
    //the total length of the sinewave should reach [length]
    steps = end/step;
    //step is in degrees, not distance
    echo(steps);
    
    //the length of a single step.
    //steplength times [end] should equal [length].
    steplength = length/steps;
    for(i=[1:1:steps]){
        hull(){
            translate([i*steplength,sin(i*step)*height,0]){
                circle(thickness);
            }
            translate([steplength*(i-1),sin(step*(i-1))*height,0]){
                circle(thickness);
            }
        }
    }
}

module processor(size, n_pins){
    difference(){
        square(size,true);
        square(size*(3/4),true);
    }
    square(size*(1/2),true);
    for(i=[0:1:n_pins-1]){
        translate([(i*size/n_pins)-(size/2)+(0.25*size/n_pins),size*(3/8),0]){
            square([size/(n_pins*2),size*(3/8)]);
        }
        translate([(i*size/n_pins)-(size/2)+(0.25*size/n_pins),-2*size*(3/8),0]){
            square([size/(n_pins*2),size*(3/8)]);
        }
        translate([size*(3/8),(i*size/n_pins)-(size/2)+(0.25*size/n_pins),0]){
            square([size*(3/8),size/(n_pins*2)]);
        }
        translate([-2*size*(3/8),(i*size/n_pins)-(size/2)+(0.25*size/n_pins),0]){
            square([size*(3/8),size/(n_pins*2)]);
        }
    }
}

module body(size){
    difference(){
        union(){
            circle(d=size);
            rotate([0,0,45]){
                square([size*1.5,size*(1/16)],true);
                square([size*(1/16),size*1.5],true);
            }
        }
        circle(d=size*(7/8));
    }
}

module remote_body_marking(){
    translate([-60,0,0]){
        sinewave(100,20,1,1,2*360);
    }
    translate([-85,0,0]){
        processor(16,5);
    }
    translate([70,0,0]){
        body(40);
    }
    translate([0,50,0]){
        text("REMOTE BODY",size=20,halign="center",valign="center");
    }
    translate([0,-50,0]){
        text("NO MIND ONBOARD",size=14,halign="center",valign="center");
    }
}

module direct_body_marking(){
    translate([0,0,0]){
        processor(16,5);
    }
    translate([0,0,0]){
        body(40);
    }
    translate([0,50,0]){
        text("DIRECT BODY",size=20,halign="center",valign="center");
    }
    translate([0,-50,0]){
        text("MIND PRESENT",size=18,halign="center",valign="center");
    }
}

color("#000"){

translate([0,100,0]){
remote_body_marking();
}

square([200,1],true);

translate([0,-100,0]){
direct_body_marking();
}

}

$vpr=[0,0,0];
$vpd = 1000;

//render with:
//openscad drone_body_symbol.scad -o render.png --projection=ortho --colorscheme=Nature --viewall --imgsize=1000,1000
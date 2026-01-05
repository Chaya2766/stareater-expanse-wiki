module coremodule(dist,size,thickness){
    translate([dist-size/2,0,0]){
        rotate([0,0,45]){difference(){
            square(sqrt(2)*size/2,center=true);
            square(sqrt(2)*size/2-(2*thickness),center=true);
        }}
    }
    translate([0,-thickness/2,0]){
        square([dist-(size)+(thickness/2),thickness]);
    }
}

module core(num_of_nodes,radius,node_size,line_thickness) {
    num=num_of_nodes;
    dist=radius;
    size=node_size;
    thick=line_thickness;
    for(i = [0:360/num:360]){
        //echo(i);
        rotate([0,0,i]){coremodule(dist,size,thick);}
    }
}

module swarm(inner_radius,outer_radius,density,nodesize) {
    //inner_radius = 75;
    outer_radius = outer_radius-(nodesize/sqrt(2));
    stagger=1;
    density = density+1;
    for(xi = [0:1:density]){
        x = (2*xi*outer_radius/density) - outer_radius;
        for(yi = [0:1:density]){
            y = (2*yi*outer_radius/density) - outer_radius;
            if(sqrt((x^2)+(y^2))>=inner_radius && (xi+yi)%2==stagger){
                if(sqrt((x^2)+(y^2))<=outer_radius){
                    translate([x,y,0]){
                        rotate([0,0,45]){square(nodesize,center=true);}
                    }
                }
            }
        }
    }
}

module eye(width,height,thickness){
    ratio=height/width;
    scale([1,ratio,1]){
        rotate([0,0,45]){
            difference(){
                square(width*sqrt(2),true);
                square(width*sqrt(2)-(thickness*sqrt(2)),true);
            }
            intersection(){
                rotate([0,0,45]){
                    square([width*sqrt(2)+thickness*2,thickness],true);
                }
                square(width*sqrt(2)-(4*thickness),true);
            }
        }
    }
}

module symbol(){
    difference(){
        core(8,50,20,3);
        scale([(6+34)/2,34+6,1]){rotate([0,0,45]){
            square(sqrt(2),true);
            }}
    }
    eye(34/2,34,3);
    //swarm(55,100,9,4);
}

color([0,0,0,1]){symbol();}

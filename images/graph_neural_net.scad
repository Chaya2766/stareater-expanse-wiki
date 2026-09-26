radius=30;
connection_radius=10;
num_points=64;
points=rands(-radius,radius,2*num_points,8);

for(i=[0:2:2*num_points-2]){
    translate([points[i],points[i+1],0]){
        color([1,0,0])cylinder(1,1,1,$fn=16);
    }
}

for(a=[0:2:2*num_points-2])for(b=[0:2:2*num_points-2]){
    ax=points[a];
    ay=points[a+1];
    
    bx=points[b];
    by=points[b+1];
    
    dist=sqrt(
        pow(ax-bx,2)
        +
        pow(ay-by,2)
    );
    
    if(dist<=connection_radius && a != b){
        color([0.5,0.5,1])hull(){
            translate([ax,ay,0])sphere(0.1);
            translate([bx,by,0])sphere(0.1);
        }
    }
}

$vpr=[0,0,0];
$vpd=160;
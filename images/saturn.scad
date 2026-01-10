//units of metres
module saturn(){
    color("#EDA"){
        sphere(58232000);
        //saturn mean radius 58 232 km
    }
    //https://en.wikipedia.org/wiki/Rings_of_Saturn#Physical_parameters_of_the_rings
    rings = [
        [66000000,76517000,0.5],//saturn ring D:
        //66 000 km to 76 517 km
        [74658000,92000000,0.9],//ring C
        [92000000,117580000,0.7],//ring B
        [122170000,136380000,0.8],//ring A
        [140180000,140180000+500000,0.9],//ring F
        [149000000,154000000,0.6],//ring G
        [180000000,480000000,0.1]//ring E
    ];
    for(R = rings){
    color([14/16,13/16,10/16,1]*R[2]){difference(){
        cylinder(r=R[1],h=30000*R[2],center=true);
        cylinder(r=R[0],h=2*30000*R[2],center=true);
    }}
    }
}

saturn();
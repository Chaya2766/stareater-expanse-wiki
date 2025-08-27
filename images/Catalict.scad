//$fs = 1;
module tree(n,h,a,s){
    //n = number of branches
    //h is height of the tree
    //a is the angle by which a branch is rotated relative to that which it grows out from (given as a vector of 3 angles for full 3d rotation)
    //s is the scale of each branch relative to that which it grows out from
    if(n>0){
        color([0,1,1,1]){hull(){
            sphere();
            translate([0,h,0]){sphere();}
        }}
        translate([0,h,0]){
            scale(s){
                rotate(a){tree(n-1,h,a,s);}
                rotate(-a){tree(n-1,h,a,s);}
            }
        }
    }
    if(n==0){color([1,0,0,1]){sphere(1.5);}}
}

//this generates the symbol image
rotate([81.5, -13, 151.3]){
    tree(9,10,[30,50,20],0.9);
}
$vpr = [180,0,300]; $vpt = [-12,4,0];

//this generates the avatar showoff gif
/*
tree(9,10,[0,50,20],0.9);
$vpr = [75,0,52+($t*360)];
$vpt = [0,20,0]; $vpd=240;
*/

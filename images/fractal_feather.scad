module fractal_feather(h,r,s,n,a){
    cylinder(h,r,0);
    if(n>0){
        for(angle=[0,120,240]){
            translate([0,0,h*(1-s)]){
            rotate([0,a,angle]){
            scale(s){
                fractal_feather(h,r,s,n-1,a*s);
            }}}
        }
    }
}

fractal_feather(100,1,0.75,8,15);

$vpd=275;
$vpr=[87.2,0,10.3];
$vpt=[-1.45,4.22,60.11];

//openscad fractal_feather.scad -o fractal_feather.png --colorscheme=Starnight --imgsize=1000,1000
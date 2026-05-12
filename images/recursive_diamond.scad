module recursive_diamond(i=4, j=2){
    scale([0.5,1.5,0.5]){
    rotate([0,0,45]){
    cube(1, true);
    }
    if(i>0){
        recursive_diamond(i=i-1,j=0);
    }
    }
    
    if(j>0){
        scale([0.25,0.5,0.25]){
        for(x=[1.5,-1.5]){ for(y=[2,-2]){
            translate([x,y,0]){
                recursive_diamond(i=i,j=j-1);
            }
        }}
        }
    }
}

color("#aa00ff"){
recursive_diamond(j=3);
}

$vpr=[0,0,0];
$vpd=10;


//openscad recursive_diamond.scad -o recursive_diamond.png --colorscheme=Starnight --projection=ortho --imgsize=1000,1000

//for the proper end result, open in gimp and make the following
//1. a base layer of the image completely unedited
//2. a layer on top of that with copy of the image with 1.5px gaussian blur applied, set to additive mode
//3. a layer on top of that with copy of the image with 5.5px gaussian blur applied, set to additive mode
//4. a layer on top of that with copy of the image with 30px focus blur applied (gaussian type), set to additive mode
//5. all layers grouped into one folder or combined into one layer, apply "spherise" filter with curvature set to 1.000 and amount -1.000, radial mode, linear resampling
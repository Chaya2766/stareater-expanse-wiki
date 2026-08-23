//gyroid_segment module made by claude 4.5 haiku
module gyroid_segment(size=50, resolution=20, thickness=2, invert=false) {
    // size: overall dimensions of the bounding box
    // resolution: number of sample points (higher = smoother but slower)
    // thickness: wall thickness of the surface
    
    step = size / resolution;
    
    for (x = [0 : step : size - step]) {
        for (y = [0 : step : size - step]) {
            for (z = [0 : step : size - step]) {
                // Calculate the gyroid function value at this point
                // Gyroid equation: sin(x) * cos(y) + sin(y) * cos(z) + sin(z) * cos(x) = 0
                
                // Normalize coordinates to a reasonable range for sin/cos
                x_norm = (x / size) * 360;
                y_norm = (y / size) * 360;
                z_norm = (z / size) * 360;
                
                value = sin(x_norm) * cos(y_norm) + sin(y_norm) * cos(z_norm) + sin(z_norm) * cos(x_norm);
                
                // Create geometry near the zero-crossing of the gyroid surface
                if(invert){//invert added by me
                    if (abs(value) > thickness) {
                        translate([x, y, z])
                        cube(step, center=true);
                    }
                } else {
                    if (abs(value) < thickness) {
                        translate([x, y, z])
                        cube(step, center=true);
                    }
                }
            }
        }
    }
}

module gyroid_cube(dimensions=[100,50,20],segment_size=10,resolution=30,thickness=1,invert=false){
    for(x=[0:segment_size:dimensions[0]-segment_size]){
        for(y=[0:segment_size:dimensions[1]-segment_size]){
            for(z=[0:segment_size:dimensions[2]-segment_size]){
                translate([x,y,z]){gyroid_segment(size=segment_size,resolution=resolution,thickness=thickness,invert=invert);}
            }
        }
    }
}

// Example usage:
//gyroid_segment(size=10, resolution=30, thickness=1, invert=true);
if($t<0.5){
gyroid_cube([50,50,50],segment_size=25,resolution=40,thickness=0.2,invert=false);
    translate([25,25,75])rotate([90,0,90])text("gyroid",halign="center",valign="center",size=10);
} else {
gyroid_cube([50,50,50],segment_size=25,resolution=40,thickness=1.3,invert=true);
translate([25,25,75])rotate([90,0,-90])text("anti-gyroid",halign="center",valign="center",size=10);
}

$vpt=[25,25,35];
$vpr=[55,0,360*$t];
$vpd=300;

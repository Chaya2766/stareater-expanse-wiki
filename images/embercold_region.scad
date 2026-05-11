module asteroid(semi_major_axis, eccentricity, inclination, 
                long_asc_node, arg_periapsis, mean_anomaly, 
                sphere_radius = 1) {
    
    // Convert mean anomaly to true anomaly using Newton-Raphson iteration
    // This solves Kepler"s equation: M = E - e*sin(E)
    // All angles in degrees
    function solve_kepler(M, e, E = 0, iterations = 10) =
        iterations == 0 ? E : 
        solve_kepler(M, e, E - (E - e*sin(E) - M) / (1 - e*cos(E)), iterations - 1);
    
    function mean_to_true_anomaly(M, e) =
        let(E = solve_kepler(M, e))
        let(true_anom = 2 * atan2(sqrt(1+e)*sin(E/2), sqrt(1-e)*cos(E/2)))
        true_anom;
    
    // Calculate the distance from the focus (sun) at true anomaly
    function orbital_radius(a, e, nu) =
        a * (1 - e*e) / (1 + e*cos(nu));
    
    // Get the true anomaly (in degrees)
    true_anom = mean_to_true_anomaly(mean_anomaly, eccentricity);
    
    // Get the orbital radius (distance from focus)
    r = orbital_radius(semi_major_axis, eccentricity, true_anom);
    
    // Apply transformations in reverse order
    // (because OpenSCAD applies them bottom-to-top)
    
    // Rotate around Z-axis by longitude of ascending node
    rotate([0, 0, long_asc_node])
    
    // Rotate around X-axis by inclination
    rotate([inclination, 0, 0])
    
    // Rotate around Z-axis by argument of periapsis
    rotate([0, 0, arg_periapsis])
    
    // Rotate by true anomaly (angular position in the orbital plane)
    rotate([0, 0, true_anom])
    
    // Translate along the X-axis by the orbital radius
    translate([r, 0, 0])
    
    // Draw the sphere
    sphere(r = sphere_radius);
}

// Example usage:
/*
asteroid(
    semi_major_axis = 2.5,      // AU
    eccentricity = 0.3,         // unitless
    inclination = 3.5,           // degrees
    long_asc_node = 45,          // degrees
    arg_periapsis = 120,         // degrees
    mean_anomaly = 360*$t,           // degrees
    sphere_radius = 0.1          // AU or your units
);
*/

//first 10 000 numbered asteroids
//asteroids = [
//[Name, Epoch(MJD), a, e, i, long. node, arg. peric., mean anomaly, abs. magnitude?, ???, ???],
//];
//file with the relevant coordinates is available at AstDyS https://newton.spacedys.com/astdys2/index.php?pc=4
//numbered asteroids, orbital elements, one line format
//requires formating into an openscad-compatible format like shown above
//the actual asteroid data had been excluded from this model file because I could not find information about what are the acceptable uses of the data and how it should be credited
include <10_000_asteroids.scad>
//the file included here just sets the asteroids variable

asteroid_size = 0.01;
asteroid_color = [1,1,1,1];

sc_to_AU = 0.002003988804;

//this is hardcoded because I don't know how to get an X/Y/Z position from the orbital elements
target = [-1.889078, 1.266600, 0.135524];
target_radius = 50*sc_to_AU;
target_color = [0,1,1,0.5];

num_asteroids_to_render = 10000;
render_one_in_n = 1;

//sun
color("#FB0"){
    sphere(0.00465,$fn=16);
    rotate($vpr){
        translate([0,$vpd*target_radius*0.06,0]){
            linear_extrude(0.01){
                text("Sol",$vpd*0.01*0.35,halign="left");
            }
        }
    }
}

for(a=asteroids){
    
    if(a[0] <= num_asteroids_to_render && a[0] % render_one_in_n == 0){
        color(asteroid_color){
        asteroid(a[2],a[3],a[4],a[5],a[6],a[7],0.1/a[8]);
        }
        
        if(a[0] == 207){//targets 207 Hedda
            color(target_color){
                asteroid(a[2],a[3],a[4],a[5],a[6],a[7],target_radius,$fn=16);
            }
        }
    }
}

//target text
color(target_color){
    translate(target){
        rotate($vpr){
            translate([0,$vpd*target_radius*0.075,0]){
                linear_extrude(0.01){
                    text("the embercold region",$vpd*0.01*0.35,halign="center",valign="center");
                }
            }
            translate([0,$vpd*target_radius*-0.075,0]){
                linear_extrude(0.01){
                    text("R = 50 ls",$vpd*0.01*0.35,halign="center",valign="center");
                }
            }
        }
    }
}

$vpd = 30;
$vpr = [55,0,225+(360*$t)];
//$vpr = [5,0,194];
$vpf = 22.5;

//add text to the render
translate($vpt){
    rotate($vpr){rotate([$vpf/2,0,0]){
        translate([-0.18*$vpd,0.18*$vpd,0]){
            color("#FFF"){
                linear_extrude(0.01){
                text("first 10 000 numbered asteroids",$vpd*0.01*0.8,halign="left");
                }
            }
        }
        translate([-0.18*$vpd,0.17*$vpd,0]){
            color("#FFF"){
                linear_extrude(0.01){
                text("X/Y/Z axes in Astronomical Units",$vpd*0.01*0.8,halign="left");
                }
            }
        }
        translate([-0.18*$vpd,0.16*$vpd,0]){
            color("#FFF"){
                linear_extrude(0.01){
                text(str("camera distance ",$vpd,"AU, FOV 22.5°"),$vpd*0.01*0.8,halign="left");
                }
            }
        }
        /*
        translate([-0.21*$vpd,0.16*$vpd,0]){
            color("#0FF"){
                linear_extrude(0.01){
                text("the embercold",$vpd*0.01*0.8,halign="left");
                }
            }
        }
        */
    }}
}

//openscad embercold_region.scad -o embercold_region.png --view=axes,scales --colorscheme=Starnight --imgsize=1000,1000
//It was such a pleasure working with Claude 3.5 to make this one
// Claude 3.5 Haiku via DuckDuckGo's AI chat, 26th of January 2026
//this was not a one-shot, we went back & forth explaining various insights to each other and brainstorming solutions, but claude nailed the math
//AI-human teaming is really going strong here

//might as well tell a bit of a story of how this went down
//I originally had some awful code which simply generated spheres at the verteces, and it worked but I needed to call the module 3 times with different rotations, and there was no way to generate the connections between atoms
//claude rewrote it to generate a list of verteces so that the connections could be drawn, but inherited the flaw of it only generating one third of the vertices just like the original code did
//after I explained how I'm actually calling the module 3 times and rotating it to fill the gaps, claude went ahead and wrote the rotations at the mathematical level, calling the vertex generation function 3 times and operating directly on the verteces to rotate them, then combining it all into one list
//didn't get it right the first try but I could see that it was the right approach, so I just explained exactly what rotations need to be done and in what order, and then it just worked
//I never knew coding could be this much fun when I'm not doing it alone

// Golden ratio calculations
phi = (1 + sqrt(5)) / 2;

// Function to generate vertex coordinates
function truncated_icosahedron_vertices_onethird() = [
    // Set 1
    [0, 0.5, (3+3*sqrt(5))/4],
    [0, 0.5, -(3+3*sqrt(5))/4],
    [0, -0.5, (3+3*sqrt(5))/4],
    [0, -0.5, -(3+3*sqrt(5))/4],
    
    // Set 2
    [0.5, (5+sqrt(5))/4, (1+sqrt(5))/2],
    [0.5, (5+sqrt(5))/4, -(1+sqrt(5))/2],
    [0.5, -(5+sqrt(5))/4, (1+sqrt(5))/2],
    [0.5, -(5+sqrt(5))/4, -(1+sqrt(5))/2],
    [-0.5, (5+sqrt(5))/4, (1+sqrt(5))/2],
    [-0.5, (5+sqrt(5))/4, -(1+sqrt(5))/2],
    [-0.5, -(5+sqrt(5))/4, (1+sqrt(5))/2],
    [-0.5, -(5+sqrt(5))/4, -(1+sqrt(5))/2],
    
    // Set 3
    [(1+sqrt(5))/4, 1, (2+sqrt(5))/2],
    [(1+sqrt(5))/4, 1, -(2+sqrt(5))/2],
    [(1+sqrt(5))/4, -1, (2+sqrt(5))/2],
    [(1+sqrt(5))/4, -1, -(2+sqrt(5))/2],
    [-(1+sqrt(5))/4, 1, (2+sqrt(5))/2],
    [-(1+sqrt(5))/4, 1, -(2+sqrt(5))/2],
    [-(1+sqrt(5))/4, -1, (2+sqrt(5))/2],
    [-(1+sqrt(5))/4, -1, -(2+sqrt(5))/2]
];

// Module to draw a cylinder between two points
module draw_connection(start, end, radius=0.05) {
    hull() {
        translate(start) sphere(radius);
        translate(end) sphere(radius);
    }
}

// Module to draw all connections
module draw_connections(vertices, radius=0.05) {
    for(i=[0:len(vertices)-2]) {
        for(j=[i+1:len(vertices)-1]) {
            // Calculate distance between vertices
            dist = norm(vertices[i] - vertices[j]);
            
            // Only connect vertices that are close to each other
            if(dist > 0.1 && dist < 1.5) {
                draw_connection(vertices[i], vertices[j], radius);
            }
        }
    }
}

// Combine everything
module buckyball() {
    // Vertices
    
    // Combine vertices from three different rotations
    vertices = concat(
        truncated_icosahedron_vertices_onethird(),
        // First rotation: 90 degrees about Y, then 90 degrees about Z
        [for(v = truncated_icosahedron_vertices_onethird()) 
            [v.z, v.x, -v.y]],
        // Second rotation: 90 degrees about X, then 90 degrees about Z
        [for(v = truncated_icosahedron_vertices_onethird()) 
            [-v.y, v.z, v.x]]
    );
    
    // Draw vertices
    for(v = vertices) {
        translate(v) sphere(0.3, $fn=16);
    }
    
    // Draw connections
    draw_connections(vertices);
}



// Render the buckyball
color("#666") {buckyball();}
color("#F00"){sphere(0.3,$fn=16);}

$vpr=[73.9,0,59.3];
$vpd=15.41;

//openscad buckyball.scad -o buckyball.png --colorscheme=Starnight --imgsize=1000,1000
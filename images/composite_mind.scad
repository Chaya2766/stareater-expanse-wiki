n = 4;//specifies the number of nodes
d = 100;//distance of nodes from the center
r = 3;//node size
t = 1;//connection thickness

//this part below generates coordinates so that the nodes are laid out evenly in a sphere thanks to Claude Haiku 4.5
generated_points = [for (i = [0:n-1]) 
    let (
        phi = i * 180 / (n - 1),           // vertical angle (0 to 180 degrees)
        theta = i * 137.5                   // horizontal angle (golden angle)
    )
    [
        d * sin(phi) * cos(theta),
        d * sin(phi) * sin(theta),
        d * cos(phi)
    ]
];

//manually defined points
manual_points = [
//    [0, 0, 0]
];

//combine both arrays
points = concat(generated_points, manual_points);

//actually creates the nodes
color("#F00"){
for (p = points) {
    translate(p){sphere(r);}
}
}

//draws connections between the nodes
color("#08F6"){
for(i=[0:len(points)-1]){
    for(j=[0:len(points)-1]){
        if(i>j){//this prevents drawing the same connection twice
        hull(){
            translate(points[i]){sphere(t);}
            translate(points[j]){sphere(t);}
        }
        }
    }
}
}

//calculate midpoints of all connections
midpoints = [for(i=[0:len(points)-1]) for(j=[0:len(points)-1]) if(i>j)
    [(points[i][0] + points[j][0])/2,
     (points[i][1] + points[j][1])/2,
     (points[i][2] + points[j][2])/2]
];

echo("midpoints:",len(midpoints));

color("#0F0"){
for (p = midpoints) {
    translate(p){sphere(r/2);}
}
}


//draws connections between the midpoints
color("#0F03"){
for(i=[0:len(midpoints)-1]){
    for(j=[0:len(midpoints)-1]){
        if(i>j){//this prevents drawing the same connection twice
        hull(){
            translate(midpoints[i]){sphere(t/2);}
            translate(midpoints[j]){sphere(t/2);}
        }
        }
    }
}
}



//calculate double-midpoints of connections between the midpoints
d_midpoints = [for(i=[0:len(midpoints)-1]) for(j=[0:len(midpoints)-1]) if(i>j)
    [(midpoints[i][0] + midpoints[j][0])/2,
     (midpoints[i][1] + midpoints[j][1])/2,
     (midpoints[i][2] + midpoints[j][2])/2]
];

echo("d_midpoints:",len(d_midpoints));

//openscad composite_mind.scad -o composite_mind.png --colorscheme=Starnight --imgsize=1000,1000 --autocenter --viewall
//for 3 nodes, --camera=-18.3,22.84,0,90,0,308.7,680
//for 4 nodes, --camera=-18.3,22.84,0,85.8,0,345.8,680
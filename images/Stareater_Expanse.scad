//this model is meant to be used with the "Starnight" skin
//you can convert the dumped pictures into a gif using gimp
//manually running openscad from the console seems to allow it to dump images in the case that it fails

//default unit is light years
//this sets how many units one lightyear is
//set to 31.5576 to for megalightseconds instead
ly=1;
//ly = 31.5576; 
$vpd = 140*ly;

$vpr = [60,0,45+($t*360)];//camera rotation

num_stars = 5000;
seed = 0;
min_distance = 1*ly;
max_distance = 100*ly;
min_star_size = 0.01*ly;
max_star_size = 0.1*ly;
distance_distribution_power = 2;

ddp=distance_distribution_power;

dist = rands(pow(min_distance,1/ddp),pow(max_distance,1/ddp),num_stars,seed);
angle_x = rands(0,360,num_stars,seed+1);
angle_y = rands(0,360,num_stars,seed+2);
angle_z = rands(0,360,num_stars,seed+3); //this results in even distribution
//angle_z = rands(0,0,num_stars,seed+3); //this results in an interestingly increased concentration of stars along the y axis
size = rands(min_star_size, max_star_size, num_stars,seed+4);

for(n = [0:1:num_stars-1]){
    rotate([angle_x[n],angle_y[n],angle_z[n]]){
        translate([0,0,pow(dist[n],ddp)]){
            sphere(r=size[n]);
        }
    }
}
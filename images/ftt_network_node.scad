use <ftt_power_connector_2.scad>

module network_node(){
    radius=50;
    color("#EEE"){sphere(radius);}
    
    color("#444"){
    for(a=[4,11,15]){
        rotate([a,0,a*20]){
            translate([0,0,radius-10]){cylinder(r=5,h=11);}
        }
    }
    for(a=[18:2:28]){
        rotate([a,0,a*20]){
            translate([0,0,radius-10]){cylinder(r=5,h=11);}
        }
    }
    for(a=[30:1.5:45]){
        rotate([a,0,a*20]){
            translate([0,0,radius-10]){cylinder(r=5,h=11);}
        }
    }
    for(a=[46:1:135]){
        rotate([a,0,a*20]){
            translate([0,0,radius-10]){cylinder(r=5,h=11);}
        }
    }
    }
    
    translate([0,0,-40]){
        rotate([180,0,0]){
            plug();
        }
    }
}

network_node();
$vpr=[76.7,0,245.5];
$vpt=[0,0,-15];
$vpd=420;
//openscad ftt_network_node.scad -o ftt_network_node.png --colorscheme=Starnight --imgsize=1000,1000
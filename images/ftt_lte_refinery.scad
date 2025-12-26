use <power_connector.scad>

$vpr=[69,0,22.2];
$vpt=[400,400,1000];
$vpd=6500;
//openscad ftt_lte_refinery.scad --view=axes,scales -o ftt_lte_refinery.png --colorscheme=Starnight --viewall --imgsize=1000,1000


color_plastic = "#EEE";
color_metal = "#888";
color_carbon = "#333";
color_hydroxide = "#567";

module recursive_tree(height=600,radius=50,color="#999",angle1=120,angle2=30,level=3){
    hull(){
        translate([radius,0,0]){sphere(radius/10);}
        rotate([0,0,120]){translate([radius,0,0]){sphere(radius/10);}}
        rotate([0,0,240]){translate([radius,0,0]){sphere(radius/10);}}
        translate([0,0,height]){sphere(radius/10);}
    }
    if(level>0){
        for(i=[1.5,2,3,4,5,6,7]){
        translate([0,0,height/i]){scale(0.5){
            rotate([0,0,angle1*i]){rotate([angle2,0,0]){
                recursive_tree(height=height,radius=radius,color=color,angle1=angle1,angle2=angle2,level=level-1);
                }}
        }}
        }
    }
}

//electrolysis chamber
difference(){
    
    translate([90,90,190]){color(color_metal){cube([620,620,720]);}}
    translate([100,100,200]){color(color_carbon){cube([600,600,900]);}}
    //translate([90,90,600]){color(color_plastic){cube([620,620,900]);}}
}
difference(){
translate([90,90,0]){color(color_metal){cube([620,620,200]);}}
translate([90+50,90+50,-50]){color(color_metal){cube([520,520,250]);}}
translate([90-50,90+50,50]){color(color_metal){cube([720,520,250]);}}
translate([90+50,90-50,50]){color(color_metal){cube([520,720,250]);}}
}

//radiators
for(i=[0,100,200,300,400,500,600]){color(color_metal){
    translate([0,95+i,200]){cube([90,10,710]);}
    translate([710,95+i,200]){cube([90,10,710]);}
}}
for(i=[0,100,200,300,400,500,600]){color(color_metal){
    translate([95+i,0,200]){cube([10,90,710]);}
    translate([95+i,710,200]){cube([10,90,710]);}
}}

//sodium hydroxide bath
translate([100,100,200]){color(color_hydroxide){cube([600,600,460]);}}
//crane
color(color_metal){
    difference(){
        translate([350,700,0]){cube([100,275,600]);}
        translate([300,600,50]){cube([200,275,600]);}
        translate([365,890,50]){cube([70,70,560]);}
    }
    translate([375,900,0]){cube([50,50,2000]);}
    translate([375,0,1950]){cube([50,900,50]);}
    //hooks
    for(i=[100,400,700]){
        hull(){translate([400,i+150,1950]){sphere(10);} translate([400,i+50,1850]){sphere(10);}}
        hull(){translate([400,i+50,1850]){sphere(10);} translate([400,i-0,1850]){sphere(10);}}
        hull(){translate([400,i-0,1850]){sphere(10);} translate([400,i-20,1870]){sphere(10);}}
    }
}
//crane insulation
color(color_plastic){translate([365,890,50]){cube([70,70,560]);}}

//electrolysis assembly
//z=910 for closed, z=1570 for open
translate([0,0,1570]){
    color(color_metal){difference(){
        cube([800,800,200]);
        translate([400,100,100]){rotate([90,0,0]){cylinder(d=50,h=200);}}
        translate([400,50,100]){rotate([90,0,0]){cylinder(d1=50,d2=400,h=200);}}
    }}
    translate([400,100,100]){rotate([90,-90,0]){plug();}}
    
    translate([-10,-10,-10]){color(color_plastic){cube([820,820,10]);}}
    for(i=[[400,400,-600],[150,150,-600],[650,150,-600],[150,650,-600],[650,650,-600]]){
    translate(i){color(color_carbon){cylinder(h=600,r=15);}}//this is the cathode
    }
    translate([400,400,0]){rotate([180,0,0]){color("#FFF"){recursive_tree();}}}
    
    color(color_metal){//front handle
        hull(){translate([250,100,200]){sphere(10);} translate([300,100,300]){sphere(10);}}
        hull(){translate([300,100,300]){sphere(10);} translate([500,100,300]){sphere(10);}}
        hull(){translate([500,100,300]){sphere(10);} translate([550,100,200]){sphere(10);}}
    }
    
    color(color_metal){//middle handle
        hull(){translate([250,400,200]){sphere(10);} translate([300,400,300]){sphere(10);}}
        hull(){translate([300,400,300]){sphere(10);} translate([500,400,300]){sphere(10);}}
        hull(){translate([500,400,300]){sphere(10);} translate([550,400,200]){sphere(10);}}
    }
    
    color(color_metal){//back handle
        hull(){translate([250,700,200]){sphere(10);} translate([300,700,300]){sphere(10);}}
        hull(){translate([300,700,300]){sphere(10);} translate([500,700,300]){sphere(10);}}
        hull(){translate([500,700,300]){sphere(10);} translate([550,700,200]){sphere(10);}}
    }
}

//power supply

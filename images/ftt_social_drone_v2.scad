module limb(in=[[5,5,20,0,0,0,true],[5,2,20,0,0,0,true]],n=0){
if(in[n][6]){
hull(){
    sphere(in[n][0]);
    rotate([in[n][3],in[n][4],in[n][5]]){
        translate([0,0,in[n][2]]){
            sphere(in[n][1]);
        }
    }
}
}
if(n<len(in)){
    rotate([in[n][3],in[n][4],in[n][5]]){
        translate([0,0,in[n][2]]){
            limb(in,n+1);
        }
    }
}
}

fur_color = [0.8,0.8,0.8];
eye_blacks = [0.25,0.25,0.25];
eye_lights = [1,1,1];
bare_flesh = [1,1,1];
wings=true;
num_feathers = 20;

//for rendering 360 view:
//$vpd = 5000;
//$vpr = [65,0,$t*360];
//$vpt = [380,0,0];
//recomended render 100 frames at 10fps

//for a profile picture:
//openscad ftt_social_drone_v2.scad -o chaya2766.png --colorscheme=Starnight --view=axes,scales --imgsize=1000,1000 --camera=291,65,235,80,0,277,1300

//body angles
ba=[//order from neck to body to tail
    [0,-20,0],//neck joint nearest to the head
    [0,-40,0],
    [0,-40,0],
    [0,40,0],
    [0,40,0],
    [0,-70,0],//end of neck
    [0,90,0],//start of body
    [0,0,0],
    [0,0,0],
    [0,10,0],//start of tail
    [0,10,0],
    [0,20,0],
    [0,10,0],
    [0,0,0],
    [0,-10,0],
    [0,-20,0],
    [30,-10,0],//left twin tail
    [-30,-10,0],
    [-30,-10,0],//right twin tail
    [30,-10,0]
];

//front right leg angles
frla=[
    [-45,180-45,0],
    [0,-35,35],
    [0,-20,0],
    [0,30,0],
    [0,30,0],//finger 1
    [0,10,0],
    [0,40,60],//finger 2
    [0,10,0],
    [0,40,-60],//finger 3
    [0,10,0],
    [0,100,180],//finger 4
    [0,10,0]
];

//front left leg angles
flla=[
    [45,180-45,0],
    [0,-35,-35],
    [0,-20,0],
    [0,30,0],
    [0,30,0],//finger 1
    [0,10,0],
    [0,40,60],//finger 2
    [0,10,0],
    [0,40,-60],//finger 3
    [0,10,0],
    [0,100,180],//finger 4
    [0,10,0]
];

//middle right leg angles
mrla=[
    [-90,180,-22.5],
    [0,-45,0],
    [0,-20,0],
    [0,30,0],
    [0,30,0],//finger 1
    [0,10,0],
    [0,40,60],//finger 2
    [0,10,0],
    [0,40,-60],//finger 3
    [0,10,0],
    [0,100,180],//finger 4
    [0,10,0],
];

//middle left leg angles
mlla=[
    [90,180,22.5],
    [0,-45,0],
    [0,-20,0],
    [0,30,0],
    [0,30,0],//finger 1
    [0,10,0],
    [0,40,60],//finger 2
    [0,10,0],
    [0,40,-60],//finger 3
    [0,10,0],
    [0,100,180],//finger 4
    [0,10,0],
];

//rear right leg angles
rrla=[
    [-45,90-45,0],
    [0,-35,90+45],
    [0,-20,0],
    [0,30,0],
    [0,30,0],//finger 1
    [0,10,0],
    [0,40,60],//finger 2
    [0,10,0],
    [0,40,-60],//finger 3
    [0,10,0],
    [0,100,180],//finger 4
    [0,10,0],
];

//rear left leg angles
rlla=[
    [45,90-45,0],
    [0,-35,-45-90],
    [0,-20,0],
    [0,30,0],
    [0,30,0],//finger 1
    [0,10,0],
    [0,40,60],//finger 2
    [0,10,0],
    [0,40,-60],//finger 3
    [0,10,0],
    [0,100,180],//finger 4
    [0,10,0],
];

color(fur_color){
//main body & tail
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],true],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],true],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],true],
    [80,50,100,ba[9][0],ba[9][1],ba[9][2],true],
    [50,30,100,ba[10][0],ba[10][1],ba[10][2],true],
    [30,30,100,ba[11][0],ba[11][1],ba[11][2],true],
    [30,30,100,ba[12][0],ba[12][1],ba[12][2],true],
    [30,30,100,ba[13][0],ba[13][1],ba[13][2],true],
    [30,30,100,ba[14][0],ba[14][1],ba[14][2],true],
    [30,30,100,ba[15][0],ba[15][1],ba[15][2],true]
]);

//tail tips
limb([//left tail tip
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],false],
    [80,50,100,ba[9][0],ba[9][1],ba[9][2],false],
    [50,30,100,ba[10][0],ba[10][1],ba[10][2],false],
    [30,30,100,ba[11][0],ba[11][1],ba[11][2],false],
    [30,30,100,ba[12][0],ba[12][1],ba[12][2],false],
    [30,30,100,ba[13][0],ba[13][1],ba[13][2],false],
    [30,30,100,ba[14][0],ba[14][1],ba[14][2],false],
    [30,30,100,ba[15][0],ba[15][1],ba[15][2],false],
    [30,20,150,ba[16][0],ba[16][1],ba[16][2],true],
    [20,5,150,ba[17][0],ba[17][1],ba[17][2],true]
]);
limb([//right tail tip
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],false],
    [80,50,100,ba[9][0],ba[9][1],ba[9][2],false],
    [50,30,100,ba[10][0],ba[10][1],ba[10][2],false],
    [30,30,100,ba[11][0],ba[11][1],ba[11][2],false],
    [30,30,100,ba[12][0],ba[12][1],ba[12][2],false],
    [30,30,100,ba[13][0],ba[13][1],ba[13][2],false],
    [30,30,100,ba[14][0],ba[14][1],ba[14][2],false],
    [30,30,100,ba[15][0],ba[15][1],ba[15][2],false],
    [30,20,150,ba[18][0],ba[18][1],ba[18][2],true],
    [20,5,150,ba[19][0],ba[19][1],ba[19][2],true]
]);

//neck and head
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],true],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],true],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],true],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],true],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],true],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],true],//start of body angles
    [80,60,70,0,-10,0,true],
    [60,20,100,0,10,0,true]
    //the two above aren't parametric because they determine the head shape
]);

//ears
//upper left ear
difference(){
    limb([
        [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
        [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
        [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
        [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
        [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
        [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
        [40,40,90,90+45,0,45,false],
        [10,10,20,10,0,0,false],//this one just offsets the ear back, modify the angle of only this one to move the ear
        [40,10,100,-45,0,0,true]
    ]);
    limb([
        [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
        [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
        [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
        [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
        [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
        [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
        [40,40,90,90+45,0,45,false],
        [10,10,10,10,0,0,false],//same angle goes here to move the ear
        [30,10,100,-45,0,0,true],
        [10,40,100,200,0,0,true]
    ]);
}
//lower left ear
difference(){
    limb([
        [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
        [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
        [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
        [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
        [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
        [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
        [40,40,90,90+45,0,-45,false],
        [10,10,20,10,0,0,false],//this one just offsets the ear back, modify the angle of only this one to move the ear
        [40,10,100,-45,0,0,true]
    ]);
    limb([
        [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
        [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
        [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
        [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
        [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
        [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
        [40,40,90,90+45,0,-45,false],
        [10,10,10,10,0,0,false],//same angle goes here to move the ear
        [30,10,100,-45,0,0,true],
        [10,40,100,200,0,0,true]
    ]);
}
//upper right ear
difference(){
    limb([
        [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
        [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
        [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
        [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
        [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
        [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
        [40,40,90,90+45,0,135,false],
        [10,10,20,10,0,0,false],//this one just offsets the ear back, modify the angle of only this one to move the ear
        [40,10,100,-45,0,0,true]
    ]);
    limb([
        [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
        [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
        [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
        [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
        [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
        [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
        [40,40,90,90+45,0,135,false],
        [10,10,10,10,0,0,false],//same angle goes here to move the ear
        [30,10,100,-45,0,0,true],
        [10,40,100,200,0,0,true]
    ]);
}
//lower right ear
difference(){
    limb([
        [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
        [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
        [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
        [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
        [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
        [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
        [40,40,90,90+45,0,-135,false],
        [10,10,20,10,0,0,false],//this one just offsets the ear back, modify the angle of only this one to move the ear
        [40,10,100,-45,0,0,true]
    ]);
    limb([
        [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
        [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
        [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
        [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
        [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
        [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
        [40,40,90,90+45,0,-135,false],
        [10,10,10,10,0,0,false],//same angle goes here to move the ear
        [30,10,100,-45,0,0,true],
        [10,40,100,200,0,0,true]
    ]);
}

}
//tongue
color(bare_flesh){
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],//start of body angles
    [80,60,70,0,-10,0,false],
    [60,20,100,0,10,0,false],
    [8,8,25,0,0,0,true],
    [8,8,20,0,-30,0,true],
    [8,8,20,0,-30,0,true],
    [8,7,20,0,-20,0,true],
    [7,6,20,0,-10,0,true],
    [6,5,20,0,-10,0,true],
    [5,4,20,0,10,0,true],
    [4,3,20,0,10,0,true],
    [3,2,20,0,20,0,true],
    [2,1,20,0,20,0,true]
    //the two above aren't parametric because they determine the head shape
]);
}
//eyes
color(eye_blacks){
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,20,0,-10,0,false],
    [5,20,70,0,75,0,false],
    [10,15,20,0,-90-12,00,true],
    [15,10,20,0,20,00,true]
]);
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,20,0,-10,0,false],
    [5,20,70,0,75,-90,false],
    [10,15,20,0,-90-12,00,true],
    [15,10,20,0,20,00,true]
]);
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,20,0,-10,0,false],
    [5,20,70,0,75,90,false],
    [10,15,20,0,-90-12,00,true],
    [15,10,20,0,20,00,true]
]);
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,70,0,-10,0,false],
    [5,20,55,0,75,45,false],
    [10,15,20,0,-90-10,00,true],
    [15,10,20,0,20,00,true]
]);
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,70,0,-10,0,false],
    [5,20,55,0,75,-45,false],
    [10,15,20,0,-90-10,00,true],
    [15,10,20,0,20,00,true]
]);
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,70,0,-10,0,false],
    [5,20,55,0,75,-90-45,false],
    [10,15,20,0,-90-25,00,true],
    [15,10,20,0,20,00,true]
]);
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,70,0,-10,0,false],
    [5,20,55,0,75,90+45,false],
    [10,15,20,0,-90-25,00,true],
    [15,10,20,0,20,00,true]
]);
}
color(eye_lights){
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,20,0,-10,0,false],
    [5,20,70,0,75,0,false],
    [1,1,7.5,0,-12,00,true],
    [2,4,20,0,-75,00,true],
    [4,2,20,0,-10,00,true]
]);
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,20,0,-10,0,false],
    [5,20,70,0,75,-90,false],
    [1,1,7.5,0,-12,00,true],
    [2,4,20,0,-75,00,true],
    [4,2,20,0,-10,00,true]
]);
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,20,0,-10,0,false],
    [5,20,70,0,75,90,false],
    [1,1,7.5,0,-12,00,true],
    [2,4,20,0,-75,00,true],
    [4,2,20,0,-10,00,true]
]);
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,70,0,-10,0,false],
    [5,20,55,0,75,45,false],
    [1,1,7.5,0,-10,00,true],
    [2,4,20,0,-75,00,true],
    [4,2,20,0,-10,00,true]
]);
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,70,0,-10,0,false],
    [5,20,55,0,75,-45,false],
    [1,1,7.5,0,-10,00,true],
    [2,4,20,0,-75,00,true],
    [4,2,20,0,-10,00,true]
]);
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,70,0,-10,0,false],
    [5,20,55,0,75,-90-45,false],
    [1,1,7.5,0,-25,00,true],
    [2,4,20,0,-75,00,true],
    [4,2,20,0,-10,00,true]
]);
limb([
    [50,50,100,ba[5][0],ba[5][1],ba[5][2],false],
    [50,50,100,ba[4][0],ba[4][1],ba[4][2],false],
    [50,50,100,ba[3][0],ba[3][1],ba[3][2],false],
    [50,50,100,ba[2][0],ba[2][1],ba[2][2],false],
    [50,60,100,ba[1][0],ba[1][1],ba[1][2],false],
    [60,80,100,ba[0][0],ba[0][1],ba[0][2],false],
    [80,60,70,0,-10,0,false],
    [5,20,55,0,75,90+45,false],
    [1,1,7.5,0,-25,00,true],
    [2,4,20,0,-75,00,true],
    [4,2,20,0,-10,00,true]
]);
}

color(fur_color){
//front left leg
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,flla[0][0],flla[0][1],flla[0][2],true],
    [50,50,150,flla[1][0],flla[1][1],flla[1][2],true],
    [50,50,150,flla[2][0],flla[2][1],flla[2][2],true],
    [50,50,150,flla[3][0],flla[3][1],flla[3][2],true]
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,flla[0][0],flla[0][1],flla[0][2],false],
    [50,50,150,flla[1][0],flla[1][1],flla[1][2],false],
    [50,50,150,flla[2][0],flla[2][1],flla[2][2],false],
    [50,50,150,flla[3][0],flla[3][1],flla[3][2],false],
    [50,20,100,flla[4][0],flla[4][1],flla[4][2],true],
    [20,10,50,flla[5][0],flla[5][1],flla[5][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,flla[0][0],flla[0][1],flla[0][2],false],
    [50,50,150,flla[1][0],flla[1][1],flla[1][2],false],
    [50,50,150,flla[2][0],flla[2][1],flla[2][2],false],
    [50,50,150,flla[3][0],flla[3][1],flla[3][2],false],
    [50,20,100,flla[6][0],flla[6][1],flla[6][2],true],
    [20,10,50,flla[7][0],flla[7][1],flla[7][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,flla[0][0],flla[0][1],flla[0][2],false],
    [50,50,150,flla[1][0],flla[1][1],flla[1][2],false],
    [50,50,150,flla[2][0],flla[2][1],flla[2][2],false],
    [50,50,150,flla[3][0],flla[3][1],flla[3][2],false],
    [50,20,100,flla[8][0],flla[8][1],flla[8][2],true],
    [20,10,50,flla[9][0],flla[9][1],flla[9][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,flla[0][0],flla[0][1],flla[0][2],false],
    [50,50,150,flla[1][0],flla[1][1],flla[1][2],false],
    [50,50,150,flla[2][0],flla[2][1],flla[2][2],false],
    [50,50,150,flla[3][0],flla[3][1],flla[3][2],false],
    [50,20,100,flla[10][0],flla[10][1],flla[10][2],true],
    [20,10,50,flla[11][0],flla[11][1],flla[11][2],true],
]);
//front right leg
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,frla[0][0],frla[0][1],frla[0][2],true],
    [50,50,150,frla[1][0],frla[1][1],frla[1][2],true],
    [50,50,150,frla[2][0],frla[2][1],frla[2][2],true],
    [50,50,150,frla[3][0],frla[3][1],frla[3][2],true]
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,frla[0][0],frla[0][1],frla[0][2],false],
    [50,50,150,frla[1][0],frla[1][1],frla[1][2],false],
    [50,50,150,frla[2][0],frla[2][1],frla[2][2],false],
    [50,50,150,frla[3][0],frla[3][1],frla[3][2],false],
    [50,20,100,frla[4][0],frla[4][1],frla[4][2],true],
    [20,10,50,frla[5][0],frla[5][1],frla[5][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,frla[0][0],frla[0][1],frla[0][2],false],
    [50,50,150,frla[1][0],frla[1][1],frla[1][2],false],
    [50,50,150,frla[2][0],frla[2][1],frla[2][2],false],
    [50,50,150,frla[3][0],frla[3][1],frla[3][2],false],
    [50,20,100,frla[6][0],frla[6][1],frla[6][2],true],
    [20,10,50,frla[7][0],frla[7][1],frla[7][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,frla[0][0],frla[0][1],frla[0][2],false],
    [50,50,150,frla[1][0],frla[1][1],frla[1][2],false],
    [50,50,150,frla[2][0],frla[2][1],frla[2][2],false],
    [50,50,150,frla[3][0],frla[3][1],frla[3][2],false],
    [50,20,100,frla[8][0],frla[8][1],frla[8][2],true],
    [20,10,50,frla[9][0],frla[9][1],frla[9][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,frla[0][0],frla[0][1],frla[0][2],false],
    [50,50,150,frla[1][0],frla[1][1],frla[1][2],false],
    [50,50,150,frla[2][0],frla[2][1],frla[2][2],false],
    [50,50,150,frla[3][0],frla[3][1],frla[3][2],false],
    [50,20,100,frla[10][0],frla[10][1],frla[10][2],true],
    [20,10,50,frla[11][0],frla[11][1],frla[11][2],true],
]);

//mid left leg
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,mlla[0][0],mlla[0][1],mlla[0][2],true],
    [50,50,150,mlla[1][0],mlla[1][1],mlla[1][2],true],
    [50,50,150,mlla[2][0],mlla[2][1],mlla[2][2],true],
    [50,50,150,mlla[3][0],mlla[3][1],mlla[3][2],true]
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,mlla[0][0],mlla[0][1],mlla[0][2],false],
    [50,50,150,mlla[1][0],mlla[1][1],mlla[1][2],false],
    [50,50,150,mlla[2][0],mlla[2][1],mlla[2][2],false],
    [50,50,150,mlla[3][0],mlla[3][1],mlla[3][2],false],
    [50,20,100,mlla[4][0],mlla[4][1],mlla[4][2],true],
    [20,10,50,mlla[5][0],mlla[5][1],mlla[5][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,mlla[0][0],mlla[0][1],mlla[0][2],false],
    [50,50,150,mlla[1][0],mlla[1][1],mlla[1][2],false],
    [50,50,150,mlla[2][0],mlla[2][1],mlla[2][2],false],
    [50,50,150,mlla[3][0],mlla[3][1],mlla[3][2],false],
    [50,20,100,mlla[6][0],mlla[6][1],mlla[6][2],true],
    [20,10,50,mlla[7][0],mlla[7][1],mlla[7][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,mlla[0][0],mlla[0][1],mlla[0][2],false],
    [50,50,150,mlla[1][0],mlla[1][1],mlla[1][2],false],
    [50,50,150,mlla[2][0],mlla[2][1],mlla[2][2],false],
    [50,50,150,mlla[3][0],mlla[3][1],mlla[3][2],false],
    [50,20,100,mlla[8][0],mlla[8][1],mlla[8][2],true],
    [20,10,50,mlla[9][0],mlla[9][1],mlla[9][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,mlla[0][0],mlla[0][1],mlla[0][2],false],
    [50,50,150,mlla[1][0],mlla[1][1],mlla[1][2],false],
    [50,50,150,mlla[2][0],mlla[2][1],mlla[2][2],false],
    [50,50,150,mlla[3][0],mlla[3][1],mlla[3][2],false],
    [50,20,100,mlla[10][0],mlla[10][1],mlla[10][2],true],
    [20,10,50,mlla[11][0],mlla[11][1],mlla[11][2],true],
]);
//mid right leg
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,mrla[0][0],mrla[0][1],mrla[0][2],true],
    [50,50,150,mrla[1][0],mrla[1][1],mrla[1][2],true],
    [50,50,150,mrla[2][0],mrla[2][1],mrla[2][2],true],
    [50,50,150,mrla[3][0],mrla[3][1],mrla[3][2],true]
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,mrla[0][0],mrla[0][1],mrla[0][2],false],
    [50,50,150,mrla[1][0],mrla[1][1],mrla[1][2],false],
    [50,50,150,mrla[2][0],mrla[2][1],mrla[2][2],false],
    [50,50,150,mrla[3][0],mrla[3][1],mrla[3][2],false],
    [50,20,100,mrla[4][0],mrla[4][1],mrla[4][2],true],
    [20,10,50,mrla[5][0],mrla[5][1],mrla[5][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,mrla[0][0],mrla[0][1],mrla[0][2],false],
    [50,50,150,mrla[1][0],mrla[1][1],mrla[1][2],false],
    [50,50,150,mrla[2][0],mrla[2][1],mrla[2][2],false],
    [50,50,150,mrla[3][0],mrla[3][1],mrla[3][2],false],
    [50,20,100,mrla[6][0],mrla[6][1],mrla[6][2],true],
    [20,10,50,mrla[7][0],mrla[7][1],mrla[7][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,mrla[0][0],mrla[0][1],mrla[0][2],false],
    [50,50,150,mrla[1][0],mrla[1][1],mrla[1][2],false],
    [50,50,150,mrla[2][0],mrla[2][1],mrla[2][2],false],
    [50,50,150,mrla[3][0],mrla[3][1],mrla[3][2],false],
    [50,20,100,mrla[8][0],mrla[8][1],mrla[8][2],true],
    [20,10,50,mrla[9][0],mrla[9][1],mrla[9][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,mrla[0][0],mrla[0][1],mrla[0][2],false],
    [50,50,150,mrla[1][0],mrla[1][1],mrla[1][2],false],
    [50,50,150,mrla[2][0],mrla[2][1],mrla[2][2],false],
    [50,50,150,mrla[3][0],mrla[3][1],mrla[3][2],false],
    [50,20,100,mrla[10][0],mrla[10][1],mrla[10][2],true],
    [20,10,50,mrla[11][0],mrla[11][1],mrla[11][2],true],
]);
//rear left leg
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],false],
    [80,50,100,rlla[0][0],rlla[0][1],rlla[0][2],true],
    [50,50,150,rlla[1][0],rlla[1][1],rlla[1][2],true],
    [50,50,150,rlla[2][0],rlla[2][1],rlla[2][2],true],
    [50,50,150,rlla[3][0],rlla[3][1],rlla[3][2],true]
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],false],
    [80,50,100,rlla[0][0],rlla[0][1],rlla[0][2],false],
    [50,50,150,rlla[1][0],rlla[1][1],rlla[1][2],false],
    [50,50,150,rlla[2][0],rlla[2][1],rlla[2][2],false],
    [50,50,150,rlla[3][0],rlla[3][1],rlla[3][2],false],
    [50,20,100,rlla[4][0],rlla[4][1],rlla[4][2],true],
    [20,10,50,rlla[5][0],rlla[5][1],rlla[5][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],false],
    [80,50,100,rlla[0][0],rlla[0][1],rlla[0][2],false],
    [50,50,150,rlla[1][0],rlla[1][1],rlla[1][2],false],
    [50,50,150,rlla[2][0],rlla[2][1],rlla[2][2],false],
    [50,50,150,rlla[3][0],rlla[3][1],rlla[3][2],false],
    [50,20,100,rlla[6][0],rlla[6][1],rlla[6][2],true],
    [20,10,50,rlla[7][0],rlla[7][1],rlla[7][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],false],
    [80,50,100,rlla[0][0],rlla[0][1],rlla[0][2],false],
    [50,50,150,rlla[1][0],rlla[1][1],rlla[1][2],false],
    [50,50,150,rlla[2][0],rlla[2][1],rlla[2][2],false],
    [50,50,150,rlla[3][0],rlla[3][1],rlla[3][2],false],
    [50,20,100,rlla[8][0],rlla[8][1],rlla[8][2],true],
    [20,10,50,rlla[9][0],rlla[9][1],rlla[9][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],false],
    [80,50,100,rlla[0][0],rlla[0][1],rlla[0][2],false],
    [50,50,150,rlla[1][0],rlla[1][1],rlla[1][2],false],
    [50,50,150,rlla[2][0],rlla[2][1],rlla[2][2],false],
    [50,50,150,rlla[3][0],rlla[3][1],rlla[3][2],false],
    [50,20,100,rlla[10][0],rlla[10][1],rlla[10][2],true],
    [20,10,50,rlla[11][0],rlla[11][1],rlla[11][2],true],
]);
//rear right leg
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],false],
    [80,50,100,rrla[0][0],rrla[0][1],rrla[0][2],true],
    [50,50,150,rrla[1][0],rrla[1][1],rrla[1][2],true],
    [50,50,150,rrla[2][0],rrla[2][1],rrla[2][2],true],
    [50,50,150,rrla[3][0],rrla[3][1],rrla[3][2],true]
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],false],
    [80,50,100,rrla[0][0],rrla[0][1],rrla[0][2],false],
    [50,50,150,rrla[1][0],rrla[1][1],rrla[1][2],false],
    [50,50,150,rrla[2][0],rrla[2][1],rrla[2][2],false],
    [50,50,150,rrla[3][0],rrla[3][1],rrla[3][2],false],
    [50,20,100,rrla[4][0],rrla[4][1],rrla[4][2],true],
    [20,10,50,rrla[5][0],rrla[5][1],rrla[5][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],false],
    [80,50,100,rrla[0][0],rrla[0][1],rrla[0][2],false],
    [50,50,150,rrla[1][0],rrla[1][1],rrla[1][2],false],
    [50,50,150,rrla[2][0],rrla[2][1],rrla[2][2],false],
    [50,50,150,rrla[3][0],rrla[3][1],rrla[3][2],false],
    [50,20,100,rrla[6][0],rrla[6][1],rrla[6][2],true],
    [20,10,50,rrla[7][0],rrla[7][1],rrla[7][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],false],
    [80,50,100,rrla[0][0],rrla[0][1],rrla[0][2],false],
    [50,50,150,rrla[1][0],rrla[1][1],rrla[1][2],false],
    [50,50,150,rrla[2][0],rrla[2][1],rrla[2][2],false],
    [50,50,150,rrla[3][0],rrla[3][1],rrla[3][2],false],
    [50,20,100,rrla[8][0],rrla[8][1],rrla[8][2],true],
    [20,10,50,rrla[9][0],rrla[9][1],rrla[9][2],true],
]);
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,80,200,ba[8][0],ba[8][1],ba[8][2],false],
    [80,50,100,rrla[0][0],rrla[0][1],rrla[0][2],false],
    [50,50,150,rrla[1][0],rrla[1][1],rrla[1][2],false],
    [50,50,150,rrla[2][0],rrla[2][1],rrla[2][2],false],
    [50,50,150,rrla[3][0],rrla[3][1],rrla[3][2],false],
    [50,20,100,rrla[10][0],rrla[10][1],rrla[10][2],true],
    [20,10,50,rrla[11][0],rrla[11][1],rrla[11][2],true],
]);
}

if(wings){
color(fur_color){
//front left wing
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,45,180+45,0,true],
    [50,50,150,0,80,-35,true],
    [50,50,250,0,-90,-30,true],
    [50,5,1000,0,120,0,true]
]);
for(i=[1:1:num_feathers-1]){
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,45,180+45,0,false],
    [50,50,150,0,80,-35,false],
    [50,5,250,0,-90,-30,false],
    [25,5,1000*((num_feathers-i)/(num_feathers))+250*(i/num_feathers),0,120*((num_feathers-i)/(num_feathers))+180*(i/num_feathers),0,true]
]);    
}
//front right wing
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,-45,180+45,0,true],
    [50,50,150,0,80,35,true],
    [50,50,250,0,-90,20,true],
    [50,5,1000,0,120,0,true]
]);
for(i=[1:1:num_feathers-1]){
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,50,100,-45,180+45,0,false],
    [50,50,150,0,80,35,false],
    [50,5,250,0,-90,20,false],
    [25,5,1000*((num_feathers-i)/(num_feathers))+250*(i/num_feathers),0,120*((num_feathers-i)/(num_feathers))+180*(i/num_feathers),0,true]
]);    
}
//hind left wing
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,45,180+45,-10,true],//
    [50,50,150,0,80,-35,true],
    [50,50,250,0,-90,-25,true],
    [50,5,1000,0,120,0,true]
]);
for(i=[1:1:num_feathers-1]){
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,45,180+45,-10,false],//
    [50,50,150,0,80,-35,false],
    [50,5,250,0,-90,-25,false],
    [25,5,1000*((num_feathers-i)/(num_feathers))+250*(i/num_feathers),0,120*((num_feathers-i)/(num_feathers))+180*(i/num_feathers),0,true]
]);
}
//hind right wing
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,-45,180+45,10,true],//
    [50,50,150,0,80,35,true],
    [50,50,250,0,-90,25,true],
    [50,5,1000,0,120,0,true]
]);
for(i=[1:1:num_feathers-1]){
limb([
    [50,80,100,ba[6][0],ba[6][1],ba[6][2],false],
    [80,100,200,ba[7][0],ba[7][1],ba[7][2],false],
    [100,50,100,-45,180+45,10,false],//
    [50,50,150,0,80,35,false],
    [50,5,250,0,-90,25,false],
    [25,5,1000*((num_feathers-i)/(num_feathers))+250*(i/num_feathers),0,120*((num_feathers-i)/(num_feathers))+180*(i/num_feathers),0,true]
]);
}

}
}
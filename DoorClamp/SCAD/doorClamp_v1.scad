//Copyright 2022 Gilgamech Technologies
//Title: Door Clamp
//Made by: Stephen Gillie
//Created on: 3/26/2022
//Updated on: 3/30/2022
//Units: inches (.0254)
//Notes: To clamp together 2 trailers at their doorways.

include  <Gilgahedron.scad>
include  <lib-worm-dh.scad>

len=20;
thickness=1;
height=4;
wormScale=2;
wormAlign=-wormScale*.88;
betweenSpace = 20;

//clampMain(0);//Left clamp
clampMain(1);//Right side

module clampMain(mir=0){
mirror([mir,0,0]){
doorClamp();//angle clamp
//doorClamp(90,-8,0,0,len/2);//long clamp
}}

//module doorClamp(){
//clampSection(0);
//mirror([0,1,0]){
//translate([0,-4,-4]){
//rotate([90,0,0]){
//clampSection(0);
//}}}}

module doorClamp(rot=0,adj=0,mir=1,y=-4,z=-4){
translate([0,0,adj]){
rotate([rot,0,0]){
clampSection(0);
}}
mirror([0,mir,0]){
translate([0,y,z]){
rotate([90,0,0]){
clampSection(0);
}}}}

module clampSection(rot=0){
rotate([rot,0,0]){
clampPanel();
doorScrew(-2);
doorScrew(-2,-8);
translate([-betweenSpace+5,0,0]){
mirror([1,0,0]){
clampPanel();
}}}}


module doorScrew(x=0,y=0,z=0){
translate([x,y,z]){
gCylinder(5,.1,.1,-betweenSpace+3);//screw handles

//screw handles
gCylinder(betweenSpace,1,1,-8,0,0,0,90,0);//worm screw stand ins
}}

module clampPanel(xMove=0,yMove=0,zMove=0,xRot=0){
gCube(thickness,len,height,xMove,yMove,zMove,xRot);//lower panel
gCube(thickness,len,height,xMove,yMove,zMove+4,xRot);//upper panel
gCube(thickness,len-height+.5
    ,height,xMove-2,yMove-height/2+.25,zMove+2,xRot,90);//center panel
}


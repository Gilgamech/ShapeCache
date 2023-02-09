//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 12/2/2022
//Updated on: 12/21/2022
//Units: millimeters (.001)
//Notes: 
//v1.3 add pegs and holes for structural support.
//v1.4 reduce peg length.
//v1.4.1 increase reCube size by .25 mm to increase hole support and prevent cracks.

include  <Gilgahedron.scad>
difference(){
union(){
voxelHedron(45);

triFill();
for (r =[90,180,270]){
triFill(r);
triFill(0,r);
}
triFill(0,0,180);
triFill(0,90,180);

//reCubes rotate around a square:
//reCube(0,0,90);//0,y,bot
//reCube(90,0,90);//x,y,mid
//reCube(180,0,90);//0,y,top
//reCube(270,0,90);//-x,y,mid
//OR X=0 is top, 90 & 270 are mid, and 180 is bot.
//Adjust X to adjust corner, adjust Z to change square, adjust Y to mess it up.

for (x =[0,90,180]){
for (z =[0,90,180,270]){
reCube(x,0,z);
}}

addRepost();
}//end union
rotate([180,270,0])
addRepost(-4,1.1,5);
}

module addRepost(xadj=0,radj=1,h=2){
for (z =[0,90]){
rePost(0,z,0,xadj,radj,h);
rePost(90,z,0,xadj,radj,h);
}
}
module rePost(ry=0,rz=0,t=0,xadj=0,radj=1,h=2){
tp = 31.84;
r=2*radj;
xm = tp+(h/2)+xadj;
ym = 0;
zm = tp-4;
xr = 0;
zr = 90;

for (rx =[0,90,180,270]){
rotate([rx,ry,rz]){
if (t==0){//posts
}else {//gaps
r =r*1.1;
xm = tp-(h*.8);
zm = tp-2;
}
gCylinder(h,r,r,xm,ym,zm,xr,zr);
}}
}
module reCube(rx=0,ry=0,rz=0){
adj=7.25;
tp = 31.84;
fr = tp;
bk = fr-adj;
lf = adj-2;
rt = -lf;
bo = tp-adj;
CubePoints = [
  [ fr, 0,  tp ],  //0 - nose (front center top)
  [ bk, lf, tp ],  //1 - bk left top
  [ bk, rt, tp ],  //2 - bk rt top
  [ fr, lf, bo ],  //3 - fr left bot
  [ fr, rt, bo ]]; //4 - fr rt bot
CubeFaces = [
  [1,2,4,3],  // bottom
  [0,4,2],  // right
  [0,2,1],  // top
  [0,1,3],  // left
  [0,3,4]]; // front
  
rotate([rx,ry,rz]){
polyhedron( CubePoints, CubeFaces );
}
}

module triBigG(sg = .65,re = 45,su = 21.5){
translate([su,-su,su])
rotate([re+9,0,re])
translate([0,0,-2])
icon_extrude("BigG.dxf",sg,sg,2);
}
module triFill(rx=0,ry=0,rz=0){
in = 29.1;
ot = 31.8;
CubePoints = [
  [ in, in,  0 ],  //0 - x,y
  [ in,  0, in ],  //1 - x,z
  [  0, in, in ],  //2 - y,z
  [ ot, ot,  0 ],  //3 - x,y
  [ ot,  0, ot ],  //4 - x,z
  [  0, ot, ot ]]; //5 - y,z
  
CubeFaces = [
  [2,1,0],  // inside
  [3,4,5],  // outside
  [1,2,5,4],  // top
  [0,3,5,2],  // rightFrOut
  [0,1,4,3]]; // leftFrOut
  
rotate([rx,ry,rz])
polyhedron( CubePoints, CubeFaces );
//triBigG();
}

module voxelHedron(s = 1){
sz = s*1.3;
sc = s*1.415;
sd = s*0.9;
se = s*1.45;
az = 90;
difference(){
diamondHedron(s,sc);
diamondHedron(sd,se);
sizeCube(sz,sz,sz);
}}

module diamondHedron(sz = 1,le = (1.415),ro = 45){
union(){
sizeCube(le,sz,sz,ro);
sizeCube(sz,le,sz,0,ro);
sizeCube(sz,sz,le,0,0,ro);
}}
module sizeCube(sx = 1,sy = 1,sz = 1,rx = 0,ry = 0,rz = 0){
gCube(sx,sy,sz,0,0,0,rx,ry,rz);
}

//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 4/07/2022
//Updated on: 5/21/2022
//Units: millimeters (.001)
//Notes: 
include  <Gilgahedron.scad>

union(){
voxelHedron(45);

triFill();
triFill(90);
triFill(180);
triFill(270);
triFill(0,90);
triFill(0,180);
triFill(0,270);
triFill(0,0,180);
triFill(0,90,180);
}
module triFill(rx=0,ry=0,rz=0){
pt = 29.1;
pv = 31.8;
CubePoints = [
  [ pt, pt,  0 ],  //0 - x,y
  [ pt,  0, pt ],  //1 - x,z
  [  0, pt, pt ],  //2 - y,z
  [ pv, pv,  0 ],  //3 - x,y
  [ pv,  0, pv ],  //4 - x,z
  [  0, pv, pv ]]; //5 - y,z
  
CubeFaces = [
  [2,1,0],  // inside
  [3,4,5],  // outside
  [1,2,5,4],  // top
  [0,3,5,2],  // rightFrOut
  [0,1,4,3]]; // leftFrOut
  
rotate([rx,ry,rz])
polyhedron( CubePoints, CubeFaces );
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

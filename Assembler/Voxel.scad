//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 4/07/2022
//Updated on: 5/21/2022
//Units: millimeters (.001)
//Notes: 
include  <Gilgahedron.scad>


voxelHedron(50);
module voxelHedron(s = 1){
sz = s*1.3;
sc = s*1.415;
sd = s*0.9;
se = s*1.45;
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

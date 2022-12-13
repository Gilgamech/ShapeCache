//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 4/07/2022
//Updated on: 5/21/2022
//Units: millimeters (.001)
//Notes: 
include  <Gilgahedron.scad>

rotate([0,90,0])
voxelHedron(50);
module voxelHedron(s = 1){
sz = s*1.3;
sc = s*1.415;
sd = s*0.9;
se = s*1.45;
difference(){
diamondHedron(s,sc);
diamondHedron(sd,se);
gCube(sz+5,sz,sz,2.5,0,0,45);
}}

module diamondHedron(sz = 1,le = (1.415)){
union(){
gCube(le,sz,sz,0,0,0,45);
}}

//Copyright 2022 Gilgamech Technologies
//Title: Examples
//Made by: Stephen Gillie
//Created on: 3/22/2022
//Updated on: 3/30/2022
//Units: inches? (0.0254)
//Notes: 

include  <Gilgahedron.scad>
include  <lib-gear-dh.scad>
include  <lib-worm-dh.scad>

roundedEdge();

//gears
module geardemo(){
// gear(teeth,thikness,scale);
gear(24,8,10);
translate([00,12,00])
gear(10,8,10);
}
module wormdemo(){
// worm(): same scaling as gears
translate([-6,18.75,00])
rotate([00,90,00])
worm(10);
}
//text extrude
module textEx(string,height){
linear_extrude(height)
    text(string);
}

//board stock
module roundedEdge(remoteWidth = 2,remoteLength = 10,remoteThickness = 1) {
intersection() {
    gCylinder(remoteLength,remoteWidth/2,remoteWidth/2);
    gCube(remoteThickness,remoteWidth,remoteLength);
}}


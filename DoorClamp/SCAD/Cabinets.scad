//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 4/07/2022
//Updated on: 4/07/2022
//Units: idk (idk) meters (1) inches (0.0254) cm (.01) millimeters (.001) feet (.3048)
//Notes: 

csg();
//icon_extrude("BigG.dxf",1,1,5);
//silo(150,40);

include  <Gilgahedron.scad>
//Basic Shapes
//gCube(xSize,ySize,zSize,xMove,yMove,zMove,xRotate,yRotate,zRotate);
//gCylinder(h,r1,r2,xMove,yMove,zMove,xRotate,yRotate,zRotate);
//gSphere(xScale,yScale,zScale,xMove,yMove,zMove,xRotate,yRotate,zRotate);

//Complex polyhedra
//pyramid();
//d4();
//d8();
//silo(height,diameter);

//Extrusion
//icon_extrude("BigG.dxf",height);
//icon_extrude(filename,height);
//inverse_icon_extrude(filename,height);
//text_extrude(text,height);

//shape demo
module csg(){
union() {
    gCube(15,15,15,-24);
    gSphere(10,10,10,-24);
}

intersection() {
    gCube(15,15,15,0,24);
    gSphere(10,10,10,0,24);
}

difference() {
    gCube(15,15,15,24);
    gSphere(10,10,10,24);
}
difference() {
    gSphere(10,10,10,0,-24);
    gCube(15,15,15,0,-24);
}}


//gear stock
include  <lib-gear-dh.scad>
include  <lib-worm-dh.scad>
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
//stick stock
module roundedEdge(remoteWidth = 2,remoteLength = 10,remoteThickness = 1) {
intersection() {
    gCylinder(remoteLength,remoteWidth/2,remoteWidth/2);
    gCube(remoteThickness,remoteWidth,remoteLength);
}}

//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 4/07/2022
//Updated on: 3/29/2023
//Units: idk (idk) meters (1) inches (0.0254) cm (.01) millimeters (.001) feet (.3048)
//Notes:
//Version History: 
include  <Gilgahedron.scad>

icon_extrude("BigG.dxf",1,1,5);

//Basic Shapes
//gCube(xSize,ySize,zSize,xMove,yMove,zMove,xRotate,yRotate,zRotate);
//gCylinder(height,bottomRadius,topRadius,xMove,yMove,zMove,xRotate,yRotate,zRotate);
//gSphere(xScale,yScale,zScale,xMove,yMove,zMove,xRotate,yRotate,zRotate);
//gOval(height,narrow,wide,xMove,yMove,zMove,xRotate,yRotate,zRotate);

//Complex polyhedra
//pyramid();
//d4();
//d8();
//silo(height,diameter);

//Extrusion
//icon_extrude("BigG.dxf",height);
//icon_extrude(filename,height);
//inverse_icon_extrude(filename,height);
//gText(text,xSize,ySize,zSize,xTrans,yTrans,zTrans,xRot,yRot,zRot)

//Bar Stock
//gTube(length,r1,r2,xTrans,yTrans,zTrans,xRot,yRot,zRot);
//roundedEdge(xSize,ySize,zSize,xTrans,yTrans,zTrans,xRot,yRot,zRot);

//Check if print will fit on printer
//checkPrint();

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

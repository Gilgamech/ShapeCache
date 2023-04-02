//Copyright 2023 Gilgamech Technologies
//Title: bracelets.scad v1.0
//Made by: Stephen Gillie
//Created on: 3/29/2023
//Updated on: 3/30/2023
//Units: millimeters (.001)
//Notes: 
//Version History:
//0.3 Add difference gCube to halve bracelet. 
//0.3.1 Move code into braceletHalf module.
//1.0 Add bPost module to create pin interface.
include  <Gilgahedron.scad>

module braceletHalf(height){
    difference() {
        gOval(height,75/2,65/2);
        gOval(100,65/2,55/2);
        gCube(200,100,100,0,50);
    }
}

module bPost(pins,pinHeight,pinWidth,height){
    difference() {
braceletHalf(height);
for (i=[0:1:pins]){
gCylinder(pinHeight,pinWidth*1.1,pinWidth*1.1,-35,0,(height/pins*i)-(height/2)+pinWidth*2+(pinWidth*4*(-i/pins)),90);
}
}
for (i=[0:1:pins]){
gCylinder(pinHeight,pinWidth,pinWidth,35,0,(height/pins*i)-(height/2)+pinWidth*2+(pinWidth*4*(-i/pins)),90);
}
}

bPost(4,7,2,60);

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
//Copyright 2023 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 6/06/2023
//Updated on: 6/06/2023
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
//icon_extrude(filename,xSize,ySize,zSize,xMove,yMove,zMove,xRotate,yRotate,zRotate);
//inverse_icon_extrude(filename,height);
//gText(text,xSize,ySize,zSize,xTrans,yTrans,zTrans,xRot,yRot,zRot)

//Bar Stock
//gTube(length,r1,r2,xTrans,yTrans,zTrans,xRot,yRot,zRot);
//roundedEdge(xSize,ySize,zSize,xTrans,yTrans,zTrans,xRot,yRot,zRot);

//gWorm(length,OD,pitch,oversizePct,xMove,yMove,zMove,xRotate,yRotate,zRotate);
//gIsoThread(OD,pitch,length,oversizePct,xMove,yMove,zMove,xRotate,yRotate,zRotate);
//gGear(scale,teeth,thickness,xMove,yMove,zMove,xRotate,yRotate,zRotate);


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


//Polyhedron demo
module polyCube(fr=0,bk=1,lf=0,rt=1,tp=0,bo=1){
CubePoints = [
  [ fr, lf, tp ], //0 - fr left top
  [ fr, rt, tp ], //1 - fr rt top
  [ bk, lf, tp ], //2 - back left top
  [ bk, rt, tp ], //3 - back rt top
  [ fr, lf, bo ], //4 - fr left bt
  [ fr, rt, bo ], //5 - fr rt bt
  [ bk, lf, bo ], //6 - back left bt
  [ bk, rt, bo ]  //7 - back rt bt
];
//Press F12 to troubleshoot inverted faces.
CubeFaces = [
  [0,1,3,2],  // top
  [4,5,7,6],  // bottom
  [0,1,5,4], // front
  [2,3,7,6], // back
  [0,4,6,2],  // left
  [1,5,7,3]  // right
];
polyhedron( CubePoints, CubeFaces );
}

//Copyright 2023 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 3/29/2023
//Updated on: 3/29/2023
//Units: idk (idk) meters (1) inches (0.0254) cm (.01) millimeters (.001) feet (.3048)
//Notes:
//Version History: 
include  <Gilgahedron.scad>
include  <baseBracelet.scad>

module ballBracelet(S = 75,xLoc = -50,yLoc = 0){
gSphere(S,S,S,20,-25);
baseBracelet(65,75,60,xLoc,yLoc,0,90,0,90);
baseBracelet(65,75,60,xLoc,yLoc,0,90,180,90);
}

halfBallBracelet(1);
halfBallBracelet();

module halfBallBracelet(zHalf=-1,zAdj=10) {
translate([0,0,zAdj*zHalf*-1])
difference() {
ballBracelet(70);
polyCube();
difference() {
gCube(200,200,100,0,0,50*zHalf);
}
}
}




module polyCube(x = 105,y = 105,z = 90,w1 = 55,w2 = 65){
i3x = x/2;
i3y = -y/2;
i3z = z/2;

wx = -y/2;
//y
wlf = w2/2;
wrt = -w2/2;
wyc = (35-25)/2;
//z
wtp = w1/2;
wbo = -w1/2;
wzc = (25-35)/2;

CubePoints = [
    [ i3x-2, i3y-2, -i3z], //0 - I2 Index
    [ i3x-2, i3y, i3z], //1 - I3
    [ i3x-1, i3y+18, -i3z], //2 - M2 Middle
    [ i3x-1, i3y+20, i3z+1], //3 - M3
    [ i3x-2, i3y+38, -i3z], //4 - R2 Ring
    [ i3x-2, i3y+40, i3z], //5 - R3
    [ i3x-4, i3y+58, -i3z], //6 - P2 
    [ i3x-4, i3y+60, i3z-1], //7 - P3
    [ i3x-20, i3y+80, i3z-40], //8 - Pb bulge
    [ i3x-12, i3y+38, -i3z-10], //9 - Tt Thumb tip
    [ i3x-22, i3y+13, -i3z], //10 - T1
    [ i3x-12, i3y-22, -i3z], //11 - T2
    [ wx, wyc, wtp ], //12 - WTC
    [ wx, wlf/1.5, wtp/1.5 ], //13 - WTL
    [ wx, wlf, wzc ], //14 - WCL
    [ wx, wlf/1.5, wbo/1.5 ], //15 - WBL
    [ wx, wyc, wbo ], //16 - WBC
    [ wx, wrt/1.5, wbo/1.5 ], //17 - WBR
    [ wx, wrt, wzc ], //18 - WCR
    [ wx, wrt/1.5, wtp/1.5 ],  //19 - WTR
    [ i3x+17, i3y+58, -i3z] //20 - P1 Pinky
];
CubeFaces = [
  [7,14,8],    //BOHPBulge - P3,WTL,Pb
  [7,12,13,14],//BOHPinky - P3,WTC,WTL,WCL
  [7,5,3,1,12],//BOHMain - P3, R3, M3, I3, WTC
  [18,19,12,1],//BOHIndex - I3,WTC,WTR,WCR
  [11,18,1],  //ThumbPlate - I3,WCR,T2
  [1,0,11],   //IndexCurl - T2,I2,I3
  [3,2,0,1],  //IndexMid - M3,M2,I2,I3
  [5,4,2,3],  //MidRing - R3,R2,M2,M3
  [7,6,4,5],  //RingPinky - P3,P2,R2,R3
  [8,6,7],  //PinkyBulge - Pb,P2,P3
  [16,17,18,11], //UHThumb - WBC,WBR,WCR,T2
  [11,10,9,6,16],//UHPalm - T2,T1,Tt,P2,WBC
  [15,16,6],//UHPinky - WBL,WBC,P2
  [14,15,6,8],//UHPBulge - WCL,WBL,P2,Pb
  [0,10,11],  //UHIndexT2T1 - I2,T1,T2
  [10,0,2,9],//UHIndexT1 - T1,I2,Tt,M2
  [2,4,6,9],   //UHIndexTt - Tt,P2,R2,M2
  [19,18,17,16,15,14,13,12]
  //Wrist - WTR,WCR,WBR,WBC,WBL,WCL,WTL,WTC
];
/*Points:
WristTp, Mid1st, Mid2nd, Thm2nd, Thm1st, WristBt
WristLf, PnkBlg, Pnk2nd, Ring1st, IndexFn, Th2nd, WristRt
Index1st, Ring1st, Pnk1st, PnkBlg, Pnk2nd, Thm2nd, Thm1st, Index1st
*/

polyhedron( CubePoints, CubeFaces );
}

module roundedCube(width,length,height,fillet){
fillPct = ((1+((9-fillet)/10))/3);

intersection(){
    gCube(width,length,height);
    gCylinder(height,length*fillPct,length*fillPct);
    gCylinder(height,length*fillPct,length*fillPct,0,0,0,90);
    gCylinder(height,length*fillPct,length*fillPct,0,0,0,0,90);
}
}
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

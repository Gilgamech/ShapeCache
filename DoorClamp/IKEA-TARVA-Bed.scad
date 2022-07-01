    
//Copyright 2022 Gilgamech Technologies
//Title: IKEA RAST 3 drawer dresser
//Made by: Stephen Gillie
//Created on: 3/29/2022
//Updated on: 4/4/2022
//Units: cm (.01)
//Notes: 

include  <Gilgahedron.scad>

width=160;
depth=209;
height=92;
legLength=16;
legThick = 4;

//feet(-height/2+legLength);
//frameSupportZ=-height/2+legLength;
//frameSupportY=(depth/2)-legThick/2;
//angleSupport();
//angleSupport(0,1);
//angleSupport(1,0);
//angleSupport(0,0,180);
//backBoard();
mattress(width,depth,12);

module mattress(xSize=36,ySize=36,zSize=2,xTrans=0,yTrans=0,zTrans=0,xRot=0,yRot=0,zRot=0){
translate([xTrans,yTrans,zTrans])
rotate([xRot,yRot,zRot])
union(){
cubeSF=1.25;
gCube(xSize/cubeSF,ySize,zSize);
gCube(xSize,ySize/cubeSF,zSize);

cylSF=cubeSF*2;
cr=xSize/10;
cx=xSize/cylSF+.5;
cy=ySize/cylSF+5;
gCylinder(zSize,cr,cr,cx,cy);
gCylinder(zSize,cr,cr,-cx,cy);
gCylinder(zSize,cr,cr,cx,-cy);
gCylinder(zSize,cr,cr,-cx,-cy);
}}

module backBoard(){
bottomSpacing=7;
gCube(width+legThick,legThick,legThick
    ,0,frameSupportY,height/2-legThick);//Top span
gCube(legThick,legThick,height-legLength,
    0,frameSupportY,legThick);//Center span
backBoardRib(frameSupportY,0);
backBoardRib(frameSupportY,0,1);
backBoardRib(frameSupportY,1);
backBoardRib(frameSupportY,1,1);
backBoardRib(frameSupportY,2);
backBoardRib(frameSupportY,2,1);
backBoardRib(frameSupportY,3);
backBoardRib(frameSupportY,3,1);
}

module backBoardRib(y=frameSupportY,z=0,mir=0){
mirror([mir,0,0])
gCube(width/2-legThick,legThick,legThick,
    width/4,y,(z-1)*height/2/3);//side
}
module feet(z=0){
//Units: feet
//ScaleFactor: 
topSize = 3;
legLocW = width/2-legThick/2;
legLocD = depth/2-legThick/2;
legLocH = height/2;

union() {
//tableLegs
gCube(legThick,legThick,height,
    legLocW*1,legLocD*1,z-5+height/2-legLength);//headRight
gCube(legThick,legThick,legLength+legThick,
    legLocW*1,legLocD*-1,z-5);//footRight
gCube(legThick,legThick,height,
    legLocW*-1,legLocD*1,z-5+height/2-legLength);//headLeft
gCube(legThick,legThick,legLength+legThick,
    legLocW*-1,legLocD*-1,z-5);//footLeft

//tableSupports
supportWidth = 1.5;
supportHeight = height/10;    
gCube(supportWidth,depth-legThick,supportHeight,
    legLocW*1,0,(legLength/2)-supportHeight+.1+z);
gCube(width-legThick,supportWidth,supportHeight,0,
    legLocD*1,(legLength/2)-supportHeight+.1+z);
gCube(supportWidth,depth-legThick,supportHeight,
    legLocW*-1,0,(legLength/2)-supportHeight+.1+z);
gCube(width-legThick,supportWidth,supportHeight,0,
    legLocD*-1,(legLength/2)-supportHeight+.1+z);

gCube(legThick,depth-legThick,legThick,
    0,0,frameSupportZ);//centerSupport;
gCube(legThick,depth-legThick,legThick,
    width/2-legThick,0,frameSupportZ);//rightSupport;
gCube(legThick,depth-legThick,legThick,
    -width/2+legThick,0,frameSupportZ);//leftSupport;
}}

module angleSupport(x=0,y=0,rot=0){
rotate([0,0,rot])
mirror([x,y,0])
gCube(legThick,height,legThick
    ,45,70,frameSupportZ
    ,0,0,45);
}
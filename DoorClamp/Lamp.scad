//Copyright 2022 Gilgamech Technologies
//Title: Wall hanging lamp
//Made by: Stephen Gillie
//Created on: 3/19/2022
//Updated on: 3/30/2022
//Units: inches (0.0254)
//Notes: cTL = center Tube Length

include  <Gilgahedron.scad>

cTL = 6;
halfCTL = cTL/2;//3
thirdCTL = cTL/3;//2
centerTubeDiameter = cTL/4;//1.5
supportTubeDiameter = cTL/(cTL/2);//2
doubleCTL = cTL*2;//12

//wallLampA();
//wallLampB();
wallLampBigG();

module wallLampA(){
union(){
    gCylinder(cTL,centerTubeDiameter/2,centerTubeDiameter/2);//centerTube
    supportTube(cTL/3);
    supportTube(cTL/10);
    wallBoxA();
    lampSupport();
    lampShade(halfCTL);
    lampShadeHolder(0);
    lampShadeHolder(120);
    lampShadeHolder(240);
    lightSupport();
}}
module wallLampB(){
union(){
    gCylinder(cTL,centerTubeDiameter/2,centerTubeDiameter/2);//centerTube
    supportTube(cTL/2.8);
    supportTube(cTL/8);
    wallBoxB();
    lampSupport();
    lampShade(halfCTL,12,6,6);
    lampShadeHolder(0,cTL*1);
    lampShadeHolder(120,cTL*1);
    lampShadeHolder(240,cTL*1);
    lightSupport();
}}

module wallLampBigG(){
union(){
    gCylinder(cTL,centerTubeDiameter/2,centerTubeDiameter/2);//centerTube
    supportTube(cTL/2.8);
    supportTube(cTL/8);
    wallBoxBigG();
    lampSupport();
    lampShade(halfCTL+.5,12,6,6);
    lampShadeHolder(0,cTL*1);
    lampShadeHolder(120,cTL*1);
    lampShadeHolder(240,cTL*1);
    lightSupport();
}}

//mods
module supportTube(z,Adj=4) {
gCylinder(
          cTL,
          centerTubeDiameter/(Adj*2),
          centerTubeDiameter/(Adj*2),
          cTL/Adj+1,0,-z,
          0,90,0);
}
module wallBoxA(z=-cTL/2,Adj=3) {
gCube(cTL/(Adj*2),cTL/(Adj/2),cTL,cTL,0,z);
}
module wallBoxB(z=-cTL/2,Adj=3) {
gCylinder(cTL/(Adj*2),cTL/Adj+1,cTL/Adj+1,
    cTL,0,z+Adj/2-.5,
    0,90);
gCylinder(
          cTL/2,
          centerTubeDiameter/(Adj*2),
          centerTubeDiameter/(Adj*2),
          (cTL/Adj*2)+1.31,0,z/2,
          0,0,0);
}
module wallBoxBigG(z=-cTL/2,Adj=3) {
translate([cTL,0,z+Adj/2-.5])
icon_extrude("bigG.dxf",
         .25,.25,1,
         0,0,0,
         90,0,-90);
gCylinder(
          cTL,
          centerTubeDiameter/(Adj*2),
          centerTubeDiameter/(Adj*2),
          (cTL/Adj*2)+1.31,0,z/2,
          0,0,0);
}
module lampShade(z=0,height=12,topDia=7,botDia=8) {
difference() {
//outside cone
gCylinder(
    height,
    botDia,
    topDia,
    0,0,z+height/2);
//inner hollow cone
gCylinder(
    height+.2,
    botDia*.95,
    topDia*.95,
    0,0,z+height/2);
}}
module lampSupport() {
z=cTL*1.32;//7.85
radius=cTL/3;//2
//zScale=2.55;//12
//zScale = 2.68;//6
//zScale = 2.85;//3
zScale = 5;//3

difference() {
//Sphere(xScale=1,yScale=1,zScale=1,xMove=0,yMove=0,zMove=0,xRotate=0,yRotate=0,zRotate=0)
gSphere(1,2,zScale,0,0,z);
gSphere(3,1.8,zScale*.99,0,0,z);
}
}

module lampShadeHolder(zRotate,len=cTL*1.2) {
rotate([74,0,zRotate]){
gCylinder(
    len,.1,.1,
    0,12.35,6.5);
}}
module lightSupport() {
gCylinder(
    cTL*.2,
    centerTubeDiameter/3,
    centerTubeDiameter/3,
    0,0,halfCTL);
}


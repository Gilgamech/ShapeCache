
//Copyright 2022 Gilgamech Technologies
//Title: IKEA RAST 3 drawer dresser
//Made by: Stephen Gillie
//Created on: 3/29/2022
//Updated on: 3/30/2022
//Units: cm (.01)
//Notes: 

include  <Gilgahedron.scad>

width=48;
depth=39;
height=62;
drawerWidth=width-5;
drawerDepth=depth-5;
drawerHeight=15;
legLength=16;

union(){
//smallDresser();
//feet(-17.5);
}
union(){
drawer();
handle();
}

module smallDresser(){
bottomSpacing=7;
difference(){
gCube(width,depth,height);//main body
gCube(drawerWidth+2,drawerDepth*2,drawerHeight+2,0,0,20);//upper space
gCube(drawerWidth+2,drawerDepth+2,drawerHeight+2,0,5,0);//drawer space
gCube(drawerWidth*2,drawerDepth*2,drawerHeight+10,0,0,-25);//space for feet
}}

module drawer(x=0,y=0,z=0){
difference(){
gCube(drawerWidth,drawerDepth,drawerHeight,x,y,z);
gCube(drawerWidth-1,drawerDepth-1,drawerHeight-1,x,y,z+1);
}}

module handle(x=0,y=0,z=0){
gCylinder(2,1,1,drawerWidth/3,drawerDepth/2+.8,z,90);
gCylinder(2,1,1,-drawerWidth/3,drawerDepth/2+.8,z,90);
//bigG x,y,z offset, to bring it back to 0,0,0 after rotation.
gzScale=.4;
scale([gzScale,gzScale,gzScale]){
icon_extrude("bigG.dxf",gzScale,gzScale,gzScale,drawerWidth/3/gzScale,drawerDepth/2/gzScale+4,z/gzScale,-90,180);
icon_extrude("bigG.dxf",gzScale,gzScale,gzScale,-drawerWidth/3/gzScale,drawerDepth/2/gzScale+4,z/gzScale,-90,180);
}}

module feet(z=0){
//Units: feet
//ScaleFactor: 
topSize = 3;
legThick = 4;
legLocW = width/2-legThick/2;
legLocD = depth/2-legThick/2;
legLocH = height/2;

union() {
//tableLegs
gCube(legThick,legThick,legLength+legThick,
    legLocW*1,legLocD*1,z-5);
gCube(legThick,legThick,legLength+legThick,
    legLocW*1,legLocD*-1,z-5);
gCube(legThick,legThick,legLength+legThick,
    legLocW*-1,legLocD*1,z-5);
gCube(legThick,legThick,legLength+legThick,
    legLocW*-1,legLocD*-1,z-5);

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
}}

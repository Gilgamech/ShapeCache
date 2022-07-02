//Copyright 2022 Gilgamech Technologies
//Title: IKEA RAST 3 drawer dresser
//Made by: Stephen Gillie
//Created on: 3/29/2022
//Updated on: 3/30/2022
//Units: cm (.01)
//Notes: 

include  <Gilgahedron.scad>

width=62;
depth=30;
height=68;
drawerWidth=55;
drawerDepth=25;
drawerHeight=13;

//smallDresser();
//drawer();
drawer(0);
//drawer(-20);

module smallDresser(){
bottomSpacing=7;
difference(){
gCube(width,depth,height);
gCube(drawerWidth+2,drawerDepth+2,drawerHeight+2,0,5,20);
gCube(drawerWidth+2,drawerDepth+2,drawerHeight+2,0,5,0);
gCube(drawerWidth+2,drawerDepth+2,drawerHeight+2,0,5,-20);

}}

module drawer(z=20){
difference(){
gCube(drawerWidth,drawerDepth,drawerHeight,0,0,z);
gCube(drawerWidth-1,drawerDepth-1,drawerHeight-1,0,0,z+1);
}
gCylinder(2,1,1,drawerWidth/3,drawerDepth/2+1,z,90);
gCylinder(2,1,1,-drawerWidth/3,drawerDepth/2+1,z,90);
gzScale=.35;
scale([gzScale,gzScale,gzScale]){
icon_extrude("bigG.dxf",gzScale,gzScale,gzScale,drawerWidth/3/gzScale,drawerDepth/2/gzScale+6,z/gzScale,-90,180);
icon_extrude("bigG.dxf",gzScale,gzScale,gzScale,-drawerWidth/3/gzScale,drawerDepth/2/gzScale+6,z/gzScale,-90,180);
}}


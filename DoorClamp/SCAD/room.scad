//Copyright 2022 Gilgamech Technologies
//Title: Square room with door
//Made by: Stephen Gillie
//Created on: 3/16/2022
//Updated on: 3/25/2022
//Units: inches (0.0254)
//Notes: Designed as 20 x 20 x 6 ft, but should be fully adjustable.
include  <Gilgahedron.scad>

xDim = 8*12;//96
yDim = 14*12;//168
zDim = 8*12;//96

room(xDim,yDim,zDim);
//object(8*12,14*12,8*12);

module object(xSize=0,ySize=240,zSize=96,doorGap=-5,zRotate=0){
difference(){
    justSide(0,xSize,zSize,90);//front
    gCube(ySize/2,zSize,zSize/1.2,0,0,doorGap);
}}//right


module justSide(xLoc,ySize,zSize,zRotate){
rotate([0,0,zRotate])
gCube(.1,ySize,zSize,xLoc/2,0,0);
}
module room(xSize=240,ySize=240,zSize=96,doorGap=-5,zRotate=0){
difference(){
    justSide(xSize,ySize,zSize,zRotate);
    gCube(zSize/2,zSize/2,zSize/1.2,xSize/2,zSize/4,doorGap);
}//right
difference(){
    justSide(-xSize,ySize,zSize,zRotate);
    gCube(zSize/2,zSize/2,zSize/1.2,-xSize/2,zSize/4,doorGap);
}//left
justSide(ySize,xSize,zSize,90);//front
difference(){
    justSide(ySize,xSize,zSize,270);
    gCube(ySize/2,zSize,zSize/1.2,0,-ySize/2,doorGap);
}//rear

//gCube(xSize,ySize,.1,0,0,zSize/2);//ceiling
gCube(xSize,ySize,.1,0,0,-zSize/2);//floor
}


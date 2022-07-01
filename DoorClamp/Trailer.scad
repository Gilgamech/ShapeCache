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

//room(xDim,yDim,zDim);
//sinkDWCabinet();
longCabinet();


xCabSize=30;
yCabSize=52;
zCabSize=36;

xCabLoc = -xDim/2+xCabSize/2;//-63
yCabLoc = -yDim/2+yCabSize/2;//-124
zCabLoc = -zDim/2+zCabSize;//-12

module sinkDWCabinet(){
yDwAdj=28;
gCube(xCabSize,yCabSize+yDwAdj,1,xCabLoc,yCabLoc+yDwAdj/2,zCabLoc);//countertop
cabinet(xCabSize,yCabSize,zCabSize,
    xCabLoc,yCabLoc+yDwAdj,zCabLoc,.5-yDwAdj*2);//needs sink
}

module longCabinet(){
yCabLoc2=yCabSize;
rotate([0,0,180]){
gCube(xCabSize,yDim/2,1,xCabLoc,yDim/4,zCabLoc);//countertop
cabinet(xCabSize,34,zCabSize,
    xCabLoc,17,zCabLoc);//mid
cabinet(xCabSize,yCabSize,zCabSize,
    xCabLoc,-yCabLoc,zCabLoc);//right
}}

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

module cabinet(xSize=24,ySize=96,zSize=30,xLoc=0,yLoc=0,zLoc=30){

zToeKick=5.5;

gCube(xSize,1,zSize-zToeKick,xLoc,yLoc+ySize/2-.5,zLoc-zSize/2+zToeKick/2);//right side
gCube(xSize,1,zSize-zToeKick,xLoc,yLoc-ySize/2+.5,zLoc-zSize/2+zToeKick/2);//left side
gCube(xSize,ySize,zToeKick,
    xLoc,yLoc,zLoc-zSize+zToeKick/2);//toeKick


xCabFront=-xCabSize/2-3.5;//-15
yCabFront=yLoc;
zCabFront=zCabLoc-15;//69
yDoorSize=ySize/2-1.5;
yDoorAdjust=yDoorSize/2+.5;

gCube(1,yDoorSize,zSize-zToeKick,
    xCabFront+1,yCabFront-yDoorAdjust,zLoc-zSize/2+zToeKick/2);//door
gCube(1,yDoorSize,zSize-zToeKick,
    xCabFront+1,yCabFront+yDoorAdjust,zLoc-zSize/2+zToeKick/2);//other door

gCube(1,yDoorSize*2+1,2,
    xCabFront,yCabFront,zCabFront-zSize/2+2);//front top
gCube(1,yDoorSize*2+1,2,
    xCabFront,yCabFront,zCabFront+zSize/2-4);//front bot

gCube(1,2,zSize-zToeKick,
    xCabFront,yCabFront+yDoorSize,zLoc-zSize/2+zToeKick/2);//front left
gCube(1,2,zSize-zToeKick,
    xCabFront,yCabFront,zLoc-zSize/2+zToeKick/2);//front mid
gCube(1,2,zSize-zToeKick,
    xCabFront,yCabFront-yDoorSize,zLoc-zSize/2+zToeKick/2);//front right

}

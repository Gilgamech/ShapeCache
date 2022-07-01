//Copyright 2022 Gilgamech Technologies
//Title: Modular
//Made by: Stephen Gillie
//Created on: 4/09/2022
//Updated on: 4/09/2022
//Units: millimeters (.001)
//Notes: Collection of modular blocks
    
include  <Gilgahedron.scad>

modularSquare(89);

cylZlocA = 2;
cylZlocB = .7;

module modularSquare(sqLength=120){
thick=1;
cylLen=sqLength/12;
cylRad=sqLength/5-1;
xLoc=sqLength/2+cylLen/2;

difference(){
union(){
    gCube(sqLength,thick,sqLength);//center
    modularEdge(0,sqLength,cylRad,xLoc,cylLen);
    modularEdge(90,sqLength,cylRad,xLoc,cylLen);
    modularEdge(180,sqLength,cylRad,xLoc,cylLen);
    modularEdge(270,sqLength,cylRad,xLoc,cylLen);
}
    connectionGap(sqLength-cylLen+1,cylRad,0,xLoc+1,cylLen);
    connectionGap(sqLength-cylLen+1,cylRad,90,xLoc+1,cylLen);
    connectionGap(sqLength-cylLen+1,cylRad,180,xLoc+1,cylLen);
    connectionGap(sqLength-cylLen+1,cylRad,270,xLoc+1,cylLen);
}}
module modularEdge(yRot=0,sqLength=120,cylRad=23,xLoc=70,cylLen=20){
    edge(sqLength,yRot,cylRad);
    connectionCylinder(sqLength,cylRad-1,yRot,xLoc,cylLen);
}

module edge(sqLength=10,yRot=0,cylRad=23){
    pSize = cylRad*1.05;
    pHalf = pSize/2;
    edgeLoc = sqLength/2;

    points=[
    [0,-pHalf],
    [pHalf,-pHalf],
    [pSize,0],
    [pHalf,pHalf],
    [0,pHalf]
    ];

    rotate([0,yRot,0])
    translate([-edgeLoc,0,-edgeLoc])
    linear_extrude(sqLength)
    polygon(points);

}

module connectionCylinder(sqLength=10,radius=.48,yRot=0,xLoc=70,cylLen=20){
    rotate([0,yRot,0]){
    gCylinder(cylLen-.5+5,radius/2,radius/2,
        xLoc,0,radius*cylZlocA,
        0,90);
    gCylinder(cylLen-.5+5,radius/2,radius/2,
        xLoc,0,radius*cylZlocB,
        0,90);
}}
module connectionGap(sqLength=10,radius=.48,yRot=0,xLoc=70,cylLen=20){
depth = 20;
    rotate([0,yRot,0]){
    gCube(radius,radius,cylLen+depth-14,
        -xLoc+sqLength/12,0,radius*cylZlocA,
        0,90);
    gCube(radius,radius,cylLen+depth-14,
        -xLoc+sqLength/12,0,radius*cylZlocB,
        0,90);
        
    gCylinder(cylLen-.5+depth,radius/2-1,radius/2-1,
        xLoc,0,radius*cylZlocA-2,
        0,90);
    gCylinder(cylLen-.5+depth,radius/2-1,radius/2-1,
        xLoc,0,radius*cylZlocB-1,
        0,90);

}}

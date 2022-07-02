//Copyright 2022 Gilgamech Technologies
//Title: Remote Control
//Made by: Stephen Gillie
//Created on: 3/16/2022
//Updated on: 3/30/2022
//Units: inches (0.0254)
//Notes: 

include  <Gilgahedron.scad>

remoteWidth = 2;
remoteLength = remoteWidth*5;
remoteThickness = remoteWidth/2;

edgeButton = .35;
centerishButton = .117;

difference() {
    stick();
    gap();
}
//roundButton(radius,sideways,height)
roundButton(.15,.3,2.25); //power
roundButton(.09,-.3,2.2); //menu

//first row
roundButtonRow(.09,1.9);

//tenkey
fullTenKey(1.6,.3,.25);

//big side buttons
rectangleButton(.35,0,.25,.8);
rectangleButton(-.35,0,.25,.8);
//smaller inside buttons
rectangleButton(0,.3,.25,.15);
rectangleButton(0,0,.25,.15);
rectangleButton(0,-.3,.25,.15);

//big rectangle button
rectangleButton(0,-1,.9,.9);

//lower set
rectangleButton(edgeButton,-1.6,.2,.1);
rectangleButton(centerishButton,-1.6,.2,.1);
rectangleButton(-centerishButton,-1.6,.2,.1);
rectangleButton(-edgeButton,-1.6,.2,.1);

//lower tenkey
rectangularTenKey(-1.8,.15,.1);


module stick() {
intersection() {
    gCylinder(remoteLength,remoteWidth,remoteWidth*.9,0,remoteWidth*.75,0);
    gCube(remoteWidth,remoteThickness,remoteLength);
}}

module gap() {
    gCylinder(remoteWidth*2.5,.2*remoteWidth,.2*remoteWidth,
    0,-(remoteWidth/4),remoteWidth/2,
    0,90,0);
}

module roundButton(r,x,z) {
    gCylinder(remoteWidth*.2,r*remoteWidth,r*remoteWidth,x*remoteWidth,.25*remoteWidth,remoteWidth*z,90,0,0);
}
module squareButton(x,z,thickness) {
    gCube(remoteWidth*thickness,remoteWidth*thickness,remoteWidth*thickness,x*remoteWidth,thickness*remoteWidth,remoteWidth*z,90,0,0);
}
module rectangleButton(locx,locz,widthx,heightz) {
    gCube(remoteWidth*widthx,remoteWidth*heightz,remoteWidth*.25,locx*remoteWidth,.25*remoteWidth,remoteWidth*locz,90,0,0);
}
module roundButtonRow(r,z) {
    roundButton(r,edgeButton,z);
    roundButton(r,centerishButton,z);
    roundButton(r,-centerishButton,z);
    roundButton(r,-edgeButton,z);
}
module tenkeyRow(z,height) {
    squareButton(edgeButton,z,height);
    squareButton(0,z,height);
    squareButton(-edgeButton,z,height);
}
module tenkeyRec(z,height) {
    rectangleButton(edgeButton,z,.25,height);
    rectangleButton(0,z,.25,height);
    rectangleButton(-edgeButton,z,.25,height);
}
module lowerButtonRow(z) {
    squareButton(edgeButton,z,thickness);
    squareButton(centerishButton,z,thickness);
    squareButton(-centerishButton,z,thickness);
    squareButton(-edgeButton,z,thickness);
}
module fullTenKey(x,adj,height) {
    tenkeyRow(x,height);
    tenkeyRow(x-adj,height);
    tenkeyRow(x-(adj*2),height);
    tenkeyRow(x-(adj*3),height);
}
module rectangularTenKey(x,adj,height) {
    tenkeyRec(x,height);
    tenkeyRec(x-adj,height);
    tenkeyRec(x-(adj*2),height);
    tenkeyRec(x-(adj*3),height);
}

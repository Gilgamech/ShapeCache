//Copyright 2022 Gilgamech Technologies
//Title: Object cache
//Made by: Stephen Gillie
//Created on: 3/29/2022
//Updated on: 3/31/2022
//Units: millimeters (0.001)
//Notes: Simple items (upper) are a single geometric shape. Complex items (lower) are composite from several geometric shapes.

include  <Gilgahedron.scad>

//simple
//gCube(79,129,68);//tea box
//gCube(250,200,40);//tv dinner box
//gCube(160,70,9);//phone (needs rounded corners)
//gCube(215.9,279.4,.06);//paper_8P5X11_flat

module showerHead(){
}
module showerKnobs(){
}
module showerDrain(){
}
module iBeam(){//bar stock
}

bathroomSinkCounter();
//complex
module smallBottle(height=80,diameter=33){
gCylinder(21,23,22,0,0,height);//neck
gCylinder(24,23,22,0,0,height+2);//lid
silo(height,diameter);//bottle
}
module tissueBox(){
difference(){
gCube(190,115,50);
gSphere(80,20,1,0,0,25);
}}

module toiletPaperRoll(height=107){
difference(){
gCylinder(height,110,110);
gCylinder(height+.1,45,45);
}}
module vapePen(bLen=97){
//cartridge
cWid=10;
cLen=58;
gCylinder(cLen,cWid,cWid,0,0,cLen/2);

//batt
bWid=11;
gCylinder(bLen,bWid,bWid,0,0,-bLen/2);

intersection(){
icon_extrude("bigG.dxf",.35,.35,8,0,-10,-15,90,0);
gCylinder(bLen,bWid+1,bWid+1,0,0,-bLen/2);
}}



//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 9/28/2022
//Updated on: 9/28/2022
//Units: millimeters (.001)
//Notes: 
ratio=.75;
eyeSize = 8;
eyeHeight = 40;

ghost();
module ghost(){
scale([ratio,ratio,ratio]){
difference() {
ghostCylinder();//Shell

//Hollow core
hollowCore();
    
gCylinder(100,20,20,0,0,-35,90);//X sheet drape
gCylinder(100,20,20,0,0,-35,0,90);//Y sheet drape
gCylinder(50,eyeSize,eyeSize,10,25,eyeHeight,90);//left eye
gCylinder(50,eyeSize,eyeSize,-10,25,eyeHeight,90);//right eye
scale([2,1,.8])
gCylinder(50,10,10,0,25,eyeHeight-20,90);//mouth

}
handSize = 10;
handDist = 45;

gSphere(handSize,handSize,handSize,handDist);//left hand
gSphere(handSize,handSize,handSize,-handDist,0,15);//right hand
textBubble("BOO!",45,45,5,-handDist-25,0,15,90);
}
}
module ghostCylinder(zTrans=0,yMult=1.15){
translate([0,0,zTrans]) {
silo(75,35);
gCylinder(75,35*yMult,35);
}
}
module hollowCore(){
height = 125;
centerBase = 33;
gCylinder(height*.25,centerBase,1,0,0,height/2-10);
gCylinder(height*.75,centerBase*1.15,centerBase,0,0,-10);
}
module textBubble(text,xSize=10,ySize=10,zSize=10,xTrans=0,yTrans=0,zTrans=0,xRot=0,yRot=0,zRot=0){
//difference(){
textSize = .25;
roundedEdge(xSize,ySize,zSize,xTrans,yTrans,zTrans,xRot,yRot,zRot);
gText(text,xSize*textSize,ySize*textSize,zSize+100,xTrans+16,-yTrans,zTrans-5,xRot,yRot,zRot+180);
//}
}


include  <Gilgahedron.scad>
//Basic Shapes
//gCube(xSize,ySize,zSize,xMove,yMove,zMove,xRotate,yRotate,zRotate);
//gCylinder(h,r1,r2,xMove,yMove,zMove,xRotate,yRotate,zRotate);
//gSphere(xScale,yScale,zScale,xMove,yMove,zMove,xRotate,yRotate,zRotate);

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

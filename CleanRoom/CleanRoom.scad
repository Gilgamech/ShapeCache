//Copyright 2022 Gilgamech Technologies
//Title: Enigma base section
//Made by: Stephen Gillie
//Created on: 3/23/2022
//Updated on: 3/23/2022
//Units: millimeters
//scaleFactor: 0.001
//Notes: 

include  <Gilgahedron.scad>

//gCube(.914,7.620,.013);//dirtyWalkway
//gCube(3.667,7.620,.013);//craneSockArea1
//gCube(3.658,3.883,.013);//craneSockArea2
//gCube(5.004,7.62,.013);//rightMainArea
//gCube(2.001,7.62,.013);//leftMainArea
//largeTube();
doubleCylinder();

module largeTube(){
height=5;
width=1.25;
gCylinder(height,width,width,0,height/2,0,90);
gCylinder(height+2,width*.8,width*.8,0,(height+2)/2,0,90);
}
module doubleCylinder(xTran=0,yTran=0,zTran=0,length=2.667){
height=5;
width=1.25;
gCylinder(length,width,width,xTran,yTran,zTran,0,90);
gCylinder(length*0.9373,width*.8,width*.8,xTran,yTran,zTran,90);
}

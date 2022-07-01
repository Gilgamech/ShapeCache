//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 3/31/2022
//Updated on: 3/31/2022
//Units: idk (idk) meters (1) inches (0.0254) cm (.01) millimeters (.001) feet (.3048)
//Notes: 

include  <Gilgahedron.scad>

    xSize=8.75;
    ySize=30;
    zSize=3;

//zipperHandleBody();

difference(){
bigG();
gCube(xSize,ySize,zSize+1,0,2);
}

module bigG(){
icon_extrude("BigG.dxf",.75,.75,6);
}
module zipperHandleBody() {
    zeroVar=0;
    bodyYSize=20.5;
    angleYSize=10+bodyYSize;
    planeZSize=4;
    planeZeroSize=planeZSize-2;
    highPoint=2.8;

Points = [
//head
  [ zeroVar,  zeroVar,  zeroVar ],  //0 - origin
  [ zeroVar,  zeroVar,  zSize/2 ],  //1 - up
  [ xSize/2,  zeroVar,  zSize ],  //2 - high point
  [ xSize,  zeroVar,  zSize/2 ],  //3 - up2
  [ xSize,  zeroVar,  zeroVar ],  //4 - origin2

  [ zeroVar,  bodyYSize,  zeroVar ],  //5 - rOrgin
  [ zeroVar,  bodyYSize,  zSize/2 ],  //6 rUP
  [ xSize/2,  bodyYSize,  zSize ],  //7 rMid
  [ xSize,  bodyYSize,  zSize/2 ],  //8 rUp2
  [ xSize,  bodyYSize,  zeroVar ],  //9 rOrigin2

//angle    
  
  [ zeroVar,  angleYSize,  planeZeroSize ],  //10 aOrigin
  [ zeroVar,  angleYSize-.45,  planeZSize ],  //11 aUp
  [ xSize/2,  ySize-4,  planeZSize ],  //12 aMid
  [ xSize,  angleYSize-.45,  planeZSize ],  //13 aUp2
  [ xSize,  angleYSize,  planeZeroSize ]];  //14 aOrigin2
//pointNames
sO = 0;
sUP = 1;
sMid = 2;
sUP2 = 3;
sO2 = 4;

mO = 5;
mUP = 6;
mMid = 7;
mUP2 = 8;
mO2 = 9;

aO = 10;
aUP = 11;
aMid = 12;
aUP2 = 13;
aO2 = 14;

bodyFaces = [
  [sO,sUP,sMid,sUP2,sO2],  // head
  [sO,sO2,mO2,mO],  // front
  [sO,sUP,mUP,mO],  // right - origin side
  [sUP2,sO2,mO2,mUP2], // left - O2 side
  [sMid,sUP,mUP,mMid],  // back right
  [sMid,sUP2,mUP2,mMid], // back left
  
  [aO,aUP,aUP2,aO2],  // end a-minus-mid
  [aUP,aMid,aUP2],  // downslope aMid,aUP,aUP2
  [mO,mO2,aO2,aO],  // front rO, rO2, aO2, aO
  [mO,mUP,aUP,aO],  // right - origin side
  [mO2,mUP2,aUP2,aO2], // left - O2 side
  [mUP,mMid,aMid,aUP],  // back right
  [mUP2,mMid,aMid,aUP2], // back left
  ];
gPoly( Points, bodyFaces ,0,4,-15,2,180,0,180);
}

module gPoly(Points, Faces, thirdVar=0, xTrans=0,yTrans=0,zTrans=0,xRot=0,yRot=0,zRot=0){
translate([xTrans,yTrans,zTrans])
rotate([xRot,yRot,zRot])
polyhedron( Points, Faces );
}
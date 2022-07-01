//Copyright 2022 Gilgamech Technologies
//Title: Business Card
//Made by: Stephen Gillie
//Created on: 4/07/2022
//Updated on: 5/25/2022
//Units: millimeters (.001) 
//Notes: 

include  <Gilgahedron.scad>

cardX=88.9;
cardY=50.8;
cardZ=1;

aMiniX=48;
aMiniY=18;

bodyX=cardX/2-9.5;//34.95
bodyY=(cardY-aMiniY)/2-3;//14.93
bodyYloc=cardY/3-.25;//15.33
driveshaftY=cardY/2-.5;//23.8


zVisAdj=.1;//raised for visibility

//difference(){
//gCube(cardX,cardY,cardZ);//baseCard
//
bizCard();
// }

//justWheel();
module base(size=.1){
difference(){

roundedBox(bodyX,aMiniY+cardZ,cardZ,0,0,zVisAdj);

gTextBase("Stephen",0,3);
gTextBase("Gillie",1,3);
gTextBase("206-458",3,3);
gTextBase("-0493",4,3);

gTextBase("v1.0.6",8,4);
 }
}

module bizCard(){
justSide("Gilgamech",5,180);//right side
base();
justSide("Technologies",4);//left side

wheels();
gCube(bodyX,cardZ,cardZ,0,driveshaftY,zVisAdj);//driveshaft
gCube(bodyX,cardZ,cardZ,0,-driveshaftY,zVisAdj);//driveshaft
}
module justSide(text="test",size=5,rot=0){
axleDia=1.5;
axleXloc=cardX*.17;
axleYloc=bodyYloc-3;

rotate([0,0,rot]){
    difference(){
    roundedBox(bodyX,bodyY,cardZ,
        0,bodyYloc,zVisAdj);//side
    gCylinder(cardZ*2,axleDia,axleDia,
        axleXloc,axleYloc,zVisAdj);//front axle gap
    gCylinder(cardZ*2,axleDia,axleDia,
        -axleXloc,axleYloc,zVisAdj);//rear axle gap
    gText(text,
        size,size,20,
        -axleXloc-2,bodyYloc,-1);
}
}}

module wheels(){
wheelRad=cardY/4;
wheelXLoc=cardX/2-wheelRad;
wheelYLoc=cardY/2-wheelRad;

justWheel(wheelXLoc,wheelYLoc,wheelRad);
justWheel(-wheelXLoc,wheelYLoc,wheelRad);
justWheel(wheelXLoc,-wheelYLoc,wheelRad);
justWheel(-wheelXLoc,-wheelYLoc,wheelRad);

}

module justWheel(wheelXLoc=0,wheelYLoc=0,wheelRad=cardY/4){
bigGSize=.6;
fittingSize=cardZ*2.3;
difference(){
gCylinder(cardZ,wheelRad,wheelRad,
    wheelXLoc,wheelYLoc,zVisAdj);//wheel
gCube(fittingSize,fittingSize,cardZ*2,wheelXLoc,wheelYLoc,zVisAdj);//fitting gap
icon_extrude("BigG.dxf",bigGSize,bigGSize,cardZ,wheelXLoc,wheelYLoc,.5);//logo
}
}


module gTextBase(text="test",line=0,size=4){
gText(text,
    size,size,20,
    line*4-14,-8,-1,
    0,0,90);
}
//upstream
module roundedBox(xSize=36,ySize=36,zSize=2,xTrans=0,yTrans=0,zTrans=0,xRot=0,yRot=0,zRot=0){
translate([xTrans,yTrans,zTrans])
rotate([xRot,yRot,zRot])
union(){
cubeSize=1.25;
gCube(xSize/cubeSize,ySize,zSize);
gCube(xSize+3,ySize/cubeSize-5,zSize);
cylSize=cubeSize*2;

cr=cubeSize*3.4;
cx=xSize/cylSize+.8;
cy=ySize/cylSize-2.8;

gCylinder(zSize,cr,cr,cx,cy);
gCylinder(zSize,cr,cr,-cx,cy);
gCylinder(zSize,cr,cr,cx,-cy);
gCylinder(zSize,cr,cr,-cx,-cy);
}}



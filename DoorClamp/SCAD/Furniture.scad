//Copyright 2022 Gilgamech Technologies
//Title: Furniture cache
//Made by: Stephen Gillie
//Created on: 3/29/2022
//Updated on: 4/4/2022
//Units: varies
//Notes: 

include  <Gilgahedron.scad>

stoveRange();

module bathtub(){
difference(){
gCube(54,30,16);
roundedBox(49.75,23,16,0,0,3);
}}
module bathSurround(){
difference(){
roundedBox(54,30,54);
roundedBox(53,30,55,0,1);
gCube(58,5,60,0,12);
}}

module bathroomSinkCounter(width=95,depth=22.5){
//inches
    difference(){
    gCube(depth,width,1.25);
    gSphere(7,9.9,3.05);
}
    difference(){
    gBowl(7,9.9,3.05);
    gCylinder(1,1.7,1.7,0,0,-3);
}
    gCube(.375,width,3.5,depth/2,0,1.125);
    gTube(6,1.75,1.75,0,0,-6);
}
module kitchenCounterTop(width=70,depth=22.5){
//inches
    gCube(depth,width,1.25);
    gCube(.375,width,3.5,depth/2,0,1.125);
}
module stoveRange(xSize=30,ySize=26,zSize=28){
//inches (0.0254)
    baseHeight=1;
    drawerSize=2;
    drawerXLoc=xSize/2-baseHeight;
    topZLoc=zSize/2-baseHeight;
    drawerZLoc=zSize/+2.9;
    gCube(xSize,ySize,baseHeight,0,0,-topZLoc);//base
    gCube(xSize-drawerSize,ySize,zSize-baseHeight*2,-drawerSize/2);//body
    gCube(drawerSize,ySize,zSize*.18,drawerXLoc,0,-drawerZLoc);//drawer
    gCube(drawerSize,ySize,zSize*.5,drawerXLoc);//door
        gCube(drawerSize,ySize,zSize*.18,drawerXLoc,0,drawerZLoc);//controls
    
    buttonXLoc=drawerXLoc+1;
    buttonYLocA=ySize/2.5;
    buttonYLocB=ySize/6;
    buttonZLoc=drawerXLoc-zSize/7;
    
    gCylinder(1,1,1,buttonXLoc,buttonYLocB,buttonZLoc,0,90);//left button
    gCylinder(1,1,1,buttonXLoc,buttonYLocA,buttonZLoc,0,90);//left center button
    gCylinder(1,1,1,buttonXLoc,-buttonYLocA,buttonZLoc,0,90);//right center button
    gCylinder(1,1,1,buttonXLoc,-buttonYLocB,buttonZLoc,0,90);//right button
    
    gCube(xSize,ySize,baseHeight,0,0,topZLoc);//top
    
    burnerXLocF=xSize/4;
    burnerYLocL=ySize/4;
    burnerZLoc=drawerXLoc;

    gCylinder(1,6,6,burnerXLocF,burnerYLocL,burnerZLoc);//left front burner
    gCylinder(1,5,5,-burnerXLocF,burnerYLocL,burnerZLoc);//left rear burner
    gCylinder(1,5,5,burnerXLocF,-burnerYLocL,burnerZLoc);//right front burner
    gCylinder(1,6,6,-burnerXLocF,-burnerYLocL,burnerZLoc);//right rear burner
}
module microwave(){
}
module kitchenSink(){
}
module toilet(){
//inches
    gCube(12,12,1,0,0,-20);//base
    gBowl(18,12,12,-6);//bowl
    difference(){
        gCube(8,3,12,0,0,-14);
        gSphere(18,12,12,-6);
    }//stand
intersection(){
    gSphere(22,16,16,-6);
    difference(){
        gCube(40,30,2,-5,0,1.7);
        gSphere(18,12,12,-6);
    }
}//rim
intersection(){
    gSphere(18,16,16,-11,0,3);
    difference(){
        gCube(40,30,2,-10,0,3.7);
        gSphere(13,12,12,-11,0,3);
    }
}//seat
    gCube(12,24,18,9,0,11.7);//reservoir
}
module couch(height = 33.5,width = 83+1/8,depth = 38+5/8,backrestHeight = 28,seatDepth = 21+5/8,seatHeight = 18+7/8){
//Units: cm (0.01)

difference(){
gCube(width,depth,height);
gCube(width+.1,seatDepth,seatHeight,0,-seatDepth/2+2,seatHeight/2-2);
icon_extrude("bigG.dxf",.8,.8,.8,0,depth/2,0,90,0,180);
}}

module dishwasher(xSize=24,ySize=24,zSize=34+(5/8)){
//GE Stainless Steel Interior Dishwasher (GDT695SGJ)
//Units: inches (0.0254)
difference(){
roundedBox(zSize,ySize,xSize,0,0,0,0,90);
roundedBox(zSize*.99,ySize*.99,xSize,-1,0,0,0,90);
}//case
gCube(xSize,xSize-(1/4),29+(7/8),-3,0,2,0,90);//machine
gCube(xSize,ySize,4,0,0,-zSize/2+2);//toekick
difference(){
gCube(xSize,ySize-2,1,-9,0,zSize/2-8);//handle
gCube(xSize,ySize*.75,1.1,-8,0,zSize/2-8);//handle
}}

module flowerPot(z=0,height=60,topDia=40,botDia=30) {
//Units: mm (0.001)
union(){
difference() {
union(){
//outside cone
gCylinder(
    height,
    botDia,
    topDia,
    0,0,z+height/2);

//Rim cylinder
gCylinder(
    height/3,
    topDia,
    topDia,
    0,0,z+height-10);
}// end union
//inner hollow cone
gCylinder(
    height+.2,
    botDia*.95,
    topDia*.95,
    0,0,z+height/2);
}//end difference
difference (){
//dorsal plate
gCylinder(
    5, 
    botDia,
    botDia,
    0,0,z+3);

//drain 
gCylinder(
    6,5,5,
    0,0,z+3);
}//end difference
}//end union
}//end module
module pictureFrame(h=36,w=24){
//Units: inches (0.0254)
gCube(1,w,2,0,0,(h/2)-.99);//top
gCube(1,w,2,0,0,-(h/2)+.99);//bot
gCube(1,2,h,0,(w/2)-.99);//right
gCube(1,2,h,0,-(w/2)+.99);//left
gCube(.06,w,h,-.5);//center
}
module refrigerator(xSize=35.75,ySize=28,zSize=69.5){
//GE Stainless Steel Refrigerator
//Units: inches (0.0254)
doorXLoc=5;
doorYLoc=25;
doorZLoc=.75;
doorXSizeA=21.5;
doorXSizeB=13.25;
doorYSize=4.25;
doorZSize=68;
handleXSize=2.5;
handleYSize=2;
handleZSize=12;
handleYLoc=19;

gCube(xSize,ySize,zSize);//Main Box
gCube(doorXSizeB,doorYSize,doorZSize,
    xSize/2-doorXSizeB/2,ySize/2+doorYSize/2,doorZLoc);//Left door
gCube(3,6,.5,
    xSize/2.3,ySize/2,zSize/2);//Left Hinge
gCube(handleXSize,handleYSize,handleZSize,
    xSize/2-doorXSizeB+handleXSize,handleYLoc);//Left Handle


gCube(doorXSizeA,doorYSize,doorZSize,
    -xSize/2+doorXSizeB/1.25,ySize/2+doorYSize/2,doorZLoc);//Right door
gCube(3,6,.5,
    -xSize/2.3,ySize/2,zSize/2);//Right Hinge
gCube(handleXSize,handleYSize,handleZSize,
    -xSize/2+doorXSizeA-handleXSize,handleYLoc);//Right Handle
    
}
module table(height = 3,topSize = 3,topThick = .2){
//Units: feet (.3048)

supportWidth = topThick/2;
supportHeight = height/10;
legLoc = topSize/(2+topThick);

union() {
gCube(topSize,topSize,topThick,0,0,height/2);//topSize
gCube(topThick,topThick,height,legLoc*1,legLoc*1,0);//tableLeg
gCube(topThick,topThick,height,legLoc*1,legLoc*-1,0);//tableLeg
gCube(topThick,topThick,height,legLoc*-1,legLoc*1,0);//tableLeg
gCube(topThick,topThick,height,legLoc*-1,legLoc*-1,0);//tableLeg
gCube(supportWidth,topSize-topThick,supportHeight,legLoc*1,0,(height/2)-supportHeight+.1);//tableSupport
gCube(topSize-topThick,supportWidth,supportHeight,0,legLoc*1,(height/2)-supportHeight+.1);//tableSupport
gCube(supportWidth,topSize-topThick,supportHeight,legLoc*-1,0,(height/2)-supportHeight+.1);//tableSupport
gCube(topSize-topThick,supportWidth,supportHeight,0,legLoc*-1,(height/2)-supportHeight+.1);//tableSupport
}}



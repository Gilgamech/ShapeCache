//Copyright 2022 Gilgamech Technologies
//Title: HumanModel1
//Made by: Stephen Gillie
//Created on: 3/29/2022
//Updated on: 3/29/2022
//Units: meters (1)
//Notes: Human scale model

include  <Gilgahedron.scad>
height=1.75;

hHead=height-(height*0.07428);
gSphere(height*.1,height*0.07428,height*0.13028
        ,0,0,hHead);//head

dNeck=height*0.03;
hNeck=hHead-.25;
gSphere(dNeck,dNeck,height*.1,
        ,0,0,hNeck);//neck

hTor=hHead-.75;
wTor=height*0.2;
zTor=height*0.27;
gSphere(height*0.142857,
        wTor,
        zTor
        ,0,0,hTor);//torso

//hArm=hTor+.5;//arms up
hArm=hTor+.075;
dArm=height*0.05714;
lArm=height*0.18;
sArm=wTor*1.1;
gSphere(dArm,dArm,lArm
        ,0,sArm,hArm);//left upper arm
gSphere(dArm,dArm,lArm
        ,0,-sArm,hArm);//right upper arm
//gSphere(1,1,3
//        ,6,1.5,sTor);//left lower arm
//gSphere(1,1,3
//        ,6,-1.5,sTor);//right lower arm
//gSphere(1.25,1,1
//        ,7,1.5,sTor);//left hand
//gSphere(1.25,1,1
//        ,8,-1.5,sTor);//right hand

hLeg=zTor/1.5;
legThick=height*0.085714;
sLeg=height*0.15;
gSphere(legThick,legThick,hLeg
        ,0,sLeg,hLeg);//left upper leg
gSphere(legThick,legThick,hLeg
        ,0,-sLeg,hLeg);//right upper leg
//gSphere(1,1,3
//        ,9,1.5,hLeg);//left lower leg
//gSphere(1,1,3
//        ,10,-1.5,hLeg);//right lower leg
//gSphere(2,1,1
//        ,11,1.5,hLeg);//left foot
//gSphere(2,1,1
//        ,12,-1.5,hLeg);//right foot

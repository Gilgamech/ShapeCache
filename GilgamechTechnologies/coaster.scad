//Copyright 2022 Gilgamech Technologies
//Title: Coaster
//Made by: Stephen Gillie
//Created on: 5/17/2022
//Updated on: 5/17/2022
//Units: millimeters (.001)
//Notes: 
include  <Gilgahedron.scad>

size=5;
difference(){
    icon_extrude("BigG.dxf",2.1,2.1,5,-.5,-.65);
    gCylinder(10,33,33,0,0,5);
    gText("Gilgamech",size,size,55,
        -18,20,-4);
    gText("I will",size,size,55,
        -32,-2,-4);
    gText("be back",size,size,55,
        8,-2,-4);
    gText("Technologies",size,size,55,
        -21,-24,-4);
}

//checkPrint();


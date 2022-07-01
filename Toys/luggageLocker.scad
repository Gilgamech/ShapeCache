//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 4/07/2022
//Updated on: 4/07/2022
//Units: idk (idk) meters (1) inches (0.0254) cm (.01) millimeters (.001) feet (.3048)
//Notes: 

include  <Gilgahedron.scad>

difference(){
mainBody();
cutSlot();
}

module mainBody(){
gCylinder(10,3,3);
gCylinder(1,4,4,0,0,5);
gCylinder(1,5,5,0,0,-5);
}

module cutSlot(){
gCylinder(12,1.75,1.75);
gCube(2.5,8,8,0,0,2);
}
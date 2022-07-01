//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 4/07/2022
//Updated on: 4/07/2022
//Units: millimeters (.001)
//Notes: 
//checkPrint();

innerDia=11.25/2;
outerDia=innerDia+5;

bigGScale=.65;

include  <Gilgahedron.scad>

vapeBase();

module vapeStand1(){
difference(){
union(){
inverse_icon_extrude("BigG.dxf",1,1,5);
gCylinder(30,outerDia,outerDia,0,0,12.5);
}
gCylinder(30,innerDia,innerDia,0,0,13);
}}

module vapeStand2(){
difference(){
union(){
icon_extrude("BigG.dxf",bigGScale,bigGScale,30,0,0,15);
}
gCylinder(30,innerDia,innerDia,.2,.25,17);
}}
module vapeBase(){
difference(){
union(){
inverse_icon_extrude("BigG.dxf",bigGScale,bigGScale,30,0,0,15);
}
gCylinder(30,innerDia+.1,innerDia+.1,.2,.25,17);
}}




//Copyright 2022 Gilgamech Technologies
//Title: Lampshade shape (cone minus cone)
//Made by: Stephen Gillie
//Created on: 3/19/2022
//Updated on: 3/19/2022
//Units: idk (idk)
//Notes: cTL = center Tube Length

include  <Gilgahedron.scad>

cTL = 6;

lampSupport();
module lampSupport(Adj=3) {
z=cTL*1.3;

difference() {
gSphere(1,2,2.75,0,0,z);
gSphere(.99,1.98,2.73,0,0,z);
}}
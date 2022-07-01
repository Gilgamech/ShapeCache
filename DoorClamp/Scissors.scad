//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 5/22/2022
//Updated on: 5/22/2022
//Units: millimeters (.001)

include  <Gilgahedron.scad>

scissorArm();
module scissorArm(fingerDia=20,thickness=5){
ringID = fingerDia*.625;//12.5
ringOD = fingerDia*.75;//15
difference(){
union(){
gCylinder(thickness,ringOD,ringOD);
scale([1,10,1])
gCylinder(thickness,ringOD/2,ringOD/2,ringOD/2,ringOD/2);
}
gCylinder(thickness+1,ringID,ringID);
}

}




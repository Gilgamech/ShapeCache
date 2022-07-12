//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 4/07/2022
//Updated on: 4/07/2022
//Units: millimeters (.001)
//Notes: 
include  <Gilgahedron.scad>

//tubePart();
ringPart();
module ringPart(){
difference(){
union(){
cockRing(15,.5,75);
attachBlock();
}
cockTube();
lockBody();
gCylinder(30,3,3,38,0,18,90);
gCube(4.5,30,10,38,0,14.95);
gCube(6,7,6,39,-6,13);//lock swing
}}

module tubePart(){
difference(){
union(){
difference(){
cockTube();
    scale([.8,1,1])
    gCylinder(75,18,18,21,0,25);

}
lockBody();
}
gCylinder(30,3,3,38,0,18,90);
gCube(4.5,30,10,38,0,14.95);
gCube(6,7,6,39,-6,13);//lock swing
}

}
module cockRing(ringThickness = 1,ringWidth = .5,ringDiameter=2) {
    scale([1,1.2,1])
    rotate_extrude($fn=100)
    translate([ringDiameter/2, 0, 0])
    scale([ringWidth,1,1])
    circle(r = ringThickness/2, $fn=100);
}

module attachBlock(){
    gCube(20,20,25,35,0,10);    
}
module cockTube(){
    scale([.8,1,1])
    gCylinder(70,20,20,21,0,25);
}
module lockBody(){
difference(){
union(){
    gCube(7,10,23,38,0,15);//lock block
    gCube(4,8,29,33,0,15);//tube support slot
}
}}

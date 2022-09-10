//Copyright 2022 Gilgamech Technologies
//Title: 
//Made by: Stephen Gillie
//Created on: 4/07/2022
//Updated on: 5/21/2022
//Units: millimeters (.001)
//Notes: 

include  <Gilgahedron.scad>
translate([0,0,-15])
textstone(75);

module textstone(height=80) {
difference() {
tombstone(height);
textHeight = height/10;
xOffset = -28;
zOffset = 10;
gText("Make your",textHeight,textHeight,height,xOffset+5,0,zOffset*5-3,90);
gText("mark on the",textHeight,textHeight,height,xOffset,0,zOffset*4-3,90);
gText("  world with",textHeight,textHeight,height,xOffset,0,zOffset*3-3,90);
gText("  Gilgamech",textHeight*.9,textHeight,height,xOffset,0,zOffset*2-3,90);
gText("Technologies",textHeight*.95,textHeight,height,xOffset,0,zOffset*1-3,90);
gText("",textHeight,textHeight,height,xOffset,0,zOffset*0-3,90);
gText("Gilgmech.com",textHeight*.85,textHeight*.85,height,xOffset,0,zOffset*-1-3,90);
gText("206-458-0493",textHeight*.9,textHeight,height,xOffset,0,zOffset*-2-3,90);
}
}
module tombstone(height=50){
        intersection() {
            silo(height,height*.4);
        gCube(height*2,5,height*2);
    }
}



//Check if print will fit on printer
//checkPrint();


/*
Makes a cloud object.

parameters:
width		The width of the cloud. This also determine the height, because the height is half the width.
thick		Thickness of the object.
*/

cloud(100, 10);

module cloud(width, thick){

translate([width*.15, width*.2, 0])
cylinder(h = thick, r = width*.15);

translate([width*.37, width*.25, 0]) 
cylinder(h = thick, r = width*.25);

translate([width*.65, width*.22, 0])
cylinder(h = thick, r = width*.2);

translate([width*.85, width*.2, 0])
cylinder(h = thick, r = width*.15);
}//end of module cloud
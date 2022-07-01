

/***********************************
Puoblic domain GPL licence
by Dirk Hamm 22/11/2020
Montbazin - France
roberto.hamm@sfr.fr
http://robotix.ah-oui.org
************************************
gear(;
    nb-teeth,
    thikness,
    scale);
    
worm(;
    scale);
***********************************/

include<lib-gear-dh.scad>
include<lib-worm-dh.scad>

worm(10);

translate([7,0,5.5]) rotate([90,0,0]) 
gear(12,5,10);
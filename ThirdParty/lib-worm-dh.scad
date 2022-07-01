
/***********************************
Puoblic domain GPL licence
by Dirk Hamm 05/07/2020
Montbazin - France
roberto.hamm@sfr.fr
http://robotix.ah-oui.org
************************************
worm(
nb-teeth,
thikness,
scale);
***********************************/

module grx(nn=0,thkk=0){
  
module tootx(){
    sz = 5;
    sx = 3;
    th = thkk-1.8;
    of = 5;
        rotate([90,0,0])
    hull(){
    translate([0,0,th/2])
    cube([sz,sz,th],center=true); 
    translate([of,0,th/2])
    cube([sx,sx,th],center=true);}}

   
    
    for (n = [1 : 450]){
    rotate([0,0,n*4]){
        translate([10,0,n*0.12])
        tootx();
    }}
   // color("yellow")
    translate([0,0,-2.4])
    cylinder(d=16,h=59);
    }
    
module worm(scl=0){
    nn=5;
    thkk=3;
    scl = scl*0.0204;
    scale(scl)
    grx(nn=nn,thkk=thkk);}


 
 //worm(10);

    

    
    


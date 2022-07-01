////////////////////////////////////
//
// Parametric chastity cage, modified from this one: https://www.thingiverse.com/thing:2764421/
// Version 3, published August 2018

// V4 update: February 2019
//    - Added option to bend the base ring, for comfort
//    - Updated variables for Thingiverse Customizer

// V5 update: June 2019
//    - Rewrote as many functions as possible

//////////////////////////////////////

// Render cage and ring separately
separateParts = 0; // [0: Together, 1: Separate]

// Cage diameter
cage_diameter=45; // [30:40]

// Cage length (this should be about 16mm less than one's penis length)
cage_length=90; // [30:200]

// Base ring diameter
base_ring_diameter=60; // [30:55]

// Degrees of separation for the flexible ring
gap_degrees = 0;

// Thickness of base ring 
base_thick_bar_diameter=6; // [6:10]

// Add a "wave" to the base ring (contours to the body a little better, reduces chafing)
wavyBase = 1; // [0: Flat, 1: Wavy]

// If the base ring has a wave, set the angle of the wave
waveAngle = 10; // [0:45]

// Thickness of the rings of the cage
cage_thick_bar_diameter = 4; // [4:8]

// Number of vertical bars on the cage
cage_bar_count = 8;

// Tilt angle of the cage at the base ring
tilt = 10; // [0:30]

// If your lock fits too tightly in the casing, add some space around it here (NOTE: this is computationally taxing, keep it set to 0 until you are really sure you need it)
lock_margin = 0; // [0:0.01:1]

// If the two parts slide too stiffly, add some space here
part_margin = 0; // [0:0.01:1]

// X-axis coordinate of the bend point (the center of the arc the cage bends around)
bend_point_x=40; // [0:0.1:200]

// Z-axis coordinate of the bend point (the center of the arc the cage bends around)
bend_point_z=-3; // [0:0.1:200]

anti_pullout = 0; // [0: No, 1: Yes]

/* [Hidden] */

// Clip the bottom so the base is flatter when printing
flattenBase = 0; // [0: Unclipped, 1: Clipped]

// Glans cage height (minimum is cage radius)
glans_cage_height = cage_diameter/2; // [15:50]


// Variables affecting base ring and keyhole
bore = 4;
diameter = 6;
crosshole = 3.5;
boredist=0.3;
lock_diameter=6.2;
lock_length=20;
lock_case_wall=1.5;
lock_case_height=5;
lock_case_width=3.2;
lock_twist_length=7;
wiggle=0.005;
lc_rounding=0.7;

// Variables affecting cage properties
bend_point_y=0;
thin_bar_diameter=4;
thin_bar=thin_bar_diameter/2;
mount_width=5;
mount_height=18;
mount_length=20;
part_distance=0.3;
rounding=1;
gap=10;

// Square function for math
function sq(x) = pow(x, 2);


////////////////////////////////////
//
// Useful values calculated from parameters above
//

// step: angle between cage bars
step = 360/cage_bar_count;

// R1: Inner radius of shaft of cage
// R2: Inner radius of base ring
R1 = cage_diameter/2;
R2 = base_ring_diameter/2;

// r1: cage bar radius
// r2: base ring radius
r1 = cage_thick_bar_diameter/2;
r2 = base_thick_bar_diameter/2;

// P: bend point (assumed to be on the XZ plane)
// dP: distance from origin to bend point
P = [bend_point_x, 0, bend_point_z];
dP = sqrt(sq(P[0]) + sq(P[1]) + sq(P[2]));

// psi: angle from origin to bend point (in degrees)
psi = atan(P[2]/P[0]);

// dQ: length of straight cage segment
dQ = dP*cos(90-tilt-psi);
if (cage_length-glans_cage_height < dQ) {
  dQ = cage_length-glans_cage_height;
}

// Q: upper endpoint of straight segment of cage
Q = [dQ*sin(tilt), 0, dQ*cos(tilt)];

// Phi: arc length of curved segment of cage (in degrees)
curve_radius = sqrt(sq(P[0]-Q[0]) + sq(P[1]-Q[1]) + sq(P[2]-Q[2]));
Phi = (cage_length - dQ - glans_cage_height)/curve_radius * 180/PI;

// slit_width: 
slit_width = (R1+r1)*cos(step);


////////////////////////////////////
//
// Finally, here's where the modules begin
//
$fn= $preview ? 32 : 60;
make();


module make() {
  if (flattenBase) {
    difference() {
      union() {
        cage();
        make_base();
//        translate([base_ring_diameter + cage_diameter + 10, 
//          0, - base_thick_bar_diameter / 2]) 
//            rotate([0, tilt, 0])
//            ring_lock();
      }
      
      slicer();
    }
  } else {
    union() {
//      cage();
        make_base();
//      translate([base_ring_diameter + cage_diameter + 10, 
//          0, - base_thick_bar_diameter / 2]) 
//            rotate([0, tilt, 0])
//            ring_lock();
    }
  }
}

module make_base() {
  if (separateParts) {
    translate([-base_ring_diameter-cage_diameter-10, 
                0, 10 + base_thick_bar_diameter * (1.5/3)]) 
    {
        ring(base_ring_diameter/2, tilt, base_thick_bar_diameter);
    }
  } else {
    translate([R1*(-1-sin(tilt)), 0, -2])
        ring(base_ring_diameter/2, tilt, base_thick_bar_diameter);
  }
}

// Slice the bottom off the ring and cage to make them more printable
module slicer() {
  if (separateParts) {
    translate([0,0, -base_thick_bar_diameter * (13/16)]) {
      cylinder(r=200,h=2);
    }
  } else {
    translate([0,0, - mount_height - base_thick_bar_diameter * (1/3)]) {
      cylinder(r=200,h=2);
    }
  }
}

module rounded_cylinder(r,h,n) {
  rotate_extrude(convexity=1) {
    offset(r=n) offset(delta=-n) square([r,h]);
    square([n,h]);
  }
}

module rounded_hollow_cylinder(r,r2,h,n) {
  rotate_extrude(convexity=4) {
    translate([r2,0,0]) offset(r=n) offset(delta=-n) square([r-r2,h]);
  }
}

module rounded_cube(size, radius) {
	translate([radius, radius, radius]) minkowski() {
		cube(size = [
			size[0] - (radius * 2),
			size[1] - (radius * 2),
			size[2] - (radius * 2)
		]);
		sphere(r = radius);
	}
}

module torus(R, r, phi=360, rounded=false) {
  if (version_num() > 20151231) {
    union() {
      rotate_extrude(convexity=4, angle=phi) {
        translate([R,0,0]) circle(r);
      }
      if (rounded) {
        translate([R,0,0]) sphere(r);
        rotate([0,0,phi]) translate([R,0,0]) sphere(r, $fa=60);
      }
    }
  } else {
    echo("Using a deprecated method for torus(); consider updating to OpenSCAD 2016 or newer");
    if (phi <= 180) {
    difference() {
        rotate_extrude(convexity=4) {
          translate([R,0,0]) circle(r);
        }
        translate([0,-(R+r),0])
          cube([3*R+3*r,2*(R+r),3*r], center=true);
        rotate([0, 0, phi - 180])
          translate([0,-(R+r),0])
            cube([3*R+3*r,2*(R+r),3*r], center=true);
      }
    } else if (phi <= 360 ) {
      rotate_extrude(convexity=4) {
        translate([R,0,0]) circle(r);
      }
    } else if (phi < 360) {
      rotate([0,0,180])
      difference() {
        torus(R,r,360);// full torus
        torus(R,r,360-phi);//partial torus
      }
    }
  }
}

module lock_casing_outer() {
    translate([-lock_diameter/2-lock_case_wall, 
               (lock_length+lock_case_wall)/2, 
               lock_case_height+lock_case_wall+lock_diameter/2]) 
    {
        rotate([90, 90, 0]) {
            hull() {
                rounded_hollow_cylinder(lock_diameter/2+lock_case_wall+3.8, lock_diameter/2+wiggle, lock_length+lock_case_wall, lc_rounding);
                translate([8,0,0]) {
                rounded_hollow_cylinder(lock_diameter/2+lock_case_wall+3.8, lock_diameter/2+wiggle, lock_length+lock_case_wall, lc_rounding);
                }
            }
        }
    }
}

module lock_casing_inner() {
  translate([-lock_diameter/2-lock_case_wall, (lock_length+lock_case_wall)/2, lock_case_height+lock_case_wall+lock_diameter/2]) {
    rotate([90, 90, 0]) {
      union() {
        translate([lock_diameter/2-lock_case_wall-wiggle, -lock_case_width+lock_case_wall, lock_case_wall]) {
          rounded_cube([lock_case_height+lock_case_wall, lock_case_width, lock_length+lock_case_wall], lc_rounding);
        }
        rotate([0,0,-32.7]) {
          translate([lock_diameter/2-lock_case_wall-wiggle, -lock_case_width+lock_case_wall, lock_case_wall]) {
            rounded_cube([lock_case_height+lock_case_wall, lock_case_width, lock_twist_length], lc_rounding);
          }
        }
        rotate([0,0,-16.35]) {
          translate([lock_diameter/2-lock_case_wall-wiggle, -lock_case_width+lock_case_wall+0.05, lock_case_wall]) {
            rounded_cube([lock_case_height+lock_case_wall, lock_case_width-0.1, lock_twist_length], lc_rounding);
          }
        }
        translate([0, 0, -lock_case_wall/2]) {
          cylinder(r=lock_diameter/2, h=lock_length+2*lock_case_wall);
        }
      }
    }
  }
}

module cage() {
    difference() {
        union() {
            rotate([0, tilt, 0]) {
                cage_bar_segment();
                glans_cap();
                torus(R1+r1, r1*1.2);  // Cage base ring
            }
            translate([R1*(-1-sin(tilt)), 0, -2]) rotate([0, tilt, 0]) mount();
        }
        
        // Cut the recess for the ring mount to mate with
        translate([R1*(-1-sin(tilt)), 0, -2]) rotate([0, tilt, 0]) 
            translate([(lc_rounding * 2) - 9.5, 0, 0])
                translate([0 - mount_width + lc_rounding * 4, 0, mount_height / 2 - part_distance])
                    cube([mount_length, mount_length / 3 + wiggle * 2, mount_height + 5], center = true);
    }
}

module cage_bar_segment() {
  // Straight segment: N tilted cage bars
  for (theta = [step/2:step:360-step/2]) {
    straightseg = dQ - (R1+r1)*cos(theta)*cos(90-tilt);
    translate([(R1+r1)*cos(theta), (R1+r1)*sin(theta), 0]) rotate([0, tilt, 0]) {
      // Straight segment
      union() {
        cylinder(r=r1, h=straightseg);
        sphere(r1);
      }
      // Curved segment
      R_curve = curve_radius - (R1+r1)*cos(theta)*sin(90-tilt);
      translate([R_curve, 0, straightseg]) rotate([90, 0, 0]) {
        torus(-R_curve, r1, phi=-Phi, rounded=true);
      }
    }
  }
}

module glans_cap() {
  translate(P) rotate([0, Phi, 0]) translate(-P) {
    translate([dQ*sin(tilt), 0, dQ*cos(tilt)]) {
      rotate([0, tilt, 0]) {
        torus(R1+r1,r1); // Base of glans cap
        // Slit edges
        translate([0, -slit_width/2, 0]) rotate([85, 0, 0]) {
          torus((R1+r1)*cos(180/cage_bar_count), r1, phi=180, rounded=true);
        }
        translate([0, slit_width/2, 0]) rotate([95, 0, 0]) {
          torus((R1+r1)*cos(180/cage_bar_count), r1, phi=180, rounded=true);
        }
        // Cap side bars
        for (theta = [90-step/2:step:90+step/2]) {
          rotate([90, 0, theta]) torus(R1+r1, r1, phi=70, rounded=true);
          rotate([90, 0, 360-theta]) torus(R1+r1, r1, phi=70, rounded=true);
        }
      }
    }
  }
}

module cage_lock_portion(h, d, w) {
    translate([w-11,0,0]) {
        intersection() {
            union() {
                translate([-mount_length/4 - 0.5, 
                            mount_length / 2 - mount_length / 3, 
                            0-part_distance]) 
                {
                    rounded_cube([4*mount_length/4, mount_length/3, h], 0.5);
                }
                translate([-mount_length/4 - 0.5, -mount_length / 2, 0-part_distance]) {
                    rounded_cube([4*mount_length/4, mount_length/3, h], 0.5);
                }
            }
            
            // where did 12.5 come from?
            translate([12, 0, 0 - part_distance]) {
                lock_casing_outer();
            }
        }
    }
}

module mount(r=R1, h=mount_height, thick_bar=r1) {
//  translate([r+thick_bar+mount_width/2+part_distance,0,thick_bar+1])
//    mount_halfcircle(r, h, thick_bar);
  translate([-thick_bar-mount_width/2+part_distance, 0, part_distance]) {
    difference() {
      cage_lock_portion(h, mount_width, 3.2);
      translate([mount_width / 2.5, 0, -part_distance]) {
        if (lock_margin > 0) {
          minkowski() {
            lock_casing_inner();
            cube(lock_margin, center=true);
          }
        } else {
          lock_casing_inner();
        }
      }
    }
  }
}

module mount_halfcircle(r, h, thick_bar) {
    a = 360 / (cage_bar_count + 1);

    translate([-cage_thick_bar_diameter / 2, 0, 0])
        rotate([0, 0, 180 - a / 2]) 
            rotate_extrude(angle = a, convexity = 10) 
                translate([base_ring_diameter / 2, 0, 0]) 
                    circle(d = cage_thick_bar_diameter);
    
    rotate([0, 0, a / 2 - 2])
        // TODO: Determine where the extra 0.25 is coming from.
        translate([-base_ring_diameter / 2 - cage_thick_bar_diameter / 2 + 0.125, 0, 0]) 
            sphere(d = cage_thick_bar_diameter, $fa = 60);
    rotate([0, 0, 360 - (a / 2 - 2)]) 
        translate([- base_ring_diameter / 2 - cage_thick_bar_diameter / 2 + 0.125, 0, 0]) 
            sphere(d = cage_thick_bar_diameter, $fa = 60);

    // front portion of lock.
    translate([(-1-sin(tilt)), 0, -cage_thick_bar_diameter]) rotate([0, tilt, 0]) {
        rotate([0, 0, a / 2 - 2])
            // TODO: Determine where the extra 0.25 is coming from.
            translate([-base_ring_diameter / 2 - cage_thick_bar_diameter / 2 + 0.125, 0, h - cage_thick_bar_diameter])
                sphere(d = cage_thick_bar_diameter, $fa = 60);
        rotate([0, 0, 360 - (a / 2 - 2)]) 
            translate([- base_ring_diameter / 2 - cage_thick_bar_diameter / 2 + 0.125, 0, h - cage_thick_bar_diameter]) 
                sphere(d = cage_thick_bar_diameter, $fa = 60);        


         translate([-cage_thick_bar_diameter / 2, 0, h - cage_thick_bar_diameter])
             rotate([0, 0, -a / 2])
                rotate_extrude(angle = a) 
                    translate([-base_ring_diameter / 2, 0, 0])
                        circle(d = cage_thick_bar_diameter);
    }
}

module base_ring(r=R2, thick_bar=r2) {
  a=r+thick_bar;
  c=a/sin(120)*sin(60-asin(sin(120)*r/a));
  if (wavyBase) {
    wavy_torus(r+thick_bar, thick_bar, waveAngle);
    translate([-c, 0, a*sin(waveAngle)*sin(45)])
      rotate([0,-waveAngle,0]) rotate([0,0,120]) {
        torus(r, thick_bar, 120);
        translate([r, 0, 0]) sphere(thick_bar);
        rotate([0,0,120]) translate([r, 0, 0]) sphere(thick_bar);
      }
  } else {
    torus(r+thick_bar, thick_bar);
    translate([-c, 0, 0])
      rotate([0,0,120])
        torus(r, thick_bar, 120);
  }
}

module wavy_torus(R, r, pitch) {
  union() {
    translate([-sin(-45)*R*(1-cos(pitch)), 0, 1-R*sin(-45)*sin(pitch)]) rotate([0, pitch, 0]) rotate([0, 0, -45]) {
      torus(R, r, 90);
      translate([R, 0, 0]) sphere(r);
    }
    translate([0, sin(45)*R*(1-cos(pitch)), 1-R*sin(45)*sin(pitch)]) rotate([pitch, 0, 0]) rotate([0, 0, 45]) {
      torus(R, r, 90);
      translate([R, 0, 0]) sphere(r);
    }
    translate([-sin(135)*R*(1-cos(pitch)), 0, 1-R*sin(135)*sin(-pitch)]) rotate([0, -pitch, 0]) rotate([0, 0, 135]) {
      torus(R, r, 90);
      translate([R, 0, 0]) sphere(r);
    }
    translate([0, sin(-135)*R*(1-cos(pitch)), 1-R*sin(-135)*sin(-pitch)]) rotate([-pitch, 0, 0]) rotate([0, 0, -135]) {
      torus(R, r, 90);
      translate([R, 0, 0]) sphere(r);
    }
  }
}

module ring_lock_portion(thick_bar) {
  difference() {
    // Connects the lock_casing_outer to the ring.
    union() {
      translate([-mount_width - part_distance, -mount_length/2, 0]) {
        translate([0, 0, -13]) {
          rounded_cube([2 * mount_width + part_distance, mount_length, gap+2*thick_bar], rounding);
        }
        rounded_cube([mount_width, mount_length, mount_height+thick_bar], rounding);
      }
      
      // Removes the lower portion of the lock_casing_outer for the other parts to fit.
      translate([0, 0, thick_bar]) {
        difference() {
          lock_casing_outer();
          translate([mount_length-mount_width-part_distance+rounding, 0, 0]) {
            cube(2 * mount_length, center=true);
          }
        }
      }
      
      // Anti pullout.
      if (anti_pullout) {
          for (my = [0 : 1]) {
              mirror([0, my, 0]) {
                translate([(-2-sin(tilt)), 0, cage_thick_bar_diameter / 2]) rotate([0, tilt, 0])
                  
                translate([-lc_rounding, mount_width / 2 - r1 / 2, mount_length / 2]) {
                    hull() {
                        rotate([0, 90, 0]) cylinder(d = r1, h = lc_rounding / 2);
                        translate([0, 0, r1 * 1.5]) 
                            rotate([0, 90, 0]) cylinder(d = r1, h = lc_rounding / 2);
                        translate([r1 * 6, mount_width / 2 - r1, r1 * 7]) sphere(d = r1 * 2 / 3);
                    }
                }
            }
        }
      }
    }
    
    // The magic locker insert
    // TODO: Try to figure out why this is here, and not some other place.
    // The 4.15 seems rather .... random.
    translate([-mount_width / 4.15, 0, thick_bar + 0.1]) {
      if (lock_margin > 0) {
        minkowski() {
          lock_casing_inner();
          cube(lock_margin, center=true);
        }
      } else {
        lock_casing_inner();
      }
    }
    
    
    // carve off the space for the connector.
    translate([0, 0, mount_height]) {
        translate([0, -mount_length / 3 - part_margin - lc_rounding, 0])
            cube([30, mount_length / 3 + part_margin + lc_rounding * 2, 30], center = true);
        translate([0, mount_length / 3 + part_margin + lc_rounding, 0])
            cube([30, mount_length / 3 + part_margin + lc_rounding * 2, 30], center = true);
    }
  }
}

module ring_mount(thick_bar) {
  translate([-mount_width, 0, gap+thick_bar]) {
    ring_lock_portion(thick_bar);
  }
}

module ring(r, tilt=0, thick_bar_diameter) {
    // one side
    translate([0, (base_ring_diameter * tan(gap_degrees)), 0]) {
        rotate([0, 0, -gap_degrees]) {
            intersection() {
                translate([r-sin(tilt)*(gap+thick_bar_diameter)+cos(tilt)*thick_bar_diameter, 0, thick_bar_diameter/2-cos(tilt)*(gap+thick_bar_diameter)-sin(tilt)*mount_width]) {
                    centered_ring(r, tilt, thick_bar_diameter/2);
                }
                translate([0, base_ring_diameter / 2, 0]) {
                    cube([base_ring_diameter * 3, base_ring_diameter, mount_height + 40], center = true);
                }
            }
        }
    }
            
    // other side
    translate([0, -(base_ring_diameter * tan(gap_degrees))]) {
        rotate([0, 0, gap_degrees]) {
            intersection() {
                translate([r-sin(tilt)*(gap+thick_bar_diameter)+cos(tilt)*thick_bar_diameter, 0, thick_bar_diameter/2-cos(tilt)*(gap+thick_bar_diameter)-sin(tilt)*mount_width]) {
                    centered_ring(r, tilt, thick_bar_diameter/2);
                }
                translate([0, -base_ring_diameter / 2, 0]) {
                    cube([base_ring_diameter * 3, base_ring_diameter, mount_height + 40], center = true);
                }
            }
        }
    }
}

module centered_ring(r, tilt=0, thick_bar) {
    difference() {
        union() {
            base_ring(r, thick_bar);
            translate([-r-thick_bar*2.0/3.0,0,-thick_bar]) rotate([0,tilt,0]) {
                ring_mount(thick_bar);
            }
        }
        translate([-r-thick_bar*2.0/3.0,0,-thick_bar]) 
            rotate([0,tilt,0]) 
                ring_lock();
    }
}

module ring_lock() {
    translate([-mount_width, 0, mount_height / 4]) {
        difference() {
            cube([mount_width, 
                mount_length * (2/3), 
                mount_height / 2], 
                center = true);
            translate([mount_width / 4, 0, 0])
                cube([mount_width / 2, mount_length * (1/3), mount_height / 2], center = true);
        }
    }    
}
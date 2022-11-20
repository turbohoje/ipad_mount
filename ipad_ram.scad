$fn = 100;

//magnet size, height not accurate and used to cut out
magnet_height = 7;
magnet_radius = 12.718/2;

frame_heigh = 5;

flange_radius = magnet_radius + 2;

//on center spacing of magnets on the back of ipad
mag_width_oc  = 222;
mag_height_oc = 100; 
mag_cone = .25; //wedge magnets in, radius in mm change

mag_z_offset  = .7;

center_cir = 30;



difference(){
union(){
	//hull(){
	union(){
		//cylinder(13,5, 5);
		union(){
			hull(){	
				cylinder(10, center_cir, 5.5);
				translate([mag_width_oc/2,mag_height_oc/2, 0])
					cylinder(frame_heigh, flange_radius, flange_radius);
			}
			hull(){
				cylinder(10, center_cir, 5.5);
				translate([-mag_width_oc/2,mag_height_oc/2, 0])
					cylinder(frame_heigh, flange_radius, flange_radius);
			}
			hull(){
				cylinder(10, center_cir, 5.5);
				translate([-mag_width_oc/2,-mag_height_oc/2, 0])
					cylinder(frame_heigh, flange_radius, flange_radius);
			}
			hull(){
				cylinder(10, center_cir, 5.5);
				translate([mag_width_oc/2,-mag_height_oc/2, 0])
					cylinder(frame_heigh, flange_radius, flange_radius);
			}
		}
	}
	cylinder(20,5.5, 5.5);
	translate([0,0,28])
		sphere(25.4/2); //1" size B ball
}

//cut out magnets
translate([0,0,mag_z_offset]){
	translate([mag_width_oc/2,mag_height_oc/2, 0])
		cylinder(magnet_height, magnet_radius, magnet_radius+mag_cone);

	translate([-mag_width_oc/2,mag_height_oc/2, 0])
		cylinder(magnet_height, magnet_radius, magnet_radius+mag_cone);
		
	translate([-mag_width_oc/2,-mag_height_oc/2, 0])
		cylinder(magnet_height, magnet_radius, magnet_radius+mag_cone);

	translate([mag_width_oc/2,-mag_height_oc/2, 0])
		cylinder(magnet_height, magnet_radius, magnet_radius+mag_cone);
}
// bolt cutout
translate([0,0,38])
	cylinder(10, 3, 3, $fn=6);

translate([0,0,-1])
	cylinder(60, 1.5, 1.5);

translate([0,0,-.1])
	cylinder(4, 4, 0);
}
$fn = 120;

magnet_height = 5;
magnet_radius = 3.7;

flange_radius = 10;

mag_width_oc  = 140;
mag_height_oc = 100;

mag_z_offset  = 5;


difference(){
union(){
	hull(){
		cylinder(13,5, 5);
		linear_extrude(5)
			hull(){
			translate([mag_width_oc/2,mag_height_oc/2, 0])
				circle(flange_radius);

			translate([-mag_width_oc/2,mag_height_oc/2, 0])
				circle(flange_radius);
				
			translate([-mag_width_oc/2,-mag_height_oc/2, 0])
				circle(flange_radius);

			translate([mag_width_oc/2,-mag_height_oc/2, 0])
				circle(flange_radius);
			}
	}
	cylinder(20,5.5, 5.5);
	translate([0,0,28])
		sphere(25.4/2); //1" size B ball
}

//cut out magnets
translate([0,0,3]){
	translate([mag_width_oc/2,mag_height_oc/2, 0])
		cylinder(magnet_radius, magnet_height, magnet_height);

	translate([-mag_width_oc/2,mag_height_oc/2, 0])
		cylinder(magnet_radius, magnet_height, magnet_height);
		
	translate([-mag_width_oc/2,-mag_height_oc/2, 0])
		cylinder(magnet_radius, magnet_height, magnet_height);

	translate([mag_width_oc/2,-mag_height_oc/2, 0])
		cylinder(magnet_radius, magnet_height, magnet_height);
}

// bolt cutout
translate([0,0,38])
	cylinder(10, 3, 3, $fn=6);

translate([0,0,-1])
	cylinder(60, 1.5, 1.5);

translate([0,0,-.1])
	cylinder(4, 4, 0);
}
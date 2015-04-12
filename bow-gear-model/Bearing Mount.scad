// Essential parameters:
bearing_qty = 2;
bearing_height = 20; // Height to elevate bearing hub
bearing_radius = 11.5; // Bearing radius
bearing_depth = 7.1; // Bearing depth
bearing_gap_radius = 7; // Extra gap for hub of bearing radius

screw_radius = 2.5;
screw_head_radius = 5;

// Advanced options:
mount_thickness = 3; // Thickness of mount parts
mount_screw_distance_multiple = 2.5; // Distance of mount screws from front
rear_support = 0; // 0 for no rear support, 1 for rear support.

// Derived properties:
base_height = mount_thickness;
riserWidth = bearing_radius + mount_thickness * 2;
riserHeight = bearing_height + bearing_radius + mount_thickness;
screw_distance = mount_screw_distance_multiple * riserHeight;
side_screw_area_r = screw_head_radius + mount_thickness;
base_depth = side_screw_area_r * 2;

// THE CODE:
theModel(bearing_qty, 30);

module theModel(quantity, distance){
  difference(){
    body(quantity, distance);
    holes(quantity, distance);
  }
}

module body (quantity, distance) {
  hull(){
    for(x=[0:quantity-1]){

      translate([x * distance, 0, 0])
        supportTower(x, distance);


      if (rear_support == 1)
      translate([x * distance, 0, 0])
      base(quantity, distance);
    }

    sideScrewSupports(quantity,
                      distance,
                      side_screw_area_r,
                      0.5);
  }
}

module sideScrewSupports( quantity, distance, base_radius, thickness ){

  first_offset = side_screw_area_r * -1;
  sideCylinder( first_offset, thickness, base_radius );

  second_offset = distance * (quantity-1) + riserWidth + side_screw_area_r;
  sideCylinder( second_offset, thickness, base_radius );

}

module sideCylinder( centerOffset, height, radius ) {
  translate([centerOffset, side_screw_area_r, 0])
  cylinder(r=radius, h=height);
}


module holes (quantity, distance) {
  for(x=[0:quantity-1]){
    translate([x * distance, 0, 0])
    bearingHole();

    translate([x * distance, 0, 0])
    mountScrewHole(screw_radius);
  }

  for(x=[0:quantity-1]){
    translate([x * distance, 0, 0])
    mountScrewHole(screw_head_radius);
    translate([x * distance, 0, -mount_thickness])
    mountScrewHole(screw_radius);
  }

  // Side Screw Holes:
  translate([0,0,mount_thickness])
  sideScrewSupports( quantity, distance, screw_head_radius, riserHeight * 2 );
  sideScrewSupports( quantity, distance, screw_radius, riserHeight * 2 );

}


module supportTower(x, distance){
	cube([riserWidth, base_depth, bearing_height]);

	translate([riserWidth/2, base_depth, bearing_height])
	rotate(a=90,v=[1,0,0])
	cylinder($fn=500, r=riserWidth/2 + mount_thickness * 2, h=base_depth);
}

module mountScrewHole(radius){
  translate([riserWidth/2, screw_distance, mount_thickness])
    cylinder(r=radius, h=riserHeight);
}

module base (quantity, distance) {
  translate([riserWidth/2, screw_distance, mount_thickness])
  cylinder(r=riserWidth/2, h=mount_thickness);
}

module frontScrewMount () {
  //hull(){
    cube([riserWidth, 1, mount_thickness]);

    translate([riserWidth/2, -screw_radius * 4, 0])
      cylinder(r=riserWidth/2, h=mount_thickness);
  //}
}

module bearingHole(){
	translate([riserWidth/2, bearing_depth-1, bearing_height])
	rotate(a=90, v=[1,0,0])
  union(){
    cylinder(r = bearing_radius, h = bearing_depth + 1);
    translate([0,0,-mount_thickness])
    cylinder(r = bearing_gap_radius, h = bearing_depth + mount_thickness + 1);
  }
}


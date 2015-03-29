include <configuration.scad>
include <Rotary encoder.scad>

difference(){
  mount();
  mountScrews();
}

module mount(){
  mountBody();
  supports();
  mountBase();
}

module mountScrews(){

  // Rear screw holes:
  translate([enc_body_radius, enc_screw_distance_from_center, -mount_base_screw_distance])
    rotate([0,90,0])
      cylinder(r=mount_base_screw_diameter, h=mount_plate_depth*2);

  translate([enc_body_radius, -enc_screw_distance_from_center, -mount_base_screw_distance])
    rotate([0,90,0])
      cylinder(r=mount_base_screw_diameter, h=mount_plate_depth*2);

  // Front screw holes
  translate([enc_body_radius, enc_screw_distance_from_center, enc_body_length + mount_base_screw_distance * 1.8])
    rotate([0,90,0])
      cylinder(r=mount_base_screw_diameter, h=mount_plate_depth*2);

  translate([enc_body_radius, -enc_screw_distance_from_center, enc_body_length + mount_base_screw_distance * 1.8])
  rotate([0,90,0])
    cylinder(r=mount_base_screw_diameter, h=mount_plate_depth*2);

  // Wire Hole:
  enc_side_wire_radius = 7;
  translate([enc_body_radius - mount_plate_depth, 0, enc_side_wire_radius])
    rotate([0,90,0])
      cylinder(r=enc_side_wire_radius, h=mount_plate_depth*4);
}

module mountBase(){

  translate([enc_body_radius, -enc_body_radius, -2 * mount_base_screw_distance + mount_plate_depth])
    cube([mount_plate_depth, enc_body_radius * 2, enc_body_length + (mount_base_screw_distance * 4)]);

}

module supports () {
  difference(){
    supportBeams();

    translate([0, enc_body_radius, enc_body_length + enc_body_radius + mount_plate_depth])
        rotate([90,0,0])
          cylinder(r=enc_body_radius, h=(enc_body_radius + 1) * 2);
   }
}

// Support beams:
module supportBeams(){
  translate([0, enc_body_radius - mount_plate_depth, enc_body_length])
    cube([enc_body_radius, mount_plate_depth, enc_body_radius]);

  translate([0, -1 * (enc_body_radius), enc_body_length])
    cube([enc_body_radius, mount_plate_depth, enc_body_radius]);
}

module mountBody() {
  difference(){
    mountPlate(mount_plate_depth);
    screwHoles();

    // Encoder shaft:
    cylinder(r=enc_shaft_radius, h=enc_shaft_length + enc_body_length);
    encoder();
  }
}

// Mounting platform:
module mountPlate(depth){
  cylinder(r=enc_body_radius, h=depth + enc_body_length);

  // Mount reaching to contact base:
  translate([0, -enc_body_radius, 0])
    cube([enc_body_radius, enc_body_radius * 2, depth + enc_body_length]);
}

/* ROTARY ENCODER DIMENSIONS */

// Main body size:
enc_body_radius = 20;
enc_body_length = 38;

// Shaft parameters
enc_shaft_radius = 10.25;
enc_shaft_length = 12;

// Mount screw parameters:
enc_screw_count = 3;
enc_screw_distance_from_center = 15.28;
enc_screw_depth = 20;
enc_screw_radius = 2.2;

// Mount plate parameters:
mount_plate_depth = 3;
mount_base_screw_diameter = 3;
mount_base_screw_distance = 15;

module screwHoles(){  // Subtracted from the face plate for mounting purposes.
                      // Is configured here for evenly-spaced screw holes
                      // encircling the encoder's rotor.
  for(z=[0:enc_screw_count]){
    rotate( a = 360 / enc_screw_count * z - 90, v=[0, 0, 1]){
      translate([ 0, enc_screw_distance_from_center, enc_body_length - enc_screw_depth ]){
        cylinder(r = enc_screw_radius, h=enc_screw_depth + mount_plate_depth);
      }
    }
  }
}

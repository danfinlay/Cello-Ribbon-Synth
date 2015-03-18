include <configuration.scad>

module encoderSolid(){

// Encoder body:
cylinder(r=enc_body_radius, h=enc_body_length);
// Encoder shaft:
cylinder(r=enc_shaft_radius, h=enc_shaft_length + enc_body_length);

}

module screwHoles(){
  for(z=[0:enc_screw_count]){

	rotate( a = 360 / enc_screw_count * z, v=[0, 0, 1]){
      translate([ 0, enc_screw_distance_from_center, enc_body_length - enc_screw_depth ]){

        cylinder(r = enc_screw_radius, h=enc_screw_depth);
      }
    }
  }
}

difference(){
	encoderSolid();
	screwHoles();
}

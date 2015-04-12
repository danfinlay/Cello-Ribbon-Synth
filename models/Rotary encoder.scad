include <configuration.scad>

module encoderSolid(){

  // Encoder shaft:
  cylinder(r=enc_shaft_radius, h=enc_shaft_length + enc_body_length);

  // Encoder body:
  cylinder(r=enc_body_radius, h=enc_body_length);
}

module encoder(){
  color("Aqua"){
    difference(){
      encoderSolid();
      screwHoles();
    }
  }
}

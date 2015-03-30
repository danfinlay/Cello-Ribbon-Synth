bearing_d = 22; // Bearing Diameter
bearing_hub_d = 8; // Bearing Hub Diameter
bearing_hub_height = 22; // Height of the center of the bearing
bearing_depth = 10; // Bearing depth

mount_screw_r = 2; // Mount screw radius
mount_plate_h = 3; // Mount plate height
mount_thickness = 4; // Mount thickness

back_plate_depth = 4; // Back plate depth

// Mount base:
cube([bearing_d + mount_thickness * 2 + mount_screw_r * 8,
      bearing_depth + back_plate_depth, mount_plate_h]);

// Support structure:
translate([mount_screw_r * 4,
  0, 0])
  cube([bearing_d + mount_thickness * 2,
        bearing_depth + back_plate_depth,
        bearing_hub_height]);

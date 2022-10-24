module spaghetti_U(
    length,
    hole_width,
    border_width,
    thickness, 
    cut_offsets,
    cut_depths
){
    width = hole_width + 2*border_width;
    // U shape
    difference(){
        cube([length, width, thickness]);
        translate([border_width, border_width, 0])
            cube([length, hole_width, thickness]);
    }
    // walls
    // right wall
    translate([0,-thickness,0])
        difference(){
            cube([length, thickness, 2*thickness]);
            //cuts
            for(cut = [0:len(cut_offsets)-1])
            for(i=[(border_width/cut_offsets[cut])+1: length/cut_offsets[cut]])
                translate([i*cut_offsets[cut], thickness, 2*thickness])
                    rotate([90,0,0])
                        cylinder(thickness, r=cut_depths[cut]);
        }
    // left wall
    translate([0,width,0])
        cube([length, thickness, 2*thickness]);
    // hole
    translate([0, border_width, thickness])
        cube([border_width, thickness, thickness]);
    translate([0,-thickness, 2*thickness])
        cube([border_width, border_width+2*thickness, thickness]);
};

module spaghetti_L(
    length,
    hole_width,
    border_width,
    thickness
){
    width = hole_width + 2*border_width;
    cube([length, border_width, thickness]);
    translate([length-border_width, 0, 0])
        cube([border_width, width, thickness]);
    translate([length-2*border_width, width-border_width, 0])
        cube([border_width, border_width, thickness]);
};

translate([0, 40, 0])
    spaghetti_U(50, 20, 5, 2, [10, 2.5], [0.5,0.25]);
spaghetti_L(50, 20, 5, 2);

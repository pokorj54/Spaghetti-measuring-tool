module spaghetti_U(
    length,
    hole_width,
    border_width,
    thickness
){
    width = hole_width + 2*border_width;
    difference(){
        cube([length, width, thickness]);
        translate([border_width, border_width, 0])
            cube([length, hole_width, thickness]);
    }
    for  (i = [-thickness, width])
        translate([0,i,0])
            cube([length, thickness, 2*thickness]);
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
    spaghetti_U(50, 20, 5, 2);
spaghetti_L(50, 20, 5, 2);

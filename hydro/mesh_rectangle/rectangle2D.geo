l_out = 0.2;
// Point of the domain
Point(1) = {0, 0, 0, l_out};
Point(2) = {10, 0, 0, l_out};
Point(3) = {10, 1, 0, l_out};
Point(4) = {0, 1, 0, l_out};
// Lines between points
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
// Curve Loops
Curve Loop(1) = {1, 2, 3, 4}; // Line Loop
// Plane Surface
Plane Surface(1) = {1};
// Physical groups
// Lines
Physical Curve("L_bottom", 1) = {1};
Physical Curve("L_top", 2) = {3};
Physical Curve("L_left", 3) = {4};
Physical Curve("L_right", 4) = {2};
// Surfaces
Physical Surface("All") = {1};

l_in = 0.1;
l_out = 0.5;
// Point of the domain
Point(1) = {0, 0, 0, l_in};
Point(2) = {20, 0, 0, l_out};
Point(3) = {20, 20, 0, l_out};
Point(4) = {0, 20, 0, l_out};
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
// Points
Physical Point("A", 1) = {1};
// Lines
Physical Curve("L_bottom", 2) = {1};
Physical Curve("L_top", 3) = {3};
Physical Curve("L_left", 4) = {4};
Physical Curve("L_right", 5) = {2};
// Surfaces
Physical Surface("All", 6) = {1};

l_out = 1.0;
l_in = 0.1;
// Point of the domain
Point(1) = {0, 0, 0, l_out};
Point(2) = {10, 0, 0, l_out};
Point(3) = {10, 5-0.1, 0, l_in};
Point(4) = {10, 5+0.1, 0, l_in};
Point(5) = {10, 10, 0, l_out};
Point(6) = {0, 10, 0, l_out};
Point(7) = {0, 5+0.1, 0, l_in};
Point(8) = {0, 5-0.1, 0, l_in};
// Lines between points
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 1};
Line(9) = {8, 3};
Line(10) = {7, 4};
// Curve Loops
Curve Loop(1) = {1, 2, -9, 8}; // Line Loop
Curve Loop(2) = {4, 5, 6, 10};
Curve Loop(3) = {9, 3, -10, 7};
// Plane Surface
Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
// Physical groups
// Lines
Physical Curve("L_bottom", 1) = {8, 1, 2};
Physical Curve("L_top", 2) = {4, 5, 6};
Physical Curve("L_left", 3) = {7};
Physical Curve("L_right", 4) = {3};
// Surfaces
Physical Surface("Bottom") = {1};
Physical Surface("Top") = {2};
Physical Surface("Middle") = {3};

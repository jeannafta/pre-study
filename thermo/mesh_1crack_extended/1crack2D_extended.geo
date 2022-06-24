l_out = 1.0;
l_in = 0.1;
w_crack = 0.1;
// Point of the domain
Point(1) = {0, 0, 0, l_out};
Point(2) = {20, 0, 0, l_out};
Point(3) = {20, 20, 0, l_out};
Point(4) = {0, 20, 0, l_out};
Point(5) = {5, 10-w_crack, 0, l_in};
Point(6) = {15, 10-w_crack, 0, l_in};
Point(7) = {15, 10+w_crack, 0, l_in};
Point(8) = {5, 10+w_crack, 0, l_in};
// Lines between points
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 5};
// Curve Loops
Curve Loop(1) = {1, 2, 3, 4};
Curve Loop(2) = {5, 6, 7, 8};
// Plane Surface
Plane Surface(1) = {1, 2}; // pour la première surface il faut aussi donner la 2ème curve loop car c'est aussi un bord interne
Plane Surface(2) = {2};
// Boolean because otherwise both meshes are superposed
BooleanFragments{ Surface{1}; Delete; }{ Surface{2}; Delete; }
// Physical groups
// Lines
Physical Curve("L_ext", 1) = {1, 2, 3, 4};
Physical Curve("L_int_bottom", 2) = {5};
Physical Curve("L_int_top", 2) = {7};
Physical Curve("L_int_left", 3) = {8};
Physical Curve("L_int_right", 4) = {6};
// Surfaces
Physical Surface("Rock") = {1};
Physical Surface("Crack") = {2};

l_rock = 1;
l_cracks = 0.1;

// Point of the domain
Point(1) = {0, 0, 0, l_rock};
Point(2) = {80, 0, 0, l_rock};
Point(3) = {80, 80, 0, l_rock};
Point(4) = {0, 80, 0, l_rock};
Point(5) = {0, 45+0.1, 0, l_cracks};
Point(6) = {30, 45+0.1, 0, l_cracks};
Point(7) = {0, 45-0.1, 0, l_cracks};
Point(8) = {30, 45-0.1, 0, l_cracks};
Point(9) = {0, 35+0.1, 0, l_cracks};
Point(10) = {30, 35+0.1, 0, l_cracks};
Point(11) = {0, 35-0.1, 0, l_cracks};
Point(12) = {30, 35-0.1, 0, l_cracks};
// Lines between points
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 8};
Line(7) = {8, 7};
Line(8) = {7, 5};
Line(9) = {7, 9};
Line(10) = {9, 10};
Line(11) = {10, 12};
Line(12) = {12, 11};
Line(13) = {11, 9};
Line(14) = {11, 1};
// Curve Loops
Curve Loop(1) = {1, 2, 3, 4, -8, 9, -13, 14};
Curve Loop(2) = {5, 6, 7, 8};
Curve Loop(3) = {10, 11, 12, 13};
// Plane Surface
Plane Surface(1) = {1, 2, 3}; // pour la première surface il faut aussi donner la 2ème et la 3ème curve loop car c'est aussi un bord interne
Plane Surface(2) = {2};
Plane Surface(3) = {3};
// Physical groups
// Lines
Physical Curve("L_ext", 1) = {1, 2, 3};
Physical Curve("L_crack_up", 2) = {8};
Physical Curve("L_crack_down", 3) = {13};
// Surfaces -> Attention ici j'ai inversé les deux, à corriger. Le notebook prend en compte cette erreur. 
Physical Surface("Cracks") = {1};
Physical Surface("Rock") = {2, 3};


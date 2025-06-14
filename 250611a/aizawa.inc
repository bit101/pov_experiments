
#declare X = 0.1;
#declare Y = 0.3;
#declare Z = 0.3;

#declare A = 0.97;
#declare B = 0.7;
#declare C = 0.6;
#declare D = 3.5;
#declare E = 0.25;
#declare F = 0.1;
#declare DT = 0.01;
#declare Cz = -0.6;

#declare DX = function(x, y, z) {
  x + ((z - B) * x - D * y) * DT
};
#declare DY = function(x, y, z) {
  y + (D * x + (z - B) * y) * DT
};
#declare DZ = function(x, y, z) {
  z + (C + A * z - z * z * z / 3 - (x * x + y * y ) * (1 + E * z) + F * z * x * x * x) * DT
};

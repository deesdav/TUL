A = [1, 2, 3; 4, 5, 6; 7, 8, 9];
B = [1, 4, 7; 2, 5, 8; 3, 6, 9];

disp(A+B);
disp(A*B);
disp(B*A);
M = [2, 1, 0, 0; 1, 2, 1, 0; 0, 1, 2, 1; 0, 0, 1, 2];
b = [3;4;4;3];
dips(inv(M));
disp(inv(M)*M);
disp(M*inv(M));
disp(M\b);
disp(M*[1;1;1;1]);
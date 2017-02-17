%Test function D = D06 (f,h1,h2)
%Test_D06
% 
clc, close all,
%Test 1
h1 =9;
h2 = 20;
f = 200;
'Test 1' 
Df = 0.0000389*200*9*20;
Dh = 4.1*(sqrt(9)+sqrt(20));
a = Df*Dh/(Df+Dh);
b = D06(f,h1,h2);
isequal(a,b)
%Test 1 end
%Test 2
h1 =9;
h2 = 20;
f = .1;
'Test 2' 
a = 0.001;
b = D06(f,h1,h2);
isequal(a,b)
%Test 1 end
%Test_V
% function deg = V(Kv,h1)
% Calculates v for Annex 5 section 4.3 case b
% error if input for kv is not a nominal frequency.
clc, close all, clear all
%Test 1 begin
h1 = -10;
Kv = 100;
Test = 'Test 1'
a = 1.35*atand(-h1/9000);
isequal(a,V(Kv,h1)) 
%Test 1 end
%Test 2 begin
h1 = 20;
Kv = 600;
Test = 'Test 2'
a = 3.31*atand(-h1/9000);
isequal(a,V(Kv,h1)) 
%Test 2 end
%Test 3 begin
h1 = 20;
Kv = 2000;
Test = 'Test 3'
a = 6*atand(-h1/9000);
isequal(a,V(Kv,h1)) 
%Test 3 end

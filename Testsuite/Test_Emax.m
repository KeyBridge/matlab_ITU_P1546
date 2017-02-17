%Test Emax
clc, close all, clear all
%Test 1 begin
d = 300;
t = 50;
path = 'Sea';
Test = 'Test 1'
a = 106.9-20*log10(d) + 2.38*(1-exp(-d/8.94))*log10(50/t);
isequal(a,Emax(d,t,path)) 
%Test 1 end
%Test 2 begin
d = 300;
t = 50;
path = 'Land';
Test = 'Test 2'
a = 106.9-20*log10(d);
isequal(a,Emax(d,t,path)) 
%Test 2 end
%Test 3 begin
d = 300;
t = 1;
path = '';
Test = 'Test 3'
isnan(Emax(d,t,path))
%Test 3 end


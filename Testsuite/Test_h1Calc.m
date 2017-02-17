%Test h1Calc
clc, close all, clear all
%Test 1 begin
d = 1;
path = 'Sea';
heff = 20;
ha = 25;
hb = 10;
Test = 'Test 1'
isequal(20,h1Calc(d,heff,ha,hb,path)) %result should be 20
%Test 1 end
%Test 2 begin
d = 1;
path = 'Land';
heff = 20;
ha = 25;
hb = 10;
Test = 'Test 2'
isequal(25,h1Calc(d,heff,ha,hb,path)) %result should be 25
%Test 2 end
%Test 3 begin
d = 1;
path = '';
heff = 20;
ha = 25;
hb = 10;
Test = 'Test 3'
isnan(h1Calc(d,heff,ha,hb,path)) %result should be 25
%Test 3 end
%Test 4 begin
d = 1;
path = 'Land';
heff = 20;
ha = NaN;
hb = 10;
Test = 'Test 4'
isnan(h1Calc(d,heff,ha,hb,path)) %result should be NaN
%Test 4 end
%Test 5 begin
d = 1;
path = 'Land';
heff = [];
ha = -10;
hb = [];
Test = 'Test 5'
isequal(-10,h1Calc(d,heff,ha,hb,path)) %result should be -10
%Test 5 end
%Test 6 begin
d = 6;
path = 'Land';
heff = 14;
ha = 15;
hb = [];
Test = 'Test 6'
isequal(ha+(heff-ha)*(d-3)/12,h1Calc(d,heff,ha,hb,path)) %result should be NaN
%Test 6 end
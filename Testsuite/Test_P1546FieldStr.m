% Test 	E = P1546FieldStrbeta(f,d,t,heff,ha,hb,path)
clc

% test 1 begin
% Simple case effective height is known. All the value are on the curve
% Land propagation is assumed.
'Test 1'
f = 100;
d = 1000;
t = 10;
heff = 20;
E = P1546FieldStr(d,f,t,heff)
ValuefromTable = -62.94847;
isequal(ValuefromTable, E)
% test 1 end 
% output
    % ans =
    % Test 1
    % E =
    %   -62.9485
    % ans =
    %      1
    
% test 2 begin
% Lower limit of f, heff is less than 10m possibly putting systems into
% step82
'Test 2'
f = 30;
d = 975;
t = 10;
heff = 9;
E = P1546FieldStr(d,f,t,heff)
% test 2 end
% test 3 begin
% using ha and more limits of the progation model.
'Test 3'
f = 3000;
d = 1;
t = 50;
heff = 0;
ha = 1500;

E = P1546FieldStr(d,f,t,heff,ha)
% test 3 end
% test 4 begin
% generating several value to make a curve over a distance. funny values if
% h1 is below 10 m and d is small (30<).
f = 600;
h1 = 15;
d = [  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13,...
    14, 15, 16, 17, 18, 19, 20, 25, 30, 35, 40, 45, 50,...
    55, 60, 65, 70, 75, 80, 85, 90, 95,100,110,120,130,...
    140,150,160,170,180,190,200,225,250,275,300,325,350,...
    375,400,425,450,475,500,525,550,575,600,625,650,675,...
    700,725,750,775,800,825,850,875,900,925,950,975,1000];
y = 1:1:length(d);
for x=1:length(d)
    y(x) = P1546FieldStr(d(x),f,t,h1,h1,[],'Warm');
end
figure(1);
semilogx(d,y,'b--')
hold on
% test 4 end
% test 5 begin
% complicated example with several adjustments
f = 2000;
h1 = 60;
h2 = 300;
tca = 10;
eff2 = 15;
tropospheric = y;
for x=1:length(d)
    y(x) = P1546FieldStr(d(x),f,t,h1,h1)...
    -Step_12(f,tca)-Step_14(h2,f,'Land','open',d,h1);
tropospheric(x) = Step_13(d(x),f,t,tca,eff2);
end

semilogx(d,y,'b-')
hold off
% test 5 end
clc
%Test function % function E =
% step7_normal(figureStep6,h1,dinf,dsup,d,generalPath,finf,fsup,f,Emax,t)
%test init
%     time,path,freq,figure 
figure = [50, 2, 600, 12; 50, 2, 2000, 20];
figureStep6 = figure;
tabulatedValues = xlsread('Rec_P_1546_2_Tab_values.xls',figure(1,4), 'B6:K84');

%step7_normal(figureStep6,h1,dinf,dsup,d,generalPath,finf,fsup,f,Emax,t)
%Test 1 begin
h1 = 300;
d = 14.5;
dsup = 15;
dinf = 14;
f = 600;
t = 50;
Emaxvalue = 10;
'Test 1'
a = Emaxvalue;
isequal(a,step7_normal(figure,h1,dinf,dsup,d,'Sea',f,Emaxvalue,t)) 
%Test 1 end
%Test 2 begin
'Test 2'
Emaxvalue = 1000;
a = 83.959977+(83.353634-83.959977)*log10(d/dinf)/log10(dsup/dinf);
isequal(round(a*10000)/10000,round(step7_normal(figure,h1,dinf,dsup,d,'Sea',f,Emaxvalue,t)*10000)/10000)
%Test 2 end
%Test 3 begin
'Test 3'
Emaxvalue = 1000;
finf = 600;
fsup = 2000;
f = 2500;
a = 83.67648585910564;
isequal(round(a*10000)/10000,round(step7_normal(figure,h1,dinf,dsup,d,'Sea',f,Emaxvalue,t)*10000)/10000) 
%Test 3 end
clc, close all,
%Test function E = step81(tabulatedValues,h1,dinf,dsup,d,Emax)
%test init
%     time,path,freq,figure 
figure = [50,1,100,1;
          10,1,100,2;
           1,1,100,3;
          50,2,100,4;
          10,3,100,5;
           1,3,100,6;
          10,4,100,7;
           1,4,100,8;
          50,1,600,9;
          10,1,600,10;
           1,1,600,11;
          50,2,600,12;
          10,3,600,13;
           1,3,600,14;
          10,4,600,15;
           1,4,600,16;
          50,1,2000,17;
          10,1,2000,18;
           1,1,2000,19;
          50,2,2000,20;
          10,3,2000,21;
           1,3,2000,22;
          10,4,2000,23;
           1,4,2000,24;];
        %p = 50%          %path = Sea    %frequency = 600 MHz
idx = (figure(:,1)==50) & (figure(:,2)==2) & (figure(:,3)==600);
figure = figure(idx,:);
tabulatedValues = xlsread('Rec_P_1546_2_Tab_values.xls',figure(1,4), 'B6:K84');

%Test 1 begin
h1 = 300;
d = 14.5;
dsup = 15;
dinf = 14;
Emax = 10;
Test = 'Test 1'
a = Emax;
isequal(a,step81(tabulatedValues,h1,dinf,dsup,d,Emax)) 
%Test 1 end
%Test 2 begin
Emax = 1000;
Test = 'Test 2'
a = 83.959977+(83.353634-83.959977)*log10(d/dinf)/log10(dsup/dinf);
isequal(a,step81(tabulatedValues,h1,dinf,dsup,d,Emax)) 
%Test 2 end
%Test 3 begin
h1 = 1400;
Test = 'Test 3'
a = 83.976265+(83.37648-83.976265)*log10(d/dinf)/log10(dsup/dinf);
% commented out lines were for tracing an error with interpolating
    %h1 = 600;
    %step814_815(tabulatedValues,h1,dinf,dsup,d)
    %h1=1200;
b = 83.977367+(83.378068-83.977367)*log10(d/dinf)/log10(dsup/dinf);
    %step814_815(tabulatedValues,h1,dinf,dsup,d)
    %h1 = 1400;
c = a+(b-a)*log10(h1/600)/log10(1200/600);
    %step81(tabulatedValues,h1,dinf,dsup,d,Emax)
isequal(c,step81(tabulatedValues,h1,dinf,dsup,d,Emax)) 
%Test 3 end
%Test 4 
tabulatedValues = xlsread('Rec_P_1546_2_Tab_values.xls',19, 'B6:K84');
h1 = 191;
dinf = 975;
dsup = 1000;
d = 984;
Line37 = step81(tabulatedValues,h1,dinf,dsup,d,Emax)
%Test 4 end
%Test 5
tabulatedValues = xlsread('Rec_P_1546_2_Tab_values.xls',22, 'B6:K84');
h1 = 448;
dinf = 975;
dsup = 1000;
d = 988;
Line47 = step81(tabulatedValues,h1,dinf,dsup,d,Emax)
%test 5 end
%test 6
tabulatedValues = xlsread('Rec_P_1546_2_Tab_values.xls',21, 'B6:K84');
h1 = 660;
dinf = 650;
dsup = 675;
d = 672;
Line45 = step81(tabulatedValues,h1,dinf,dsup,d,Emax)
%test 6 end
tabulatedValues = xlsread('Rec_P_1546_2_Tab_values.xls',10, 'B6:K84');
h1 = 341;
dinf = 40;
dsup = 45;
d = 44;
Line19 = step81(tabulatedValues,h1,dinf,dsup,d,Emax)
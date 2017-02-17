%Test step814_815(tabulatedValues,h1,dinf,dsup,d)
%test init
clc, close all, clear all

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
        %p = 10%          %path = Land    %frequency = 100MHz
idx = (figure(:,1)==10) & (figure(:,2)==1) & (figure(:,3)==100);
figure = figure(idx,:);
tabulatedValues = xlsread('Rec_P_1546_2_Tab_values.xls',figure(1,4), 'B6:K84');

%Test 1 begin
h1 = 300;
d = 14.5;
dsup = 15;
dinf = 14;
Test = 'Test 1'
a = 74.689515+(73.726774-74.689515)*log10(d/dinf)/log10(dsup/dinf);
isequal(a,step814_815(tabulatedValues,h1,dinf,dsup,d)) 
%Test 1 end
%Test 2 begin
h1 = 10;
d = 989;
dsup = 1000;
dinf = 975;
Test = 'Test 2'
a = -61.429579+((-63.122742)-(-61.429579))*log10(d/dinf)/log10(dsup/dinf);
isequal(a,step814_815(tabulatedValues,h1,dinf,dsup,d)) 
%Test 2 end
%Test 3 begin
h1 = 10;
d = 1000;
dsup = 1000;
dinf = 1000;
Test = 'Test 3'
a = -63.122742;
isequal(a,step814_815(tabulatedValues,h1,dinf,dsup,d)) 
%Test 3 end
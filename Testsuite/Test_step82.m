clc, close all,
%Test function E =
%step82(tabulatedValues,h1,dinf,dsup,d,path,fnom,f,Emax,t)
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
        %p = 1%          %path = Sea    %frequency = 600 MHz
idx = (figure(:,1)==1) & (figure(:,2)==2) & (figure(:,3)==600);
if (idx == 0)
    idx = (figure(:,1)==1) & ((figure(:,2)==2)|(figure(:,2)==4)) & (figure(:,3)==600);
end
figure = figure(idx,:);
tabulatedValues = xlsread('Rec_P_1546_2_Tab_values.xls',figure(1,4), 'B6:K84'); %fig 16
        %p = 10%          %path = Land    %frequency = 2000 MHz
%idx = (figure(:,1)==10) & (figure(:,2)==1) & (figure(:,3)==2000);
figure =[10,1,2000,18]; %figure(idx,:);
tabulatedValues2 = xlsread('Rec_P_1546_2_Tab_values.xls',figure(1,4), 'B6:K84');

%step82(tabulatedValues,h1,dinf,dsup,d,path,fnom,f,Emax,t)

%Test 1 begin
h1 = 3;
d = 14.5;
dsup = 15;
dinf = 14;
Emax = 10;
path = 'Sea';
f = 900;
fnom = 600;
t = 1;
'Test 1'
a = 68.17971399352948;
isequal(a,step82(tabulatedValues,h1,dinf,dsup,d,path,fnom,f,Emax,t)) 
%Test 1 end
%Test 2 begin
'Test 2'
h1 = 5;
path = 'Land';
a = 36.99412661826555;
isequal(a,step82(tabulatedValues2,h1,dinf,dsup,d,path,fnom,f,Emax,t))
%Test 2 end
%Test 3 begin
'Test 3'
h1 = -4;
path = 'Land';
a = 82.93910306194451;
isequal(a,step82(tabulatedValues2,h1,dinf,dsup,d,path,fnom,f,Emax,t))
%Test 3 end
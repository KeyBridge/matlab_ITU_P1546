clc
%Test function E = step6_10(figure,h1,dinf,dsup,d,path,f,Emaxvalue,t)
%test init
figure = [50,1,100 ,1;
          10,1,100 ,2;
           1,1,100 ,3;
          50,2,100 ,4;
          10,3,100 ,5;
           1,3,100 ,6;
          10,4,100 ,7;
           1,4,100 ,8;
          50,1,600 ,9;
          10,1,600 ,10;
           1,1,600 ,11;
          50,2,600 ,12;
          10,3,600 ,13;
           1,3,600 ,14;
          10,4,600 ,15;
           1,4,600 ,16;
          50,1,2000,17;
          10,1,2000,18;
           1,1,2000,19;
          50,2,2000,20;
          10,3,2000,21;
           1,3,2000,22;
          10,4,2000,23;
           1,4,2000,24;];
idx = figure(:,2) == 1;
figureLand = figure(idx,:);
idx = figure(:,2) > 1;
figureSea = figure(idx,:);
%step6_10(figure,h1,dinf,dsup,d,path,f,Emaxvalue,t)
%Test 1 begin
h1 = 300;
d = 989;
dsup = 1000;
dinf = 975;
f = 150;
finf = 100;
fsup = 600;
t = 10;
path = 'Land';
Emaxvalue = Emax(d,t,path);
'Test 1'
a = -58.916734443903344;
isequal(a,step6_10(figure,h1,dinf,dsup,d,path,f,Emaxvalue,t)) 
%Test 1 end
%Test 2 begin
'Test 2'
t = 15;
a = -60.1829612229767;
isequal(a,step6_10(figure,h1,dinf,dsup,d,path,f,Emaxvalue,t)) 
%Test 2 end
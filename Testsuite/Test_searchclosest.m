clc

x=[2 7 10 12 15 20 25]; v=16; %OK
[i,cv] = searchclosest(x,v); %i = 15 20
isequal([i,cv],[15 20])
x=[-1 0 7 10 12 15 20 25]; v=-4; %OK
[i,cv] = searchclosest(x,v); %i = -1 0
isequal([i,cv],[-1 0])
x=[-2 2 7 10 12 15 20 25]; v=2; %OK
[i,cv] = searchclosest(x,v); %i = 2 cv = 2
isequal([i cv],[2 2])
x=[-2 2 7 10 12 15 20 25]; v=35; %OK
[i,cv] = searchclosest(x,v); %i = 20 25
isequal([i,cv],[20 25])
x=[-2 2 7 10 12 15 20 25]; v=12; %OK
[i,cv] = searchclosest(x,v); %i = 12 cv = 12
isequal([i cv],[12 12])
% % --------------------------------------------
% test modified for changes in search closest
% Author Jeff Statham
% % % --------------------------------
% % % Author: Dr. Murtaza Khan
% % % Email : drkhanmurtaza@gmail.com
% % % --------------------------------
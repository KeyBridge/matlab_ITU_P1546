%Test function [dinf, dsup] = FindDNominals(d)
%Test_FindDNominals
% 
clc, close all,
d =975; %OK
[dinf,dsup] = FindDNominals(d); %dinf = 16 dsup = 16
isequal([dinf,dsup],[975 975])
d =1200; %OK
[dinf,dsup] = FindDNominals(d); %dinf = 975 dsup = 1000
isequal([dinf,dsup],[975 1000])

d =0; %OK
[dinf,dsup] = FindDNominals(d); %dinf = 1 dsup = 2
isequal([dinf,dsup],[1 2])

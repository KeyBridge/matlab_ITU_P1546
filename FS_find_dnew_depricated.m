% FS_FIND_D		ITU 1546 Field strength calculator: Find d for known Fieldstrength
%
%	d = FS_find_dnew(FS,f,heff,T,path)
%   h2 correction is also applied to result to get a more accurate
%   distance h2 correction assumes open terrain.

%	- where:
%	  FS: Wanted fieldstrenth in dBµV/m
%	  d:  distance from transmitter [km]
%	  heff: transmitter antenna effective height [m] assuming is equal to
%	  ha no effective terrain data known. 
%		range: 10-1200 m,
%	  T:  Time %, may be 50< t >1. Field strength >= Result of this function for T% of time
%     

% Pierre Soelberg, http://broadcast-it.com, 2005-10-06
% modified by Jef Statham for a less accurate use.

function d =FS_find_dnew(FS,f,heff,T,path,h2)

% Make a serious search until
x = [  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13,...
    14, 15, 16, 17, 18, 19, 20, 25, 30, 35, 40, 45, 50,...
    55, 60, 65, 70, 75, 80, 85, 90, 95,100,110,120,130,...
    140,150,160,170,180,190,200,225,250,275,300,325,350,...
    375,400,425,450,475,500,525,550,575,600,625,650,675,...
    700,725,750,775,800,825,850,875,900,925,950,975,1000];
y = 1:1:length(x);
w = y;
if strcmp(path,'Warm')||strcmp(path,'Cold')
    generalpath = 'Sea';
else
    generalpath = 'Land';
end

for i=1:length(x)
    y(i) = P1546FieldStrbeta(x(i),f,T,heff,heff,[],path,FS);
    w(i) = Step_14(h2,f,generalpath,'open',x(i),heff);
end
%[a,b] = min(abs(y));	% b indicates the position of y with lower abs y.
[a,b] = min(y+w);						% its value x(b) is used as start
                                        % guess in fzero.
d = x(b);
%options = optimset('Display','off');
%d =fzero('P1546FieldStrbeta',x(b),options,f,T,heff,[],[],'Warm');
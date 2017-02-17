function [d,flag]= find_d(FS,f,heff,T,path,h2)
% Peverted code the code find the closest value d value that equates the
% formula to 0;

% Based on code Obtained from
% http://www.mathworks.com/matlabcentral/fileexchange/15088
% % Algorithm
% % First binary search is used to find closest value of d that equates
% % p.1546 to 0. Sets a flag if d is the last value or first value.
% %
% % INPUT:
% % FS: the offset to find d value closest to given Field strenght.
% % F: frequency curves to select.
% % heff: the larger height of the transmit recieve pair
% % T: the percent time curve
% % path: propagation path value can be 'Land' 'Sea' 'Warm' 'Cold' 
% % h2: the smaller height of the transmit/recieve pair
% % 
% % OUTPUT:
% % d: the distance value that is closest to 0 from negative or positive
% side
% % flag: 1 if value is first element of d -1 if last element of d 0
% otherwise.



x = [  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13,...
    14, 15, 16, 17, 18, 19, 20, 25, 30, 35, 40, 45, 50,...
    55, 60, 65, 70, 75, 80, 85, 90, 95,100,110,120,130,...
    140,150,160,170,180,190,200,225,250,275,300,325,350,...
    375,400,425,450,475,500,525,550,575,600,625,650,675,...
    700,725,750,775,800,825,850,875,900,925,950,975,1000];
y = zeros(1,length(x))+NaN; 
if strcmp(path,'Warm')||strcmp(path,'Cold')
    generalpath = 'Sea';
else
    generalpath = 'Land';
end
from=1;
to=length(x);

% % Phase 1: Binary Search
lookforpositive = true;
while from<=to
    mid = round((from + to)/2);
    y(mid) = P1546FieldStr(x(mid),f,T,heff,heff,[],path,FS)+ Step_14(h2,f,generalpath,'open',x(mid),heff);
    if y(mid) == 0
        d = x(mid);
        return
    elseif ((y(mid)<0) && lookforpositive)    % x(mid) < v
        to=mid-1;
        if (y(mid)>0)
            lookforpositive = false;
        end
    else              % x(mid) > v
        from=mid+1;
        if (y(mid)<0)
            lookforpositive = true;
        end
    end
end
if (to == 0)
    d = x(1);
    flag = -1;
    return
elseif from == (length(x)+1)
    d = x(end);
    flag = 1;
    return
end
[a b] = min(abs(y(to:from)));
if b == 1
    d = x(to);
    flag = 0;
    return
else
    d = x(from);
    flag = 0;
end
% % % original binary search by:
% % % --------------------------------
% % % Author: Dr. Murtaza Khan
% % % Email : drkhanmurtaza@gmail.com
% % % --------------------------------
end
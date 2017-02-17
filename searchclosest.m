%The following code tidbit is by Dr. Murtaza Khan, modified to return
%vector y instead of index i if no exact value found. Also added
%functionality for when v is outside of vector x min and max.
%23 May 2007 (Updated 09 Jul 2009)
% Obtained from http://www.mathworks.com/matlabcentral/fileexchange/15088
%Begin
% % Algorithm
% % First binary search is used to find v in x. If not found
% % then range obtained by binary search is searched linearly
% % to find the closest value.
% %
% % INPUT:
% % x: vector of numeric values,
% % x should already be sorted in ascending order
% %    (e.g. 2,7,20,...120)
% % v: numeric value to be search in x
% %
% % OUTPUT:
% % i: lower or equal value to v in x
% % cv: value that is equal or higher to v in x

function [i,cv] = searchclosest(x,v)
if x(end) < v
    i =x(end-1:end);
    cv = i(2);
    i = i(1);
    return
elseif x(1) > v
    i = x(1:2);
    cv = i(2);
    i = i(1);
    return
end
from=1;
to=length(x);

% % Phase 1: Binary Search
while from<=to
    mid = round((from + to)/2);
    diff = x(mid)-v;
    if diff==0
        i=v;
        cv=v;
        return
    elseif diff<0     % x(mid) < v
        from=mid+1;
    else              % x(mid) > v
        to=mid-1;
    end
end
i = x(to:from);
cv = i(2);
i = i(1);

% % % --------------------------------
% % % Author: Dr. Murtaza Khan
% % % Email : drkhanmurtaza@gmail.com
% % % --------------------------------
end
%End tidbit
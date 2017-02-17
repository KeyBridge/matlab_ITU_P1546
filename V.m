% function deg = V(Kv,h1)
% Calculates v for Annex 5 section 4.3 case b
% error if input for kv is not a nominal frequency.

function deg = V(Kv,h1)
if Kv == 100
    deg = 1.35*atand(-h1/9000); %equ'n (12c and 12b)
return
elseif Kv == 600
    deg = 3.31*atand(-h1/9000); %equ'n (12c and 12b)
return
elseif Kv == 2000
    deg = 6*atand(-h1/9000);    %equ'n (12c and 12b)
return
end
error('Invalid frequency input');
end
% 17 An approximation to the 0.6 Fresnel clearance path length
% The path length which just achieves a clearance of 0.6 of the first 
% Fresnel zone over a smooth curved Earth, for a given frequency and 
% antenna heights h1 and h2, is given approximately by:
% some formula (38)
% where:
% Df : frequency-dependent term
% = 0.0000389 f h1h2 km (39a)
% Dh : asymptotic term defined by horizon distances
% = 4.1( h1+ h2 ) km (39b)
% f : frequency (MHz)
% h1, h2 : antenna heights above smooth Earth (m).
% In the above equations, the value of h1 must be limited, if necessary, 
% such that it is not less than zero. Moreover, the resulting values of D06
% must be limited, if necessary, such that it is not less than 0.001 km.
function D = D06(f,h1,h2)
Df = 0.0000389*f*h1*h2;             % equ'n (39a)
Dh = 4.1*(sqrt(h1)+sqrt(h2));       % equ'n (39b)
D = Df*Dh/(Df+Dh);                  % equ'n (38)
if D < 0.001
    D = 0.001;
end
end
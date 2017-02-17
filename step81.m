% Step 8: Obtain the field strength exceeded at 50% locations for a
% receiving/mobile antenna at the height of representative clutter, R,
% above ground for the required distance and transmitting/base antenna
% height as follows:
    % Step 8.1: For a transmitting/base antenna height h1 equal to or
    % greater than 10 m follow Steps 8.1.1 to 8.1.6:
        % Step 8.1.1: Determine the lower and higher nominal h1 values
        % using the method given in Annex 5, § 4.1. If h1 coincides with
        % one of the nominal values 10, 20, 37.5, 75, 150, 300, 600 or
        % 1 200 m, this should be regarded as the lower nominal value of h1
        % and the interpolation process of Step 8.1.6 is not required.

        % Step 8.1.2: For the lower nominal value of h1 follow Steps 8.1.3
        % to 8.1.5.
        
        % Step 8.1.3: For the lower nominal value of distance follow 8.1.4.
                
        % Step 8.1.4:
        % Step 8.1.5: 
                
        % Step 8.1.6: If the required transmitting/base antenna height, h1,
        % does not coincide with one of the nominal values, repeat Steps
        % 8.1.3 to 8.1.5 and interpolate/extrapolate for h1 using the
        % method given in Annex 5, § 4.1. If necessary limit the result to
        % the maximum given in Annex 5, § 2.
% function E = step81(tabulatedValues,h1,dinf,dsup,d,Emax)
%   
% tabulatedValues a matrix of value from a figure 1-24 of excel sheet of
%   values for recommendation. Expected range from table 'B6:K84' may still
%   work with different range value. results unexpected.
% h1 is the caculated h1 from h1Calc
% dinf and dsup must correspond to values in Table 1 of ITU-r p.1546 on
%   page 38 otherwise NaN will be returned
% d is the distance
% Emax is the max field strength if necessary to limit the result.
% 
% returns field strength otherwise NaN.

function E = step81(tabulatedValues,h1,dinf,dsup,d,Emax)
% double check h1
if ~(h1 >= 10)
    error('h1 is less then 10 for step81')
end
% obatin hsup and hinf
height = [10, 20, 37.5, 75, 150, 300, 600, 1200];
[hinf, hsup] = searchclosest(height,h1);

Eh1 = zeros(1,2);
arg = [hinf hsup];

for x=(hinf == hsup)+1:2
    Eh1(x) = step814_815(tabulatedValues,arg(x),dinf,dsup,d);
    
end 

if hinf ~= hsup
    Eh1 = Eh1(1)+(Eh1(2)-Eh1(1))*log10(h1/hinf)/log10(hsup/hinf); %equ'n (8)
else
    Eh1 = Eh1(2);
end
if Eh1 > Emax
    E = Emax;
    return
else
    E = Eh1;
    return
end
E = NaN;
end% function

% 4 Application of transmitting/base antenna height, h1
% The value of h1 controls which curve or curves are selected from which to 
% obtain field-strength values, and the interpolation or extrapolation 
% which may be necessary. The following cases are distinguished.

    % 4.1 Transmitting/base antenna height, h1, in the range 10 m to 3 000m
    % If the value of h1 coincides with one of the eight heights for which
    % curves are provided, namely 10, 20, 37.5, 75, 150, 300, 600 or 1 200m
    % the required field strength may be obtained directly from the plotted 
    % curves or the associated tabulations. Otherwise the required field
    % strength should be interpolated or extrapolated from field strengths 
    % obtained from two curves using:
    % E = Einf +(Esup ?Einf )log(h1 /hinf )/log(hsup /hinf ) dB(?V/m) (8)
    % where:
        % hinf : 600 m if h1 > 1 200 m, otherwise the nearest nominal effective
        % height below h1
        % hsup : 1 200 m if h1 > 1 200 m, otherwise the nearest nominal 
        % effective height above h1
        % Einf : field-strength value for hinf at the required distance
        % Esup : field-strength value for hsup at the required distance.
    % The field strength resulting from extrapolation for h1 > 1 200 m 
    % should be limited if necessary such that it does not exceed the 
    % maximum defined in § 2.
    % This Recommendation is not valid for h1 > 3 000 m.
% Step 8.1.4: Obtain the field strength exceeded at 50% locations
% for a receiving/mobile antenna at the height of representative
% clutter, R, for the required values of distance, d, and
% transmitting/base antenna height, h1.

% Step 8.1.5: If the required distance does not coincide with the
% lower nominal distance, repeat Step 8.1.4 for the higher nominal
% distance and interpolate the two field strengths for distance
% using the method given in Annex 5, § 5.

% function E = step814_815(tabulatedValues,h1,dinf,dsup)
% if only step 8.1.4 is needed pass the same value for dinf and dsup. 

% tabulatedValues a matrix of value from a figure 1-24 of excel sheet of
%   values for recommendation. Expected range from table 'B6:K84' may still
%   work with different range value. results unexpected.
% h1 must equal one of the nominal value 10,20,37.5,75,150,300,600,1200 if
%   not return is unknown.
% dinf and dsup must correspond to values in Table 1 of ITU-r p.1546 on
%   page 38 otherwise NaN will be returned
%
% Returns a single field strength value for the given parameters with or
% wit


function E = step814_815(tabulatedValues,h1,dinf,dsup,d)
eLookUp = tabulatedValues(1,:)== h1;
eLookUp = [tabulatedValues(:,1) tabulatedValues(:,eLookUp)];
Einf = eLookUp(:,1) == dinf;
Einf = eLookUp(Einf,2);
Esup = eLookUp(:,1) == dsup;
Esup = eLookUp(Esup,2);
if dsup ~= dinf
    Esup = eLookUp(:,1)==dsup;
    Esup = eLookUp(Esup,2);
    E = Einf+(Esup-Einf)*log10(d/dinf)/log10(dsup/dinf);    %equ'n (13)
    return
else
    E = Esup;
    return
end
E = NaN;
end
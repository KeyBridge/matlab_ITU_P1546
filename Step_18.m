% Step 18: If required, convert field strength to equivalent basic transmission loss for the path using
% the method given in Annex 5, § 16.
function lb = Step_18(fs,f)
    lb = 139.3-fs + 20*log10(f);  % equ'n (37)
end

% 16 Equivalent basic transmission loss
% When required, the basic transmission loss equivalent to a given field strength is given by:
% Lb =139.3-E+20log f dB (37)
% where:
% Lb : basic transmission loss (dB)
% E : field strength (dB(microV/m)) for 1 kW e.r.p.
% f : frequency (MHz).
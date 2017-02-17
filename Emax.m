% 2 Maximum field-strength values
% A field strength must not exceed a maximum value, Emax, given by:
    % Emax = Efs dB(?V/m) for land paths (1a)
    % Emax = Efs + Ese dB(?V/m) for sea paths (1b)
% where Efs is the free space field strength for 1 kW e.r.p. given by:
    % E fs =106.9?20log(d) dB(?V/m) (2)
% and Ese is an enhancement for sea curves given by:
    % Ese =2.38{1?exp(?d /8.94)}log(50/t) dB (3)
% where:
    % d : distance (km)
    % t : percentage time.
% In principle any correction which increases a field strength must not be
% allowed to produce values greater than these limits for the family of 
% curves and distance concerned. However, limitation to maximum values 
% should be applied only where indicated in Annex 6.

% Function will return NaN if missing path value.
function E = Emax(d,t,path)
Efs = 106.9-20*log10(d);
if strcmp(path,'Land')
    E = Efs;
    return
end
if strcmp(path,'Sea')
    E = Efs + 2.38*(1-exp(-d/8.94))*log10(50/t);
    return
end
E = NaN;
end
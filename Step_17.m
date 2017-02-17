% Step 17: If necessary, limit the resulting field strength to the maximum 
% given in Annex 5, § 2. If a mixed path calculation has been made for a 
% percentage time less than 50% it will be necessary to calculate the 
% maximum field strength by linear interpolation between the all-land and 
% all-sea values. This is given by:
% Emax = Efs + dsEse / dtotal dB(?V/m) (40)
% where:
% Efs : free-space field strength given by equation (2) in Annex 5, § 2
% Ese : enhancement at small time percentages for a sea path given by 
% equation (3) in Annex 5, § 2
% ds : the total sea distance (km)
% dtotal : the total path distance (km).
% E total field strength


function e = Step_17(E,Efs,Ese,ds,dtotal)
% Mulitpaths not implemented

e = max(E,(Efs+ ds*Ese/dtotal));
return
end
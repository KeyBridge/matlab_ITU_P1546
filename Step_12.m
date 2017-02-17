% Step 12: If information on the terrain clearance angle at a
% receiving/mobile antenna adjacent to land is available, correct the field
% strength for terrain clearance angle at the receiver/mobile using the
% method given in Annex 5, § 11.

% 11 Terrain clearance angle correction
% For land paths, and when the receiving/mobile antenna is on a land 
% section of a mixed path, if more precision is required for predicting the 
% field strength for reception conditions in specific areas, e.g. in a 
% small reception area, a correction may be made based on a terrain 
% clearance angle. The terrain clearance angle ?tca is given by:
% ?tca =? degrees (30)
% where 
% ? is the elevation angle of the line from the receiving/mobile antenna 
% which just clears all terrain obstructions in the direction of the 
% transmitter/base antenna over a distance of up to 16 km but not going 
% beyond the transmitting/base antenna.

% The calculation of ? should not take Earth curvature into account. ?tca 
% should be limited such that it is not less than +0.55° or more 
% than +40.0°.
% Where the relevant terrain clearance angle information is available, the 
% correction to be added to the field strength is calculated using:
% Correction = J (??) – J (?) dB (30a)
% where J(?) is given by equation (12a):
% ??=0.036 sqrt f (30b)
% ? =0.065 ?tca sqrt f (30c)
% ?tca : terrain clearance angle (degrees)
% f : required frequency (MHz).
% It should be noted that the land field-strength curves take account of 
% losses due to typical shielding of the receiving/mobile antenna by gently 
% rolling terrain. Thus the terrain clearance angle corrections are zero at 
% a small positive angle typical of receiving/mobile antenna positions.

% Figure 28 illustrates the terrain clearance angle correction for the 
% nominal frequencies.
function e = Step_12(f,tca)

v = 0.036*sqrt(f);      %equ'n (30b)
J = 6.9+20*log10(sqrt((v-0.1)^2+1)+v-0.1); %equ'n (12a)
v = 0.065*tca*sqrt(f);      %equ'n (30c)
e = J - 6.9+20*log10(sqrt((v-0.1)^2+1)+v-0.1); %equ'n (12a)

end
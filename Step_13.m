% Step 13: Calculate the estimated field strength due to tropospheric 
% scattering using the method given in Annex 5 § 13, and, if necessary, 
% adjust the final predicted field strength accordingly.

% 13 Correction based on tropospheric scattering
% There is a possibility that the field strength calculated using the 
% methods given in § 1 to 12 of this Annex is an underestimation, due to 
% not taking full account of tropospheric scattering. If terrain 
% information is available, a correction for tropospheric scattering should 
% be calculated using the following procedure.
%Calculate the path scattering angle in degrees, thetas, using:
% thetaS = 180*d/pi/4*3/6370 + eff + eff1 (33)

%where:
% eff: the h1 terminal’s terrain clearance angle in degrees calculated 
% using the method in § 4.3 case a), whether or not h1 is negative (degrees)
% eff1: the h2 terminal’s clearance angle in degrees as calculated in § 11, 
% noting that this is the elevation angle relative to the local horizontal 
% (degrees)
% d: path length (km)
% a: 6 370 km, radius of the Earth
% k: 4/3, effective Earth radius factor for median refractivity conditions.
% If thetas is less than zero, set thetas equal to zero.
% Calculate the field strength predicted for tropospheric scattering, Ets, using:
% Ets =24.4-0log(d)-10thetaS - Lf +0.15N0 +Gt dB(?V/m) (34)

% where:
% Lf : frequency-dependent loss = 5log( f )- 2.5(log( f )-3.3)^2 (34a)
% N0 = 325, median surface refractivity, N-units, typical of temperate climates
% Gt: time-dependent enhancement = 10.1(- log(0.02t))^0.7 (34b)
% d: path length or required distance (km)
% f: required frequency (MHz)
% t: required percentage of time.
function e = Step_13(d,f,t,eff,eff1)

thetaS = 180*d/pi/4*3/6370 + eff + eff1;        %equ'n (33)
if thetaS < 0
    thetaS = 0;
end
e = 24.4-20*log10(d)-10*thetaS -(5*log10(f)-2.5*(log10(f)-3.3)^2)+0.15*325+10.1*(-log10(0.02*t))^0.7; %equ'n (34),(34a),(34b)
end

% Step 8.2: For a transmitting/base antenna height h1 less than 10 m
% determine the field strength for the required height and distance
% using the method given in Annex 5, § 4.2. If h1 is less than zero,
% the method given in Annex 5, § 4.3 should also be used.

% function E = step82(tabulatedValues,h1,dinf,dsup,d,path,fnom,f,Emaxvalue,t)
%   
% tabulatedValues a matrix of value from a figure 1-24 of excel sheet of
%   values for recommendation. Expected range from table 'B6:K84' may still
%   work with different range value. results unexpected.
% h1 is the caculated h1 from h1Calc
% dinf and dsup must correspond to values in Table 1 of ITU-r p.1546 on
%   page 38 otherwise NaN will be returned
% d is the distance
% path either 'Land' or 'Sea'
% fnom the nominal frequency 
% f frequency
% Emaxvalue the the max field strength
% t percent time
%
% returns a field strength otherwise NaN.
function E = step82(tabulatedValues,h1,dinf,dsup,d,path,fnom,f,Emaxvalue,t)
if (h1 >= 10)
    error('incorrect h1 value for step82: Greater than 10 m');
end
%look up figure values for E10 and E20
E10 = step814_815(tabulatedValues,10,dinf,dsup,d);
E20 = step814_815(tabulatedValues,20,dinf,dsup,d);
%%End lookup
if strcmp(path, 'Land')
    if h1 >= 0
        v = V(fnom,-10);
        J = 6.9+20*log10(sqrt((v-0.1)^2+1)+v-0.1);  % equ'n (12a)
        Ch1neg10 = 6.03-J;                          % equ'n (12)
        C1020 = E10 - E20;                          % equ'n (9b)
        Ezero = E10 + 0.5*(C1020 + Ch1neg10);       % equ'n (9a)
        E = Ezero + 0.1*h1*(E10 - Ezero);          % equ'n (9)
        return
    elseif h1 < 0
        v = V(fnom,h1);
        J = 6.9+20*log10(sqrt((v-0.1)^2+1)+v-0.1);  % equ'n (12a)
        E = step814_815(tabulatedValues,0,dinf,dsup,d) + (6.03-J);
        return
    end
elseif strcmp(path, 'Sea')
    if h1 < 1
        error('h1 cannot be less than 1 m for calculating sea path');
    end
    Dh1 = D06(f,h1,10);             % equ'n (10a)
    D20 = D06(f,20,10);             % equ'n (10b)
    if d <= Dh1
        E = Emaxvalue;                   % equ'n (11a)
        return
    elseif (d >Dh1) && (d < D20)
        [dinf1 dsup1] = FindDNominals(D20);
        E10D20 = step814_815(tabulatedValues,10,dinf1,dsup1,D20);
        E20D20 = step814_815(tabulatedValues,20,dinf1,dsup1,D20);
        ED20 = E10D20+(E20D20 - E10D20)*log10(h1/10)/log10(20/10);
        EDh1 = Emax(Dh1,t,'Sea');
        E = (ED20 - EDh1)*log10(d/Dh1)/log10(D20/Dh1);% equ'n (11b)
        return
    elseif d >= D20
        E1 = E10+(E20-E10)*log10(h1/10)/log(20/10);
        v = V(fnom,-10);
        J = 6.9+20*log10(sqrt((v-0.1)^2+1)+v-0.1);  % equ'n (12a)
        Ch1neg10 = 6.03-J;                          % equ'n (12)
        C1020 = E10 - E20;                          % equ'n (9b)
        Ezero = E10 + 0.5*(C1020 + Ch1neg10);       % equ'n (9a)
        E2 = Ezero + 0.1*h1*(E10 - Ezero);          % equ'n (9)
        Fs = (d - D20)/d;
        E = E1*(1-Fs)+E2*Fs;                        % equ'n (11c)
        return
    end %end if d <= Dh1
end %end if path land


error('no path selected in step82');
end%% end function
% 4.2 Transmitting/base antenna height, h1, in the range 0 m to 10 m
% The method when h1 is less than 10 m depends on whether the path is over 
% land or sea.
 	% For a land path:
 	% For a land path the field strength at the required distance d km
	% for 0 < h1 < 10 m is calculated using:
	% E = Ezero +0.1*h1(E10 -Ezero ) dB(?V/m) (9)
	% where:
        % Ezero = E10 +0.5(C1020 +Ch1neg10 ) dB(?V/m) (9a)
        % C1020 = E10 - E20 dB (9b)
        % Ch1neg10: the correction Ch1 in dB calculated using equation (12)
        % in § 4.3 below at the required distance for h1 = -10 m
        % E10 and E20: the field strengths in dB(?V/m) calculated according
        % to § 4.1 above at the required distance for h1 = 10m and h1 = 20m
        % respectively.
        % Note that the corrections C1020 and Ch1neg10 should both evaluate
        % to negative quantities.

    % For a sea path:
    % Note that for a sea path, h1 should not be less than 1 m. The 
    % procedure requires the distance at which the path has 0.6 of the 
    % first Fresnel zone just unobstructed by the sea surface. This is 
    % given by:
    % Dh1 =D06 ( f , h1,10) km (10a)
        % where f is the nominal frequency (MHz) and the function D06 is 
        % defined in § 17. 
        % If d > Dh1 it will be necessary to also calculate the 0.6 Fresnel
        % clearance distance for a sea path where the transmitting/base 
        % antenna height is 20 m, given by:
        % D20 =D06 ( f , 20,10) km (10b)
        % The field strength for the required distance, d, and value of h1,
        % is then given by:
        % E = Emax dB(?V/m) for d ? Dh1 (11a)
        %   = EDh1 =(ED20 ?EDh1) log(d /Dh1)/log(D20 /Dh1) dB(?V/m) 
        %                                           for Dh1 < d < D20 (11b)
        %   = E?(1?Fs )+E??Fs dB(?V/m) for d ? D20 (11c)
        % where:
        % Emax : maximum field strength at the required distance given in§2
        % EDh1 : Emax for distance Dh1 as given in § 2
        % ED20 = E10(D20) + (E20(D20) ? E10(D20)) log (h1/10)/log (20/10)
        % E10(x) : field strength for h1 = 10 m interpolated for distance x
        % E' = E10(d) + (E20(d) ? E10(d)) log (h1/10)/log (20/10)
        % E??: field strength for distance d calculated using equation (9)
        % FS = (d ? D20)/d.
        
        
% 4.3 Negative values of transmitting/base antenna height, h1
% For land paths it is possible for the effective transmitting/base antenna
% height heff to have a negative value, since it is based on the average 
% terrain height at distances from 3 km to 15 km. Thus h1 may be negative. 
% In this case, the effect of diffraction by nearby terrain obstacles 
% should be taken into account.

% The procedure for negative values of h1 is to obtain the field strength
% for h1 = 0 as described in  § 4.2, and to add a correction Ch1 calculated
% as follows.
% The effect of diffraction loss is taken into account by a correction, 
% Ch1, given by cases a) or b) as follows:

% a) In the case that a terrain database is available and the potential for
% discontinuities at the transition around h1 = 0 is of no concern in the 
% application of this Recommendation, the terrain clearance angle, ?eff1, 
% from the transmitting/base antenna should be calculated as the elevation 
% angle of a line which just clears all terrain obstructions up to 15 km 
% from the transmitting/base antenna in the direction of (but not going 
% beyond) the receiving/mobile antenna. This clearance angle, which will 
% have a positive value, should be used instead of ?tca in equation (30c) 
% in the terrain clearance angle correction method given in § 11 to obtain
% Ch1. Note that using this method can result in a discontinuity in field 
% strength at the transition around h1 = 0.
        
        %% This implementation is 4.3 a) is not accounted for.

% b) In the case where a terrain database is not available or where a 
% terrain database is available, but the method must never produce a 
% discontinuity in the field strength at the transition around h1 = 0, the
% (positive) effective terrain clearance angle, ?eff2, may be estimated
% assuming an obstruction of height h1 at a distance of 9 km from the 
% transmitting/base antenna. Note that this is used for all path lengths, 
% even when less than 9 km. That is, the ground is regarded as 
% approximating an irregular wedge over the range 3 km to 15 km from the 
% transmitting/base antenna, with its mean value occurring at 9 km, as 
% indicated in Fig. 25. This method takes less explicit account of terrain 
% variations, but it also guarantees that there is no discontinuity in 
% field strength at the transition around h1 = 0. The correction to be 
% added to the field strength in this case is calculated using:
% Ch1 =6.03? J (?) dB (12)
% where:
    % J(?)= 6.9+20*log10(sqrt((v-0.1)^2+1)+v-0.1) (12a)
    % ? =K?*?eff2 (12b)
% and
    % ?eff 2 =arctan(?h1/9000) degrees (12c)
    % K? = 1.35 for 100 MHz
    % K? = 3.31 for 600 MHz
    % K? = 6.00 for 2000 MHz

% The above correction, which is always less than zero, is added to the 
% field strength obtained for h1 = 0.
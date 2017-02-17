% function E = step6_10(figure,h1,dinf,dsup,d,path,f,Emaxvalue,t)

% where:
%   figure: the table of figures with the 3 parameter, time, frequency,
%   path and figure number
%   h1: the calculated hieght of the reciving antenna
%   dsup: the higher measured distance value about d
%   dinf: the lower measured distance value about d
%   path: 'Warm' 'Cold' 'Sea' 'Land'
%   f: frequency
%   Emaxvalue: maximum calculated field strength
%   t: percent time

% 7 Interpolation of field strength as a function of percentage time
% Field-strength values for a given percentage of time between 1% and 50% time should be calculated
% by interpolation between the nominal values 1% and 10% or between the nominal values 10% and
% 50% of time using:
% E = Esup (Qinf ?Qt )/(Qinf ?Qsup )+Einf (Qt ?Qsup )/(Qinf ?Qsup ) dB(?V/m) (16)
% where:
% t : percentage time for which the prediction is required
% tinf : lower nominal percentage time
% tsup : upper nominal percentage time
% Qt = Qi (t/100)
% Qinf = Qi (tinf /100)
% Qsup = Qi (tsup /100)
% Einf : field-strength value for time percentage tinf
% Esup : field-strength value for time percentage tsup
% where Qi (x) is the inverse complementary cumulative normal distribution function.
% This Recommendation is valid for field strengths exceeded for percentage times in the range 1% to
% 50% only. Extrapolation outside the range 1% to 50% time is not valid.
% A method for the calculation of Qi (x) is given in Annex 5, § 15.



function E = step6_10(figure,h1,dinf,dsup,d,path,f,Emaxvalue,t)
percentage = [1 10 50];
[tinf, tsup] = searchclosest(percentage,t);
% Step 6: For the lower nominal percentage time follow Steps 7 to 10.
Ep = zeros(1,2);
argl = [tinf tsup];
for l=(tinf == tsup)+1:2
    % slight modification due to figure limits. When any sea path is
    % selected all figure tables for warm and cold are kept in the figure
    % matrix. This modification sorts out when a sea path Warm figure is 
    % needed otherwise it will default to a Cold sea path.
    % ex. [1 2 600 x] does not exist nor do any t = 50 curves for warm or 
    % cold sea specific tables.
    if ((argl(l) == 10)||(argl(l) == 1)) && strcmp(path,'Warm')
        idx = figure(:,1)==argl(l)&(figure(:,2)== 4);
    else
        idx = figure(:,1)==argl(l);
    end
    figureStep6 = figure(idx,:);

    % Step 7-9: For the lower nominal frequency follow Steps 8 and 9.
    df = D06(f,h1,10);
    d600 = D06(600, h1, 10);
    if strcmp(path,'Warm')||strcmp(path,'Cold')||strcmp(path,'Sea')
        generalPath = 'Sea';
    else
        generalPath = 'Land';
    end
    
    if (strcmp(generalPath,'Sea')&&(f < 100)&&(d < d600))
        if (d <= df)
            Ep(l) = Emaxvalue;      %equ'n (15a)
        else
            Edf = Emax(df,t,generalPath);
            [d600inf d600sup] = FindDNominals(d600);
            Ed600 = step7_normal(figureStep6,h1,d600inf,d600sup,d600,generalPath,f,Emaxvalue,t);
            Ep(l) = Edf +(Ed600 - Edf)*lod10(d/df)/log10(d600/df); %equ'n (15b)
        end
    else
        Ep(l) = step7_normal(figureStep6,h1,dinf,dsup,d,generalPath,f,Emaxvalue,t);
    end
    % Step 10: If the required percentage time does not coincide with the
    % lower nominal percentage time, repeat Steps 7 to 9 for the higher
    % nominal percentage time and interpolate the two field strengths using
    % the method given in Annex 5, § 7.
end%end for (percentage)
if tinf ~= tsup
    Qsup = Qi(tsup/100);
    Qinf = Qi(tinf/100);
    Qt = Qi(t/100);
    E = Ep(2)*(Qinf-Qt)/(Qinf-Qsup)+Ep(1)*(Qt-Qsup)/(Qinf-Qsup);    %equ'n (16)
    return
else
    E = Ep(l);
    return
end
end
% For sea paths where the required frequency is less than 100 MHz an alternative method should be
% used, based upon the path lengths at which 0.6 of the first Fresnel zone is just clear of obstruction
% by the sea surface. An approximate method for calculating this distance
% is given in § 17.
% The alternative method should be used if all of the following conditions are true:
% – The path is a sea path.
% – The required frequency is less than 100 MHz.
% – The required distance is less than the distance at which a sea path would have 0.6 Fresnel
% clearance at 600 MHz, given by D06(600, h1, 10) as given in § 17.
% If any of the above conditions is not true, then the normal interpolation/extrapolation method given
% by equation (14) should be used.
% If all of the above conditions are true, the required field strength, E, should be calculated using:
% E = Emax dB(?V/m) for d ? df (15a)
% Edf (Ed600 Ed )log(d /d f )/log(d600 /d f ) f = + ? dB(?V/m) for d > df (15b)
% where:
% Emax : maximum field strength at the required distance as defined in § 2
% : Edf maximum field strength at distance df as defined in § 2
% d600 : distance at which the path has 0.6 Fresnel clearance at 600 MHz calculated as
% D06(600, h1, 10) as given in § 17
% df : distance at which the path has 0.6 Fresnel clearance at the required frequency
% calculated as D06( f, h1, 10) as given in § 17
% : Ed600 field strength at distance d600 and the required frequency calculated using
% equation (14).
% Step 15: If applicable, reduce the field strength by adding the 
% correction for short urban/suburban paths using the method given in 
% Annex 5, § 10.

% If a path of length less than 15 km covers buildings of uniform height
% over flat terrain, a correction representing the reduction of field
% strength due to building clutter should be added to the field strength.
% The correction is given by: 
% Correction = -3.3(log(f))(1-0.85log(d))(1-0.46log(1+ha-R)) (29) 
% where: 
% ha is the antenna height above ground (m) (i.e. height of the mast) 
% R is representative of the height of the ground cover surrounding the 
% receiving/mobile antenna as defined in § 9, which also represents the 
% height of ground cover surrounding the transmitting/base antenna. 
% This correction only applies when d is less than 15 km and h1 ? R is less
% than 150 m.

function E = Step_15(d,h1,ha,f,env)
switch(env);
    case {'open'}
        R = 10;
    case {'land'}
        R = 10;
    case {'urban'}
        R = 20;
    case {'dense'}
        R = 30;
    otherwise
        error('Input variable env not understood - see help h2corr for details')
end
if (d < 15) && ((h1-R) < 150)
    E = -3.3*(log10(f))*(1-0.85*log10(d))*(1-0.46*log10(1+ha-R)); % equ'n (29)
    return
end
E = 0;
end

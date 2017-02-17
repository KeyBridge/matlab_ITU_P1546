% P1546FieldStr   ITU 1546-3 Field strength calculator
%
%	E = P1546FieldStr(d,f,t,heff,ha,hb,path,FS_offset)
%
% where:    Units,   Definition                             Limits
%        f: MHz,    Operating frequency.                    30-3000 MHz
%        d: km,     Path length.                            1-1000 km
%        t: %,      Percentage time defined                 1-50 %
%                   in Annex 1 sec 8.
%       heff: m,    the effective height of the             >clutter m
%                   transmitting/base antenna, height over
%                   the average level of the ground between
%                   distances of 3 and 15 km from the
%                   transmitting/base antenna in the
%                   direction of the receiving/mobile antenna.
%       ha: m,      Transmitter antenna height above        >clutter m
%                   ground. Defined in Annex 5 sec 3.1.1.
%                   Limits are defined in Annex 5 sec 3.
%       hb: m,      Height of base antenna above terrain    none, d < 15 km
%                   height averaged 0.2 d and d km, where
%                   d is less than 15 km and where terrain
%                   information is available.
%     path: String  what type of field strength             'Land','Sea',
%                   calculations/tables should be used.     'Warm','Cold'
%FS_offset: dB microV/m     Used to lower the field strenght value 
%                           intended for use with find distance
%                           from field strength.

%  Notes:
% If sea path is selected for a t value less then 50% the default 10% table
% use is a cold sea path.


%  How to use:
% To use the function and have no input for a variable. The "standard" way
% is pass empty array for undefined inputs Ex:
% P1546FieldStr(150,700,10,500,[],[],'Sea')
%
%
% Jef Statham, Industry Canada  2009-08-13
% Numbers refer to Rec. ITU-R P.1546-3

function E = P1546FieldStrbeta(d,f,t,heff,varargin)

if nargin > 8
    warning(strcat('P1546FieldStrAlpha:TooManyInputs requires at most 7',...
        'optional inputs additional values ignored. Input values may be wrongly assigned.'));
end

%defaults for optional inputs
defaultvalues = {[] [] 'Land' 0};
newValues = cellfun(@(x) ~isempty(x), varargin);
defaultvalues(newValues) = varargin(newValues);
[ha hb path FS_offset] = defaultvalues{:};

% Function limit(var, low, hi, name)
%
% Checks the var to see if it's inbetween the range low <= var <= hi
% returns false if it's in range true if not

    function bool = limit(var, low, hi,name)
        if ((var < low) || (var > hi))
            error(strcat(name,' = ',num2str(var),' is out side of limit'));
            bool = true; 
            return
        end
        bool = false;
    end

% Checking passed parameter to the defined limits

if limit(f,30,3000,'f')
    return
end
if limit(d,1,1000,'d')
    return
end
if limit(t,1,50,'t')
    return
end
if limit(heff,heff,3000,'heff');
    return
end
%     time,path,freq,figure 
figure = [50,1,100 ,1;
          10,1,100 ,2;
           1,1,100 ,3;
          50,2,100 ,4;
          10,3,100 ,5;
           1,3,100 ,6;
          10,4,100 ,7;
           1,4,100 ,8;
          50,1,600 ,9;
          10,1,600 ,10;
           1,1,600 ,11;
          50,2,600 ,12;
          10,3,600 ,13;
           1,3,600 ,14;
          10,4,600 ,15;
           1,4,600 ,16;
          50,1,2000,17;
          10,1,2000,18;
           1,1,2000,19;
          50,2,2000,20;
          10,3,2000,21;
           1,3,2000,22;
          10,4,2000,23;
           1,4,2000,24;];

% 3 Determination of transmitting/base antenna height, h1

if strcmp(path,'Warm')||strcmp(path,'Cold')||strcmp(path,'Sea')
    generalPath = 'Sea';
    idx = figure(:,2)>1;
    figure = figure(idx,:);
else
    generalPath = 'Land';
    idx = (figure(:,2)==1);
    figure = figure(idx,:);
end

h1 = h1Calc(d,heff,ha,hb,generalPath);
if h1 > 3000
    h1 = 3000;
    warning('h1 was larger than 3000m set value to 3000');
end
if isnan(h1)
    error('h1 is nan');
end
if isempty(h1)
    error('h1 is empty');
end

% 2 Maximum field-strength values
Emaxvalue = Emax(d,t,generalPath);
if isnan(Emaxvalue)
    error('Emax is NaN');
end

% Step 1: Determine the type of the propagation path as land, cold sea or
% warm sea. If the path is mixed then determine two path types which are
% regarded as first and second propagation types. If the path can be
% represented by a single type then this is regarded as the first
% propagation type and the mixed-path method given in Step 11 is not
% required.
%   Where,
%   time is percentage 1%,10%,50%
%   path is 1 = Land, 2 = Sea, 3 = Cold Sea, 4 = Warm Sea
%   figure is excel figure number 1 - 24

% Step 2: For any given percentage of time (in the range 1% to 50% time)
% determine two nominal time percentages as follows:
% – wanted time percentage > 1 and < 10, the lower and higher nominal
%   percentages are 1 and 10, respectively;
% – wanted time percentage > 10 and < 50, the lower and higher nominal
%   percentages are 10 and 50, respectively.
% If the required percentage of time is equal to 1% or 10% or 50%, this
% value should be regarded as the lower nominal percentage time and the
% interpolation process of Step 10 is not required.
                
%        done in start of step 6-10

% Step 3: For any wanted frequency (in the range 30 to 3 000 MHz) determine
% two nominal frequencies as follows:
% – where the wanted frequency < 600 MHz, the lower and higher nominal
%   frequencies are 100 and 600 MHz, respectively;
% – where the wanted frequency > 600 MHz, the lower and higher nominal
%   frequencies are 600 and 2 000 MHz, respectively.
% If the wanted frequency equals 100 or 600 or 2 000 MHz, this value should
% be regarded as the lower nominal frequency and the
% interpolation/extrapolation process of Step 9 is not required.
    
%       done in start of step normal step 7-9

% Step 4: Determine the lower and higher nominal distances from Table 1
% closest to the required distance. If the required distance coincides with
% a value in Table 1, this should be regarded as the lower nominal distance
% and the interpolation process of Step 8.1.5 is not required.
[dinf, dsup] = FindDNominals(d);

% Step 5: For the first propagation type follow Steps 6 to 11.
    
    % only one progression type at a time.

E = step6_10(figure,h1,dinf,dsup,d,path,f,Emaxvalue,t)-FS_offset;

% Step 11: If the prediction is for a mixed path, follow the step-by-step
% procedure given in Annex 5, § 8. This requires use of Steps 6 to 10 for
% paths of each propagation type. Note that if different sections of the
% path exist classified as both cold and warm sea, all sea sections should
% be classified as warm sea.

% not implemented

return
end
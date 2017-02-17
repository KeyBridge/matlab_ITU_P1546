% 3 Determination of transmitting/base antenna height, h1

% The transmitting/base antenna height, h1, to be used in calculation
% depends on the type and length of the path and on various items of height
% information, which may not all be available.
% For sea paths h1 is the height of the antenna above sea level.
% For land paths, the effective height of the transmitting/base antenna,
% heff, is defined as its height in metres over the average level of the
% ground between distances of 3 and 15 km from the transmitting/base
% antenna in the direction of the receiving/mobile antenna. Where the value
% of effective transmitting/base antenna height, heff, is not known it
% should be estimated from general geographic information. This
% Recommendation is not valid when the transmitting/base antenna is below
% the height of surrounding clutter.
% The value of h1 to be used in calculation should be obtained using the
% method given in § 3.1, 3.2 or in § 3.3 as appropriate.

    % 3.1 Land paths shorter than 15 km
    % For land paths less than 15 km one of the following two methods
    % should be used:

        % 3.1.1 Terrain information not available
        % Where no terrain information is available when propagation 
        % predictions are being made, the value of h1 is calculated 
        % according to path length, d, as follows:
        % h1 =ha m for d <= 3 km (4)
        % h1 = ha +(heff -ha )(d -3)/12 m for 3 km < d < 15 km (5)
        % where ha is the antenna height above ground (e.g. height of the mast).

        % 3.1.2 Terrain information available
        % Where terrain information is available when propagation 
        % predictions are being made:
        % h1 =hb m (6)
        % where hb is the height of the antenna above terrain height 
        % averaged between 0.2d and d km.
        
    % 3.2 Land paths of 15 km or longer
    % For these paths:
    % h1 =heff m (7)

    % 3.3 Sea paths
    % The concept of h1 for an all-sea path is that it represents the 
    % physical height of the antenna above the surface of the sea. This 
    % Recommendation is not reliable in the case of a sea path for h1 
    % values less than about 3 m, and an absolute lower limit of 1 m should
    % be observed.

%This function will return a NaN value if missing inputs according to ITU-R
%p.1546-3
function h1 = h1Calc(d,heff,ha,hb,path)
if strcmp(path,'Land')
    if (d < 15)
        if (d <= 3)
            if ~isempty(ha)
                h1 = ha;                    %eq'n (4)
                return
            else
                warning('d less than 3km no value for ha. h1 = heff');
                h1 = heff;
                return
            end
        end
        if ~isempty(hb)
            h1 = hb;                        %equ'n (6)
            return
        end
        if ~isempty(ha)
            h1 = ha+(heff-ha)*(d-3)/12;     %equ'n (5)
            return
        end
        warning('3 < d < 15. no value for ha or hb. Assigning value heff to h1')
        h1 = heff;
        return
    else
        h1 = heff;                          %equ'n (7)
        return
    end
end
if strcmp(path, 'Sea')
    if heff < 3
        warning('heff is too low for sea paths h1 is set to 3 m');
        h1 = 3;
        return;
    end
    h1 = heff;
    return
end
h1 = NaN;
end

% Step 14: Correct the field strength for receiving/mobile antenna height 
% h2 using the method given in Annex 5, § 9.
% function e = Step_14(h2,f,path,env,d,h1,R)
%	h2 : reciever antenna height above ground (may be a vector)
%	f  : frequency in MHz
%	env: environment, sets representative clutter height. Possible inputs:
%	     - 'land' : sets R = 10m (default) - for open land (rural)
%	     - 'urban': sets R = 20m - for built-up areas
%	     - 'dense': sets R = 30m - for dense cities
%	     - 'open' : sets R = 10m and forces use of Kh2*log10(h2/R), also for h2<R'.
%	                Use this option in case antenna is adjacent to land in rural/open environment.
%	d  : distance to transmitter (optional)
%	h1 : transmitter effective antenna height (optional)
%	     If d or h1 remains unset, R'=R is assumed. You may do this if h1 < 6.5*d + R.
%	     Set h2 = -1 to test if this is the case, whith d , h1 and R set.
%	        Function returns 6.5*d + R - h1, which is positive if h1 < 6.5*d + R
%	R  : Representative clutter height in m (optional). Set by the 'env' input, but non-standard
%	     values may be entered here, overruling the 'env' setting: 10m for rural, 20m for urban,
%	     30m for dense urban.)

% acceptable number of argurment inputs are 
% Step_14(h2,f,path)
% Step_14(h2,f,path,env,d,h1,R)
% Step_14(h2,f,path,env)
% Step_14(h2,f,path,env,d,h1)
function e = Step_14(h2,f,path,varargin)
defaultvalues = {[] [] [] []};
newValues = cellfun(@(x) ~isempty(x), varargin);
defaultvalues(newValues) = varargin(newValues);
[env,d,h1,R] = defaultvalues{:};

if strcmp(path,'Land')
    if isempty(env)
        e = h2corr(h2,f);
        return
    elseif (~isempty(d)&&~isempty(h1))
        if (~isempty(R))
            e = h2corr(h2,f,env,d,h1,R);
            return
        end
        e = h2corr(h2,f,env,d,h1);
        return
    else
        e = h2corr(h2,f,env);
        return
    end
elseif strcmp(path,'Sea')
    d10 = D06(f,h1,10);
    dh2 = D06(f,h1,h2);
    if (h2 >= 10) || (d > d10)
        Kh2 = 3.2+6.2*log10(f);         % equ'n (27f)
        e = Kh2*log10(h2/10);           % equ'n (27b)
        return
    end
    if (d < dh2)
        e = 0;                          % equ'n (28a)
        return
    else
       Kh2 = 3.2+6.2*log10(f);									% (27f)
       C10 = Kh2*log10(d10/10);									% (27b)
       e = C10*log10(d/dh2)/log10(d10/dh2);                      % (28b)
       return
    end
end
e = NaN;
end
% 9 Correction for receiving/mobile antenna height
% The field-strength values given by the land curves and associated tabulations in this
% Recommendation are for a reference receiving/mobile antenna at a height, R (m), representative of
% the height of the ground cover surrounding the receiving/mobile antenna, subject to a minimum
% height value of 10 m. Examples of reference heights are 20 m for an urban area, 30 m for a dense
% urban area and 10 m for a suburban area. For sea paths the notional value of R is 10 m.
% Where the receiving/mobile antenna is on land account should first be taken of the elevation angle
% of the arriving ray by calculating a modified representative clutter height R' (m), given by:
% R?=(1000dR?15h1)/(1000d ?15) m (26)
% where h1 and R (m) and distance d (km).
% Note that for h1 < 6.5d + R, R? ? R.
% The value of R' must be limited if necessary such that it is not less than 1 m.
% When the receiving/mobile antenna is in an urban environment the correction is then given by:
% Correction = 6.03? J (?) dB for h2 < R? (27a)
% =Kh2 log(h2 /R?) dB for h2 ? R? (27b)
% where J(?) is given by equation (12a),
% 44 Rec. ITU-R P.1546-3
% and:
% ? = Knu hdif ?clut (27c)
% hdif = R??h2 m (27d)
% ?clut = arctan(hdif /27) degrees (27e)
% Kh2 = 3.2+6.2log( f ) (27f)
% Knu = 0.0108 f (27g)
% f: frequency (MHz).
% In cases in an urban environment where R' is less than 10 m, the correction given by equation (27)
% should be reduced by Kh2 log(10/R?).
% Where the receiving/mobile antenna is on land in a rural or open environment the correction is
% given by equation (27b) for all values of h2 with R' set to 10 m.
% In the following, the expression “adjacent to sea” applies to cases where the receiving/mobile
% antenna is either over sea, or is immediately adjacent to the sea with no significant obstruction in
% the direction of the transmitting/base station.
% Where the receiving/mobile antenna is adjacent to sea for h2 ? 10 m, the correction should be
% calculated using equation (27b) with R' set to 10 m.
% Where the receiving/mobile antenna is adjacent to sea for h2 < 10 m, an alternative method should
% be used, based upon the path lengths at which 0.6 of the first Fresnel zone is just clear of
% obstruction by the sea surface. An approximate method for calculating this distance is given in § 17.
% The distance at which the path would just have 0.6 Fresnel clearance for the required value of h1
% and for h2 = 10 m, d10, should be calculated as D06(f, h1, 10) in § 17.
% If the required distance is equal to or greater than d10, then again the correction for the required
% value of h2 should be calculated using equation (27b) with R' set to 10 m.
% If the required distance is less than d10, then the correction to be added to the field strength E should
% be calculated using:
% Correction = 0.0 dB for d ? dh2 (28a)
% = C10 log(d /dh2)/log(d10 /dh2) dB for dh2 < d < d10 (28b)
% where:
% C10: correction for the required value of h2 at distance d10 using equation (27b) with
% R' set to 10 m
% d10: distance at which the path just has 0.6 Fresnel clearance for h2 = 10 m
% calculated as D06(f, h1, 10)as given in § 17
% dh2: distance at which the path just has 0.6 Fresnel clearance for the required value
% of h2 calculated as D06(f, h1, 10)as given in § 17.
% This Recommendation is not valid for receiving/mobile antenna heights, h2, less than 1 m when
% adjacent to land or less than 3 m when adjacent to sea.
% Rec. ITU-R P.1546-3 45
% The above complete correction for receiver/mobile antenna height can be summarized by the
% flowchart given in Fig. 27.
% H2CORR        ITU 1546-1 Field strength calculator
%               Calculate correction in dB for receiver antenna height different from standard.
%
% corr = h2corr(h2,f,env,d,h1,R)
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

% Pierre Soelberg, http://broadcast-it.com, 2005-10-06
% Numbers refer to Rec. ITU-R P.1546-1

% Modified by Jeff Statham to remove warnings in Matlab R2007a and
% translate some comments

function corr = h2corr(h2,f,varargin)
%nargin
%varargin
force23b = 0;		% set 1 if the condition of open country => use (27b) applies

if nargin>2
   if nargin>5
      R = varargin{4};
   else
      switch(lower(varargin{1}));
      case {'open'}
         R = 10;
         force23b = 1;
      case {'land'}
         R = 10;
      case {'urban'}
         R = 20;
      case {'dense'}
         R = 30;
      otherwise
         error('Input variable env not understood - see help h2corr for details')
      end
   end
else
   R = 10;
   warning('env unspecified - assuming env=land and R = 10 m');
end   

if nargin>4		% both d and h1 specified
   d = varargin{2};
   h1 = varargin{3};
   
   if h2 == -1		% if we instead should test for R = R 
      corr = 6.5*d + R - h1;
      return
   end
   
   Rm = (1000*d*R-15*h1)/(1000*d-15);							% (26)
   if Rm < 1
      Rm = 1;
   end
else
   warning(['d or h1 unspecified - assuming modified representative clutter height is ',...
         int2str(R),' m']);
   Rm = R;
end
   
if h2<Rm && ~force23b
   Knu = 0.0108*sqrt(f);									% (27g)
   h_dif = Rm - h2;											% (27d)
   theta_clut = atan(h_dif/27)/pi*180;						% (27e)
   ny = Knu*sqrt(h_dif.*theta_clut);						% (27c)
   J = 6.9 + 20*log10(sqrt((ny-0.1).^2+1)+ny-0.1);			% (12a)
   corr = 6.03-J;											% (27a)
else
   Kh2 = 3.2+6.2*log10(f);									% (27f)
   corr = Kh2*log10(h2/Rm);									% (27b)
end

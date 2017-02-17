% 15 An approximation to the inverse complementary cumulative normal distribution
% function
% The following approximation to the inverse complementary cumulative normal distribution
% function, Qi (x), is valid for 0.01 <= x <= 0.99:
% Qi (x)=T(x)-out(x) if x <= 0.5 (36a)
% Qi (x)=-{T(1-x)-out(1-x)} if x > 0.5 (36b)
% where:
% T(x) = [–2ln(x)] (36c)
% out(x) = (((C2*T(z)+C1)*T(z))+C0)/(((D3*T(z)+D2)*T(z)+D1)*T(z)+1); (36d)
% C0 = 2.515517
% C1 = 0.802853
% C2 = 0.010328
% D1 = 1.432788
% D2 = 0.189269
% D3 = 0.001308
% Values given by the above equations are given in Table 3.
function out = Qi(x)
if x<= .5
    out = T(x)-C(x);%(36a)
else
    out = -(T(1-x)-C(1-x)); %(36b)
end

    function outT = T(y)
        outT = sqrt(-2*log(y));     %(36c)
    end
    function outC = C(z)
        C0 = 2.515517;
        C1 = 0.802853;
        C2 = 0.010328;
        D1 = 1.432788;
        D2 = 0.189269;
        D3 = 0.001308;
        outC = (((C2*T(z)+C1)*T(z))+C0)/(((D3*T(z)+D2)*T(z)+D1)*T(z)+1);%(36d)
    end

end
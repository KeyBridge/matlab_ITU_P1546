clc
[num text] = xlsread('P1546 M validation.xls', 'B6:G53');
%   t       f         h         d
%num(:,1) num(:,3) num(:,5) num(:,6)
%   path
%text(:,2)
result = zeros(length(num),1);
for x=1:length(num) 
    result(x) = P1546FieldStr(num(x,6),num(x,3),num(x,1)*100,num(x,5),num(x,5),[],text(x,2));
end
xlswrite('P1546 M validation.xls', result,1,'I6:I53');
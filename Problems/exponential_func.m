% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the function value for function 3
%
%           Input: x
%           Output: f(x)
%
function [f] = exponential_func(x,problem)
n = problem.n;
f = (exp(x(1))-1)/(exp(x(1))+1) + 0.1*exp(-x(1));
for i = 2:n
    f = f + (x(i)-1)^4;
end

end
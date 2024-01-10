% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the gradient of function 3
%
%           Input: x
%           Output: g = nabla f(x)
%
function [g] = exponential_grad(x,problem)
n = problem.n;
g = zeros([n,1]);
g(1) = exp(x(1))/(exp(x(1)) + 1) - exp(-x(1))/10 - (exp(x(1))*(exp(x(1)) - 1))/(exp(x(1)) + 1)^2;
for i = 2:n
    g(i) = 4*(x(i)-1)^3;
end
end
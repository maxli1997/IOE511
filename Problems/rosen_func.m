% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the function value for the Rosenbrock function
%
%           Input: x
%           Output: f(x)
%
function [f] = rosen_func(x,problem)
n = problem.n;
f = 0;
for i=1:n-1
    f = f+(1 - x(i))^2 + 100*(x(i+1) - x(i)^2)^2;
end
end
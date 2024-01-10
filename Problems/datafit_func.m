% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the function value for function 2
%
%           Input: x
%           Output: f(x)
%
function [f] = datafit_func(x,problem)

f = (1.5-x(1)*(1-x(2)))^2 + (2.25-x(1)*(1-x(2)^2))^2 + (2.625-x(1)*(1-x(2)^3))^2;
end
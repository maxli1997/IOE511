% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the gradient of function 2
%
%           Input: x
%           Output: g = nabla f(x)
%
function [g] = datafit_grad(x,problem)

g = [2*(x(2) - 1)*(x(1)*(x(2) - 1) + 3/2) + 2*(x(2)^2 - 1)*(x(1)*(x(2)^2 - 1) + 9/4) + 2*(x(2)^3 - 1)*(x(1)*(x(2)^3 - 1) + 21/8);
    2*x(1)*(x(1)*(x(2) - 1) + 3/2) + 4*x(1)*x(2)*(x(1)*(x(2)^2 - 1) + 9/4) + 6*x(1)*x(2)^2*(x(1)*(x(2)^3 - 1) + 21/8)];
end
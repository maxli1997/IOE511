% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the Hessian of function 2
%
%           Input: x
%           Output: H = nabla^2 f(x)
%
function [H] = datafit_Hess(x,problem)

H = [2*(x(2) - 1)^2 + 2*(x(2)^2 - 1)^2 + 2*(x(2)^3 - 1)^2, 4*x(2)*(x(1)*(x(2)^2 - 1) + 9/4) + 6*x(2)^2*(x(1)*(x(2)^3 - 1) + 21/8) + 4*x(1)*(x(2) - 1) + 4*x(1)*x(2)*(x(2)^2 - 1) + 6*x(1)*x(2)^2*(x(2)^3 - 1) + 3;
    4*x(2)*(x(1)*(x(2)^2 - 1) + 9/4) + 6*x(2)^2*(x(1)*(x(2)^3 - 1) + 21/8) + 4*x(1)*(x(2) - 1) + 4*x(1)*x(2)*(x(2)^2 - 1) + 6*x(1)*x(2)^2*(x(2)^3 - 1) + 3, 4*x(1)*(x(1)*(x(2)^2 - 1) + 9/4) + 2*x(1)^2 + 8*x(1)^2*x(2)^2 + 18*x(1)^2*x(2)^4 + 12*x(1)*x(2)*(x(1)*(x(2)^3 - 1) + 21/8)];
 
end
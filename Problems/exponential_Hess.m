% IOE 511/Mx(1)TH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the Hessian of function 3
%
%           Input: x
%           Output: H = nabla^2 f(x)
%
function [H] = exponential_Hess(x,problem)
n = problem.n;
h = zeros([n,1]);
h(1) = exp(-x(1))/10 - (2*exp(2*x(1)))/(exp(x(1)) + 1)^2 + exp(x(1))/(exp(x(1)) + 1) + (2*exp(2*x(1))*(exp(x(1)) - 1))/(exp(x(1)) + 1)^3 - (exp(x(1))*(exp(x(1)) - 1))/(exp(x(1)) + 1)^2;
for i = 2:n
    h(i) = 12*(x(i)-1)^2;
end

H = diag(h);
 
end
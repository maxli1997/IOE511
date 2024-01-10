% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the Hessian of the Rosenbrock function
%
%           Input: x
%           Output: H = nabla^2 f(x)
%
function [H] = rosen_Hess(x,problem)
n = problem.n;
H = zeros([n,n]);
H(1,1) = 1200*x(1)^2 - 400*x(2) + 2;
H(1,2) = -400*x(1);
for i = 2:n-1
    H(i,i-1) = -400*x(i-1);
    H(i,i) = 200 + 1200*x(i)^2 - 400*x(i+1) + 2;
    H(i,i+1) = -400*x(i);
end
H(n,n-1) = -400*x(n-1);
H(n,n) = 200;
end
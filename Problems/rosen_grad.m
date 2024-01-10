% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that computes the gradient of the Rosenbrock function
%
%           Input: x
%           Output: g = nabla f(x)
%
function [g] = rosen_grad(x,problem)
n = problem.n;
g = zeros([n,1]);
g(1) = 2*x(1) - 400*x(1)*(- x(1)^2 + x(2)) - 2;
for i = 2:n-1
    g(i) = - 200*x(i-1)^2 + 200*x(i) + 2*x(i) - 400*x(i)*(- x(i)^2 + x(i+1)) - 2;
end
g(n) = - 200*x(n-1)^2 + 200*x(n);

end
% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Problem Number: 1
% Problem Name: quad_10_10
% Problem Description: A randomly generated convex quadratic function; the 
%                      random seed is set so that the results are 
%                      reproducable. Dimension n = 10; Condition number
%                      kappa = 10

% function that computes the Hessian of the quad_10_10 function
function [H] = quartic_Hess(x,problem)

% Matrix Q
Q = [5 1 0 0.5;
     1 4 0.5 0;
     0 0.5 3 0;
     0.5 0 0 2];
 
% Set sigma value
sigma = problem.sigma;

% compute function value
H = eye(size(Q)) + sigma*(2*Q*x*(Q*x).'+x.'*Q*x*Q);

end
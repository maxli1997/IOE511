% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that specifies the problem. Specifically, a way to compute: 
%    (1) function values; (2) gradients; and, (3) Hessians (if necessary).
%
%           Input: problem (struct), required (problem.name)
%           Output: problem (struct)
%
% Error(s): 
%       (1) if problem name not specified;
%       (2) function handles (for function, gradient, Hessian) not found
%
function [problem] = setProblem(problem)

% check is problem name available
if ~isfield(problem,'name')
    error('Problem name not defined!!!')
end

% add path
addpath(genpath(pwd));

% set function handles according the the selected problem
switch problem.name
        
    case 'Problem1'
        % Set random number generator seeds
        rng(0);
        % Generate random data
        problem.q = randn(10,1);
        % MATLAB sprandsym function. Inputs: n, density, reciprocal of the 
        % condition number, and kind 
        % (see https://www.mathworks.com/help/matlab/ref/sprandsym.html)
        problem.Q = sprandsym(10,0.5,0.1,1);
        problem.compute_f = @(x,problem) quad_func(x,problem);
        problem.compute_g = @(x,problem) quad_grad(x,problem);
        problem.compute_H = @(x,problem) quad_Hess(x,problem);

    case 'Problem2'
        % Set random number generator seeds
        rng(0);        
        % Generate random data
        problem.q = randn(10,1);
        % MATLAB sprandsym function. Inputs: n, density, reciprocal of the 
        % condition number, and kind 
        % (see https://www.mathworks.com/help/matlab/ref/sprandsym.html)
        problem.Q = sprandsym(10,0.5,1e-3,1);
        problem.compute_f = @(x,problem) quad_func(x,problem);
        problem.compute_g = @(x,problem) quad_grad(x,problem);
        problem.compute_H = @(x,problem) quad_Hess(x,problem);

    case 'Problem3'
        % Set random number generator seeds
        rng(0);
        % Generate random data
        problem.q = randn(1000,1);
        % MATLAB sprandsym function. Inputs: n, density, reciprocal of the 
        % condition number, and kind 
        % (see https://www.mathworks.com/help/matlab/ref/sprandsym.html)
        problem.Q = sprandsym(1000,0.5,0.1,1);
        problem.compute_f = @(x,problem) quad_func(x,problem);
        problem.compute_g = @(x,problem) quad_grad(x,problem);
        problem.compute_H = @(x,problem) quad_Hess(x,problem);

    case 'Problem4'
        % Set random number generator seeds
        rng(0);
        % Generate random data
        problem.q = randn(1000,1);
        % MATLAB sprandsym function. Inputs: n, density, reciprocal of the 
        % condition number, and kind 
        % (see https://www.mathworks.com/help/matlab/ref/sprandsym.html)
        problem.Q = sprandsym(1000,0.5,1e-3,1);
        problem.compute_f = @(x,problem) quad_func(x,problem);
        problem.compute_g = @(x,problem) quad_grad(x,problem);
        problem.compute_H = @(x,problem) quad_Hess(x,problem);

    case 'Problem5'
        problem.sigma = 1e-4;
        problem.compute_f = @(x,problem) quartic_func(x,problem);
        problem.compute_g = @(x,problem) quartic_grad(x,problem);
        problem.compute_H = @(x,problem) quartic_Hess(x,problem);

    case 'Problem6'
        problem.sigma = 1e4;
        problem.compute_f = @(x,problem) quartic_func(x,problem);
        problem.compute_g = @(x,problem) quartic_grad(x,problem);
        problem.compute_H = @(x,problem) quartic_Hess(x,problem);

    case 'Problem7'
        problem.n = 2;
        problem.compute_f = @(x,problem) rosen_func(x,problem);
        problem.compute_g = @(x,problem) rosen_grad(x,problem);
        problem.compute_H = @(x,problem) rosen_Hess(x,problem);

    case 'Problem8'
        problem.n = 100;
        problem.compute_f = @(x,problem) rosen_func(x,problem);
        problem.compute_g = @(x,problem) rosen_grad(x,problem);
        problem.compute_H = @(x,problem) rosen_Hess(x,problem);

    case 'Problem9'
        problem.compute_f = @(x,problem) datafit_func(x,problem);
        problem.compute_g = @(x,problem) datafit_grad(x,problem);
        problem.compute_H = @(x,problem) datafit_Hess(x,problem);

    case 'Problem10'
        problem.n = 10;
        problem.compute_f = @(x,problem) exponential_func(x,problem);
        problem.compute_g = @(x,problem) exponential_grad(x,problem);
        problem.compute_H = @(x,problem) exponential_Hess(x,problem);

    case 'Problem11'
        problem.n = 100;
        problem.compute_f = @(x,problem) exponential_func(x,problem);
        problem.compute_g = @(x,problem) exponential_grad(x,problem);
        problem.compute_H = @(x,problem) exponential_Hess(x,problem);

    case 'Problem12'
        problem.compute_f = @(x,problem) genhumps_5_func(x,problem);
        problem.compute_g = @(x,problem) genhumps_5_grad(x,problem);
        problem.compute_H = @(x,problem) genhumps_5_Hess(x,problem);
        
    otherwise
        error('Problem not defined!!!')
end
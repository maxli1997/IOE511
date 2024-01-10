% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that specifies general options. 
% 
%           Input: options (struct)
%           Output: options (struct)
%
% Warning(s):
%   (1) if tolerance and maximum iterations not specified
%
function [options] = setOptions(options)

% check if termination tolerance specified
if ~isfield(options,'term_tol')
    warning('Termination tolerance not specified!!! Setting to default: 1e-6')
    options.term_tol = 1e-6;
end

% check if max iterations specified
if ~isfield(options,'max_iterations')
    warning('Maximum iterations not specified!!! Setting to default: 1e3')
    options.max_iterations = 1e3;
end

% check if line search parameters specified c1
if ~isfield(options,'c_1_ls')
    warning('Armijo line search parameters not specified!!! Setting to default: c_1_ls = 1e-4')
    options.c_1_ls = 1e-4;
end

% check if line search parameters specified c2
if ~isfield(options,'c_2_ls')
    warning('Armijo line search parameters not specified!!! Setting to default: c_2_ls = 5e-4')
    options.c_2_ls = 5e-4;
end

% check if line search parameters specified alpha_high
if ~isfield(options,'alpha_high')
    warning('Armijo line search parameters not specified!!! Setting to default: alpha_high = 1e3')
    options.alpha_high = 1e3;
end

% check if line search parameters specified alpha_high
if ~isfield(options,'alpha_low')
    warning('Armijo line search parameters not specified!!! Setting to default: alpha_low = 0')
    options.alpha_low = 0;
end

% check if TR radius update parameters specified c1
if ~isfield(options,'c_1_tr')
    warning('TR radius update parameters not specified!!! Setting to default: c_1_tr = 0.1')
    options.c_1_tr = 0.1;
end

% check if TR radius update parameters specified c2
if ~isfield(options,'c_2_tr')
    warning('TR radius update parameters not specified!!! Setting to default: c_2_tr = 0.9')
    options.c_2_tr = 0.9;
end

% check if CG termination tolerance specified
if ~isfield(options,'term_tol_CG')
    warning('CG Termination tolerance not specified!!! Setting to default: 1e-6')
    options.term_tol_CG = 1e-6;
end

% check if CG max iterations specified
if ~isfield(options,'max_iterations_CG')
    warning('CG Maximum iterations not specified!!! Setting to default: 1e3')
    options.max_iterations_CG = 1e3;
end

end
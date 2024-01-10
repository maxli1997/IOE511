% IOE 511/MATH 562, University of Michigan
% Code written by: Yuxin Chen

% Function that: (1) computes the DFP with Armijo backtracking line search step 
%                (2) updates the iterate
%                (3) computes the function and gradient at the new iterate
% 
%           Inputs: x, f, g, H, problem, method, options
%           Outputs: x_new, f_new, g_new, H_new, d, alpha
%
function [x_new,f_new,g_new,H_new] = DFP(x,f,g,H,problem,method,options)

% search direction
d = -H*g;

% set constants
alpha_bar = 1;
c1 = options.c_1_ls;
tau = 0.5;

% set initial values
alpha = alpha_bar;
x_new = x + alpha*d;
f_new = problem.compute_f(x_new,problem);

% Armijo backtracking line search
while f_new > f + c1*alpha*g'*d
    % update alpha
    alpha = tau*alpha;

    % update x and f
    x_new = x + alpha*d;
    f_new = problem.compute_f(x_new,problem);
end

% update gradient
g_new = problem.compute_g(x_new,problem);

% define s & y
s = x_new - x;
y = g_new - g;

if s'*y < options.term_tol*norm(s,2)*norm(y,2)
    % skip update if s'y is not sufficiently positive
    H_new = H;
%     disp('skipped');
else
    % new Hessian approximation
    H_new = H - (H * y * y' * H)/(y' * H * y) + (s * s')/(s' * y);
end

end


% IOE 511/MATH 562, University of Michigan
% Code written by: Yuxin Chen

% Function that: (1) computes the modified Newton with backtracking line search step
%                (2) updates the iterate
%                (3) computes the function and gradient at the new iterate
% 
%           Inputs: x, f, g, problem, method, options
%           Outputs: x_new, f_new, g_new, d, alpha
%
function [x_new,f_new,g_new,H_new] = Newton(x,f,g,H,problem,method,options)

% search direction is -H\g
[R,p] = chol(H);
if ~p
    d = -H\g;
else
    eta = min(diag(H));
    if eta>0
        eta = 0;
    else
        eta = -eta + 1e-6;
    end
    while true
        H = H + eta*eye(size(H));
        [R,p] = chol(H);
        if ~p
            d = -H\g;
            break;
        else
            eta = max(2*eta,1e-6);
        end
    end
end

% set constants
alpha_bar = 1;
c1 = options.c_1_ls;
tau = 0.5;

% set initial values
alpha = alpha_bar;
x_new = x + alpha*d;
f_new = problem.compute_f(x_new,problem);

% backtracking line search
while f_new > f + c1*alpha*g'*d
    % update alpha
    alpha = tau*alpha;

    % update x and f
    x_new = x + alpha*d;
    f_new = problem.compute_f(x_new,problem);
end

% update gradient
g_new = problem.compute_g(x_new,problem);
H_new = problem.compute_H(x_new,problem);
end


% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that: (1) computes the Gradient Descent with Wolfe line search step
%                (2) updates the iterate
%                (3) computes the function and gradient at the new iterate
% 
%           Inputs: x, f, g, problem, method, options
%           Outputs: x_new, f_new, g_new, d, alpha
%
function [x_new,f_new,g_new] = GradientDescentW(x,f,g,problem,method,options)

% search direction is -g
d = -g;

% set constants
alpha_bar = 1;
c1 = options.c_1_ls;
c2 = options.c_2_ls;
alpha_high = options.alpha_high;
alpha_low = options.alpha_low;
tau = 0.5;

% set initial values
alpha = alpha_bar;
x_new = x + alpha*d;
f_new = problem.compute_f(x_new,problem);

% Wolfe line search
k = 0;
while k <= 1e3
    k = k + 1;
    if f_new <= f + c1*alpha*g.'*d
        g_new = problem.compute_g(x_new,problem);
        if g_new.'*d >= c2*g.'*d
            break
        end
    end
    % update alpha
    if f_new <= f + c1*alpha*g'*d
        alpha_low = alpha;
    else
        alpha_high = alpha;
    end
    alpha = tau*alpha_low + (1-tau)*alpha_high;
    % update x, f, and g
    x_new = x + alpha*d;
    f_new = problem.compute_f(x_new,problem);
end

if ~exist('g_new','var')
    g_new = problem.compute_g(x_new,problem);
end

end


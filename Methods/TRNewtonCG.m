% IOE 511/MATH 562, University of Michigan
% Code written by: Yuxin Chen

% Function that: (1) computes the trust region Newton with CG subproblem solver
%                (2) updates the iterate
%                (3) computes the function and gradient at the new iterate
% 
%           Inputs: x, f, g, H, Delta, problem, method, options
%           Outputs: x_new, f_new, g_new, H_new, Delta_new
%
function [x_new,f_new,g_new,H_new,Delta_new] = TRNewtonCG(x,f,g,H,Delta,problem,method,options)

% tolerance
epsilon = options.term_tol_CG;
c1 = options.c_1_tr;
c2 = options.c_2_tr;

%% solve subproblem
% initial condition for inner loop
z = 0*g;
r = g;
p = -r;
% initial condition for outer loop
B = H;
d = 0*g;

if norm(r) < epsilon
    d = z; % d = z = 0
else
    while 1
        if p'*B*p <= 0
            a = p'*p;
            b = 2*p'*z;
            c = z'*z-Delta^2;
            tau1 = (-b+sqrt(b^2-4*a*c))/(2*a);
            tau2 = (-b-sqrt(b^2-4*a*c))/(2*a);
            if f + g'*(z+tau1*p) + (z+tau1*p)'*B*(z+tau1*p)/2 < f + g'*(z+tau2*p) + (z+tau2*p)'*B*(z+tau2*p)/2
                tau = tau1;
            else
                tau = tau2;
            end
            d = z+tau*p;
            break
        end
        alpha = (r'*r)/(p'*B*p);
        z_new = z + alpha*p;
        if norm(z_new) >= Delta
            a = p'*p;
            b = 2*p'*z;
            c = z'*z-Delta^2;
            tau1 = (-b+sqrt(b^2-4*a*c))/(2*a);
            tau2 = (-b-sqrt(b^2-4*a*c))/(2*a);
            if f + g'*(z+tau1*p) + (z+tau1*p)'*B*(z+tau1*p)/2 < f + g'*(z+tau2*p) + (z+tau2*p)'*B*(z+tau2*p)/2
                tau = tau1;
            else
                tau = tau2;
            end
            d = z+tau*p;
            break
        end
        r_new = r + alpha*B*p;
        if norm(r_new) <= epsilon
            d = z_new;
            break
        end
        beta_new = (r_new'*r_new)/(r'*r);
        p_new = -r_new + beta_new*p;

        % update
        r = r_new;
        p = p_new;
        z = z_new;
    end
end

%% update
x_new = x;
Delta_new = Delta;
rho = (f-problem.compute_f(x+d,problem))/(-g'*d-d'*B*d/2);
if rho > c1
    x_new = x + d;
    if rho > c2
        Delta_new = 2 * Delta;
    end
else
    x_new = x;
    Delta_new = 0.5 * Delta;
end
f_new = problem.compute_f(x_new,problem);
g_new = problem.compute_g(x_new,problem);
H_new = problem.compute_H(x_new,problem);
end


% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that runs a chosen algorithm on a chosen problem
%           Inputs: problem, method, options (structs)
%           Outputs: final iterate (x) and final function value (f)
function [x,f] = optSolver_CatAndPenguin(problem,method,options)

% set problem, method and options
[problem] = setProblem(problem);
[method] = setMethod(method);
[options] = setOptions(options);

% compute initial function/gradient/Hessian
x = problem.x0;
f = problem.compute_f(x,problem);
g = problem.compute_g(x,problem);
H = problem.compute_H(x,problem);
switch method.name
    case {'BFGS', 'BFGSW','DFP','DFPW','TRSR1CG'}
        H = eye(size(H));
end
norm_g = norm(g,inf);
Delta = 1;

% set initial iteration counter
k = 0;

% set termination condition parameters
epsilon = 0;
max_iters = 0;
switch method.name
    case {'TRNewtonCG', 'TRSR1CG'}
        epsilon = options.term_tol_CG;
        max_iters = options.max_iterations_CG;
    otherwise
        epsilon = options.term_tol;
        max_iters = options.max_iterations;
end
% initial g_new & H_new
g_new = g;
H_new = H;
Delta_new = Delta;

% plot parameters
kv = k;
fv = f;
gv = g;

% savename
saveName = '';
switch method.name
    case 'GradientDescent'
        saveName = ['GradientDescent_',num2str(options.c_1_ls,'%.0e')]; % name_c1
    case 'GradientDescentW'
        saveName = ['GradientDescentW_',num2str(options.c_1_ls,'%.0e'),'_',num2str(options.c_2_ls,'%.0e'),'_',num2str(options.alpha_high,'%.0e')]; % name_c1_c2_ah
    case 'Newton'
        saveName = ['Newton_',num2str(options.c_1_ls,'%.0e')]; % name_c1
    case 'NewtonW'
        saveName = ['NewtonW_',num2str(options.c_1_ls,'%.0e'),'_',num2str(options.c_2_ls,'%.0e'),'_',num2str(options.alpha_high,'%.0e')]; % name_c1_c2_ah
    case 'BFGS'
        saveName = ['BFGS_',num2str(options.c_1_ls,'%.0e')]; % name_c1
    case 'BFGSW'
        saveName = ['BFGSW_',num2str(options.c_1_ls,'%.0e'),'_',num2str(options.c_2_ls,'%.0e'),'_',num2str(options.alpha_high,'%.0e')]; % name_c1_c2_ah
    case 'DFP'
        saveName = ['DFP_',num2str(options.c_1_ls,'%.0e')]; % name_c1
    case 'DFPW'
        saveName = ['DFPW_',num2str(options.c_1_ls,'%.0e'),'_',num2str(options.c_2_ls,'%.0e'),'_',num2str(options.alpha_high,'%.0e')]; % name_c1_c2_ah
    case 'TRNewtonCG'
        saveName = ['TRNewtonCG_',num2str(options.c_1_tr,'%.0e'),'_',num2str(options.c_2_tr,'%.0e')]; % name_c1_c2
    case 'TRSR1CG'
        saveName = ['TRSR1CG_',num2str(options.c_1_tr,'%.0e'),'_',num2str(options.c_2_tr,'%.0e')]; % name_c1_c2
    otherwise    
        error('Method not implemented yet!')
end

% main loop
% time
tStart = tic;
while (norm(g_new,inf) > epsilon*max(norm_g, 1)) && (k < max_iters)
    
    % take step according to a chosen method
    switch method.name
        case 'GradientDescent'
            [x_new,f_new,g_new] = GradientDescent(x,f,g,problem,method,options);
        case 'GradientDescentW'
            [x_new,f_new,g_new] = GradientDescentW(x,f,g,problem,method,options);
        case 'Newton'
            [x_new,f_new,g_new,H_new] = Newton(x,f,g,H,problem,method,options);
        case 'NewtonW'
            [x_new,f_new,g_new,H_new] = NewtonW(x,f,g,H,problem,method,options);
        case 'BFGS'
            [x_new,f_new,g_new,H_new] = BFGS(x,f,g,H,problem,method,options);
        case 'BFGSW'
            [x_new,f_new,g_new,H_new] = BFGSW(x,f,g,H,problem,method,options);
        case 'DFP'
            [x_new,f_new,g_new,H_new] = DFP(x,f,g,H,problem,method,options);
        case 'DFPW'
            [x_new,f_new,g_new,H_new] = DFPW(x,f,g,H,problem,method,options);
        case 'TRNewtonCG'
            [x_new,f_new,g_new,H_new,Delta_new] = TRNewtonCG(x,f,g,H,Delta,problem,method,options);
        case 'TRSR1CG'
            [x_new,f_new,g_new,H_new,Delta_new] = TRSR1CG(x,f,g,H,Delta,problem,method,options);
        otherwise    
            error('Method not implemented yet!')
    end
    
    % update old and new function values
    x_old = x; f_old = f; g_old = g; H_old = H; norm_g_old = norm_g; Delta_old = Delta;
    x = x_new; f = f_new; g = g_new; H = H_new; norm_g = norm(g,inf); Delta = Delta_new;
    
    % increment iteration counter
    k = k + 1;

    % plot parameters update
    kv(:,end+1) = k;
    fv(:,end+1) = f;
    gv(:,end+1) = g;
    
end
tEnd = toc(tStart);

% plot
% figure();
% plot(kv,fv-problem.compute_f(problem.xstar));
% grid on;
% set(gca, 'YScale', 'log');

% save plot variables
mkdir(['./result/',problem.name]);
xstar = problem.xstar;
fstar = problem.compute_f(xstar,problem);
save(['./result/',problem.name,'/',saveName,'.mat'],...
    'k','f','g','kv','fv','gv','tEnd','xstar','fstar','problem','method','options');

end

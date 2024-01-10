% IOE 511/MATH 562, University of Michigan
% Code written by: Yuxin Chen

% Script to run code

% close all figures, clear all variables from workspace and clear command
% window
close all
clear all
clc

problem.name = 'Problem4';
rng(0)
problem.x0= 20*rand(1000,1)-10;;
load(['./Solutions/',problem.name,'_x_star.mat'])
problem.xstar=x_star;

c1 = [1e-1 5e-2 1e-2 5e-3 1e-3 1e-4];
c2 = [2e-1 5e-1;
      1e-1 2e-1;
      2e-2 5e-2;
      1e-2 2e-2;
      2e-3 5e-3;
      2e-4 5e-4;];
alpha_high = [5e2 1e3];
c1_tr = [0.1 0.2 0.4];
c2_tr = [0.6 0.75 0.9];

methodName = {'GradientDescent'
              'GradientDescentW'
              'Newton'
              'NewtonW'
              'TRNewtonCG'
              'TRSR1CG'
              'BFGS'
              'BFGSW'
              'DFP'
              'DFPW'};

for i = 1:length(methodName)
    mName = methodName{i}; % current method name
    method.name = mName;
    % Trust region method
    if strcmp(mName(end-1:end),'CG')
        for m = 1:length(c1_tr)
            for n = 1:length(c2_tr)
                options.c_1_tr = c1_tr(m);
                options.c_2_tr = c2_tr(n);
                [x,f] = optSolver_CatAndPenguin(problem,method,options);
            end
        end
    % Wolfe line search method
    elseif strcmp(mName(end:end),'W')
        for m = 1:length(c1)
            for n = 1:width(c2)
                for k = 1:length(alpha_high)
                    options.c_1_ls = c1(m);
                    options.c_2_ls = c2(m,n);
                    options.alpha_high = alpha_high(k);
                    [x,f] = optSolver_CatAndPenguin(problem,method,options);
                end
            end
        end
    % Armijo line search method
    else
        for m = 1:length(c1)
            options.c_1_ls = c1(m);
            [x,f] = optSolver_CatAndPenguin(problem,method,options);
        end
    end
    disp([mName,' Done!']);
end
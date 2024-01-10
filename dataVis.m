% IOE 511/MATH 562, University of Michigan
% Code written by: Yuxin Chen

% Script to plot result
clc, clear, close all
mkdir('./result/plots');
probName = 'Problem4';
methodName = {'GradientDescent'  %1
              'GradientDescentW' %2
              'Newton'  %3
              'NewtonW' %4
              'TRNewtonCG' %5
              'TRSR1CG' %6
              'BFGS'  %7
              'BFGSW' %8
              'DFP'   %9
              'DFPW'};%10

%% Parameter Comparison
methodName = methodName{10};
plotName = [probName,'_',methodName];

figure('Position', [50 50 1500 800]);
hold on;
grid on;
% loop
files = dir(['./result/',probName,'/',methodName,'_*.mat']);
% Trust region method
if strcmp(methodName(end-1:end),'CG')
    colororder(hsv(9));
    for i = 1:length(files)
        load([files(i).folder,'/',files(i).name]);
        plot(kv,fv-fstar,'LineWidth', 3);
        legendInfo{i} = ['c1=',num2str(options.c_1_tr,'%.0e'),' c2=',num2str(options.c_2_tr,'%.0e')];
    end
% Wolfe line search method
elseif strcmp(methodName(end:end),'W')
    colororder(hsv(25));
    for i = 1:length(files)
        load([files(i).folder,'/',files(i).name]);
        plot(kv,fv-fstar,'LineWidth', 3);
        legendInfo{i} = ['c1=',num2str(options.c_1_ls,'%.0e'),' c2=',num2str(options.c_2_ls,'%.0e'),' $\alpha_{high}=$',num2str(options.alpha_high,'%.0e')];
    end
% Armijo line search method
else
    colororder(hsv(6));
    for i = 1:length(files)
        load([files(i).folder,'/',files(i).name]);
        plot(kv,fv-fstar,'LineWidth', 3);
        legendInfo{i} = ['c1=',num2str(options.c_1_ls,'%.0e')];
    end
end
legend(legendInfo,'Interpreter','latex','location','southwest');
set(gca, 'YScale', 'log');
xlabel('Iterations','Interpreter','latex');
ylabel('$f(x_k)-f^*$','Interpreter','latex');
title(['Optimality Gap ',probName,' ',methodName],'Interpreter','latex');
set(gca, 'YScale', 'log');
set(gca,'fontsize',25);
saveas(gca,['./result/plots/',plotName],'png');

%% Method Comparison
plotName = probName;

figure('Position', [50 50 1500 800]);
hold on;
grid on;
colororder(hsv(10));
% loop
files = dir(['./result/',probName,'/','*opt*.mat']);
for i = 1:length(files)
    load([files(i).folder,'/',files(i).name]);
    plot(kv,fv-fstar,'LineWidth', 3);
    legendInfo{i} = method.name;
end
legend(legendInfo,'Interpreter','latex','location','southeast');
set(gca, 'YScale', 'log');
xlabel('Iterations','Interpreter','latex');
ylabel('$f(x_k)-f^*$','Interpreter','latex');
xlim([0,150]);
title(['Optimality Gap ',probName],'Interpreter','latex');
set(gca, 'YScale', 'log');
set(gca,'fontsize',25);
saveas(gca,['./result/plots/',plotName],'png');
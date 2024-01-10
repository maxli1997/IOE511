% IOE 511/MATH 562, University of Michigan
% Code written by: Yuxin Chen

% Script to plot result
clc, clear, close all
mkdir('./OptParameters/');

for j = 1:12
    probName = ['Problem',num2str(j)];
    % loop
    files = dir(['./result/',probName,'/','*opt*.mat']);
    for i = 1:length(files)
        load([files(i).folder,'/',files(i).name]);
        strings = split(files(i).name,'_');
        saveName = ([probName,'_',strings(1)]);
        save(strjoin(['./OptParameters/',saveName,'.mat'],''),'options');
    end
end

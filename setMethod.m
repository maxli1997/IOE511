% IOE 511/MATH 562, University of Michigan
% Code written by: Albert S. Berahas

% Function that specifies the method and method specific options. 
% 
%           Input: method (struct); required (method.name)
%           Output: method (struct)
%
% Error(s): 
%   (1) if method not specified
%
function [method] = setMethod(method)

% add path
addpath(genpath(pwd));

% check is method name specified
if ~isfield(method,'name')
    error('Method not specified!!!')
end

end
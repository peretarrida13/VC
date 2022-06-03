%function [out] = bin_local_fun(col)
%BIN_LOCAL_FUN Summary of this function goes here
%   Detailed explanation goes here
    %avg = mean(col);
    %out = col < avg - 20;
%    
%    out = col;
%end
function [out] = bin_local_fun(col)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[x y]=size(col);

avg=sum(col)/x;
out= col(round((x+1)/2))>avg+20;
end
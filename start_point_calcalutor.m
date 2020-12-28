function [X,U]=start_point_calcalutor(public_key,secret_key)

E=mod(public_key+secret_key,2); % Main Key
E=reshape(E,8,8,8);
F=mod(sum(E,2),2);
F=reshape(F,8,8);
G=[128 64 32 16 8 4 2 1]*F;
X=G(1:4)/256; % The initial values
U=G(5:8)/256+mod(G(5:8),10); % The control Parameters
end
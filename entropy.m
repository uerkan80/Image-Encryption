function [ h ] = entropy( x, n )
error( nargchk(1,2,nargin));
if nargin < 2
    n = 256;
end
x = double(x);
xh = hist( x(:), n);
xh = xh / sum(xh(:));
i = find(xh);
h = - sum(xh(i).*log2(xh(i)));
end
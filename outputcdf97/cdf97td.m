function H = cdf97td(X,nlevel)

% Author: Jun Li, more info@ http://goldensectiontransform.org/
% Generating any levels CDF 9/7 wavelet transform matrix
% for 1D signal with whole point symmetric padding by matlab
% X is of length 2^N and note that CDF 9/7 matrix is biorthogonal.

[xx,yy] = size(X);

H=X;
for i=1:nlevel

   for k=1:yy
      [ss,dd] = cdf971d(H(1:xx,k)'); % column transform
      H(1:xx,k) = [ss,dd]';
   end
   
   xx = xx/2;
   yy = yy;

end


%% 1d CDF 9/7 wavelet lifting scheme % symw_ext->...12321...

function [ss,dd] = cdf971d(S)

N = length(S);

fa = -1.586134342;
fb = -0.05298011854;
fc = 0.8829110762;
fd = 0.4435068522;
fz = 1.149604398;

s0 = S(1:2:N-1);  % S(1),S(3),S(5),S(7)...
d0 = S(2:2:N);    % S(2),S(4),S(6),S(8)...

d1 = d0 + fa*(s0 + [s0(2:N/2) s0(N/2)]);
s1 = s0 + fb*(d1 + [d1(1) d1(1:N/2-1)]);

d2 = d1 + fc*(s1 + [s1(2:N/2) s1(N/2)]);
s2 = s1 + fd*(d2 + [d2(1) d2(1:N/2-1)]);

ss = fz*s2;
dd = d2/fz;

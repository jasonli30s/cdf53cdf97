function H = legall53td(X,nlevel)

% Author: Jun Li, more info@ http://goldensectiontransform.org/
% Generating any levels Le Gall 5/3 CDF 5/3 wavelet transform matrix
% for 1D signal with whole point symmetric padding by matlab
% X is of length 2^N and note that CDF 5/3 matrix is biorthogonal.

[xx,yy] = size(X);

H=X;
for i=1:nlevel
   
   for k=1:yy
      [ss,dd] = legall531d(H(1:xx,k)'); % column transform
      H(1:xx,k) = [ss,dd]';
   end
   
   xx = xx/2;
   yy = yy;

end


%% 1d LeGall 5/3 lifting scheme % symw_ext->...12321...

function [ss,dd] = legall531d(S)

N = length(S);

ga = -1/2;
gb = 1/4;
gc = sqrt(2);

s0 = S(1:2:N-1);  % S(1),S(3),S(5),S(7)...
d0 = S(2:2:N);    % S(2),S(4),S(6),S(8)...

d1 = d0 + ga*(s0 + [s0(2:N/2) s0(N/2)]);
s1 = s0 + gb*(d1 + [d1(1) d1(1:N/2-1)]);

ss = gc*s1;
dd = d1/gc;

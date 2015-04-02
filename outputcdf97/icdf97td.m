function X = icdf97td(H,nlevel)

% Author: Jun Li, more info@ http://goldensectiontransform.org/
% Generating any levels inverse CDF 9/7 wavelet transform matrix
% for 1D signal with whole point symmetric padding by matlab
% H is of length 2^N and note that CDF 9/7 matrix is biorthogonal.

[x,y] = size(H);
xx = x/(2^nlevel);
yy = y/(2^nlevel);

X=H;
for i=1:nlevel
   
   for j=1:yy*2
      ss = X(1:xx,j);
      dd = X(xx+1:xx*2,j);
      X(1:xx*2,j) = icdf971d(ss',dd')'; % inverse column transform
   end
   
   xx = xx*2;
   yy = yy*2;
   
end


%% inverse 1d CDF 9/7 lifting scheme % symw_ext->...12321...

function S = icdf971d(ss,dd)

N = length(ss) + length(dd);

fa = -1.586134342;
fb = -0.05298011854;
fc = 0.8829110762;
fd = 0.4435068522;
fz = 1.149604398;

d2 = fz*dd;
s2 = ss/fz;

s1 = s2 - fd*(d2 + [d2(1) d2(1:N/2-1)]);
d1 = d2 - fc*(s1 + [s1(2:N/2) s1(N/2)]);

s0 = s1 - fb*(d1 + [d1(1) d1(1:N/2-1)]);
d0 = d1 - fa*(s0 + [s0(2:N/2) s0(N/2)]);

S(2:2:N) = d0;
S(1:2:N-1) = s0;

function X = ilegall53td(H,nlevel)

% Author: Jun Li, more info@ http://goldensectiontransform.org/
% Generating any levels inverse Le Gall 5/3 CDF 5/3 wavelet transform matrix
% for 1D signal with whole point symmetric padding by matlab
% H is of length 2^N and note that CDF 5/3 matrix is biorthogonal.

[x,y] = size(H);
xx = x/(2^nlevel);
yy = y/(2^nlevel);

X=H;
for i=1:nlevel
   
   for j=1:yy*2
      ss = X(1:xx,j);
      dd = X(xx+1:xx*2,j);
      X(1:xx*2,j) = ilegall531d(ss',dd')'; % inverse column transform
   end
   
   xx = xx*2;
   yy = yy*2;
   
end


%% inverse 1d LeGall 5/3 lifting scheme % symw_ext->...12321...

function S = ilegall531d(ss,dd)

N = length(ss) + length(dd);

ga = -1/2;
gb = 1/4;
gc = sqrt(2);

d1 = gc*dd;
s1 = ss/gc;

s0 = s1 - gb*(d1 + [d1(1) d1(1:N/2-1)]);
d0 = d1 - ga*(s0 + [s0(2:N/2) s0(N/2)]);

S(2:2:N) = d0;
S(1:2:N-1) = s0;

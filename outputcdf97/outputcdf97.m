function outputcdf97

% wh = 2;
% E = eye(wh);
% nlevel = 1;

wh = 8;
E = eye(wh);
nlevel = 3;

LG = cdf97td(E,nlevel)

ILG = icdf97td(E,nlevel)

%% output transform matrix to txt file

fid=fopen('C:\cdf97mtx.txt','w');

fprintf(fid,'%%%% %g-level %g point CDF 9/7 matrix\r\n\r\n',nlevel,wh);

%% output CDF 9/7 wavelet transform matrix

fprintf(fid,'cdf97mtx_%g_%g = [',wh,nlevel);
matrix=LG;
[m,n]=size(matrix);
for i=1:1:m
   for j=1:1:n
      if j==n
         fprintf(fid,'%g\r\n',matrix(i,j));
      else
         fprintf(fid,'%g ',matrix(i,j));
      end
   end
end
fprintf(fid,'];\r\n\r\n\r\n');
%% end


%% output inverse CDF 9/7 wavelet transform matrix

fprintf(fid,'%%%% %g-level %g point inverse CDF 9/7 matrix\r\n\r\n',nlevel,wh);

fprintf(fid,'icdf97mtx_%g_%g = [',wh,nlevel);
matrix=ILG;
[m,n]=size(matrix);
for i=1:1:m
   for j=1:1:n
      if j==n
         fprintf(fid,'%g\r\n',matrix(i,j));
      else
         fprintf(fid,'%g ',matrix(i,j));
      end
   end
end
fprintf(fid,'];\r\n');

fclose(fid);

% is LG*ILG equal identity matrix:

isequal(round(cdf97td(E,nlevel)*icdf97td(E,nlevel)),E)

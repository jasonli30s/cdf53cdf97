function outputcdf53

% wh = 2;
% E = eye(wh);
% nlevel = 1;

wh = 8;
E = eye(wh);
nlevel = 3;

LG = legall53td(E,nlevel)

ILG = ilegall53td(E,nlevel)

%% output transform matrix to txt file

fid=fopen('C:\legall53mtx.txt','w');

fprintf(fid,'%%%% %g-level %g point CDF 5/3 matrix\r\n\r\n',nlevel,wh);

%% output CDF 5/3 wavelet transform matrix

fprintf(fid,'legall53mtx_%g_%g = [',wh,nlevel);
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


%% output inverse CDF 5/3 wavelet transform matrix

fprintf(fid,'%%%% %g-level %g point inverse CDF 5/3 matrix\r\n\r\n',nlevel,wh);

fprintf(fid,'ilegall53mtx_%g_%g = [',wh,nlevel);
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

isequal(round(legall53td(E,nlevel)*ilegall53td(E,nlevel)),E)

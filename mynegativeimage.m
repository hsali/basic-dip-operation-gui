function  z1=mynegativeimage(z);
% z=double(z);
[r,c]=size(z);
m=max(z(:));
z1=m-z
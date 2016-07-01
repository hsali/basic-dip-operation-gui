function   z1=myscaling(z,scx,scy);
% z=imread(i);
scx=1/scx;
scy=1/scy;
[r,c]=size(z);
[x,y]=meshgrid(1:c,1:r);
for i=1:r
    for j=1:c
        x1(i,j)=scx*x(i,j);   % New image coordinates
        y1(i,j)=scy*y(i,j);
    end
end
z=double(z);
z1=interp2(x,y,z,x1,y1,'cubic');

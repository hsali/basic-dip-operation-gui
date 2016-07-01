function  z1=myshifting(z,sx,sy);
[r,c]=size(z);
[x,y]=meshgrid(1:c,1:r);
% a=10;                       % Image shifting units
for i=1:r
    for j=1:c
        x1(i,j)=x(i,j)-sx;   % New image coordinates
        y1(i,j)=y(i,j)-sy;
    end
end
z=double(z);
z1=interp2(x,y,z,x1,y1,'cubic');

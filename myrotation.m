function z1=myrotation(varargin);
% myrotation(image,rotation_angle);
z=varargin{nargin-1};
ra=varargin{nargin};
[r,c]=size(z);
if mod(r,2)==0
    a1=r/2-1;
    a2=r/2;
else 
    a1=(r-1)/2;
    a2=a1;
    
end
if mod(c,2)==0
b1=c/2-1;
    b2=c/2;
else 
    b1=(c-1)/2;
    b2=b1;
end
[x,y]=meshgrid(-b1:b2,-a1:a2);
thet=degtorad(ra);
for i=1:r;
    for j=1:c
        x1(i,j)=cos(thet).*x(i,j)-sin(thet).*y(i,j);
        y1(i,j)=sin(thet).*x(i,j)+cos(thet).*y(i,j);
    end
end
z=double(z);
z1=interp2(x,y,z,x1,y1,'cubic');
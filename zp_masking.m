function out=zp_masking(varargin);
%zp_masking(I,masking,'type'
I=varargin{nargin-2};
mask=varargin{nargin-1};
type=varargin{nargin};
[s1 s2]=size(I);
I=double(I);
z1=zeros(1,s2);
z2=zeros(s1+1,1);
z3=zeros(s1+1,1);
z4=zeros(1,s2+2);
I=[z1;I];
I=[z2,I];
I=[I,z3];
I=[I;z4];
for i=2:s1+1
    for j=2:s2+1
      Val4=[mask(3,2)*I(i+1,j),I(i-1,j)*mask(1,2),I(i,j+1)*mask(2,3),mask(2,1)*I(i,j-1)];
      ValD=[mask(1,1)*I(i-1,j-1),mask(3,1)*I(i+1,j-1),mask(1,3)*I(i-1,j+1),mask(3,3)*I(i+1,j+1)];
      Val8=[Val4,ValD];
 
      switch type
          case 1
              out(i,j)=min(Val8);
          case 2
              out(i,j)=max(Val8);
          case 3
              out(i,j)=mean(Val8);
          case 4  % laplacian n4
              out(i,j)=sum(Val4)-2*I(i,j);
          case 5 % laplacian
              out(i,j)=sum(Val8)-4*I(i,j);
              
          case 6
              out(i,j)=median(Val8);
          otherwise
              error('Third argument value is 1 to 5');
      end
       
 
end
end


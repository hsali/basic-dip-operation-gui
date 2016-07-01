function  z1=mygammatfimage(z,gam)
z=double(z);
% [r,c]=size(z);
% for i=1:r
%     for j=1:c
%        z1(i,j)= (z(i,j)).^gam;
%     end
% end
z1=z.^gam;
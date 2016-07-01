function  z1=mylogimage(z)
z=double(z);
[r,c]=size(z);
F=zeros(r,c);
for i=1:r
    for j=1:c
       z1(i,j)= log10(1+z(i,j));
    end
end


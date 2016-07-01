function out=myfilters(varargin);
%zp_masking(I,masking,'sharp'
I=varargin{nargin-2};
mask=varargin{nargin-1};
type_filter=varargin{nargin};
if type_filter>4
    
    [s1,s2]=size(I);
    I=double(I);
    z1=zeros(1,s2);
    z2=zeros(s1+1,1);
    z3=zeros(s1+1,1);
    z4=zeros(1,s2+2);
    out=zeros(s1+2,s2+2);
    out=double(out);
    I=[z1;I];
    I=[z2,I];
    I=[I,z3];
    I=[I;z4];
    for i=2:s1+1
        for j=2:s2+1
            %       Val4=[mask(3,2)*I(i+1,j),I(i-1,j)*mask(1,2),I(i,j+1)*mask(2,3),mask(2,1)*I(i,j-1)];
            %       ValD=[mask(1,1)*I(i-1,j-1),mask(3,1)*I(i+1,j-1),mask(1,3)*I(i-1,j+1),mask(3,3)*I(i+1,j+1)];
            %       Val8=[Val4,ValD];
            v8=[I(i-1,j-1),I(i-1,j),I(i-1,j+1);I(i,j-1),I(i,j),I(i,j+1);I(i+1,j-1),I(i+1,j),I(i+1,j+1)];
            Val8=mask.*v8;
            switch type
                case 5 % laplacian
                    out(i,j)=sum(Val8(:))-4*I(i,j);
                case 6
                    out(i,j)=min(Val8(:));
                case 7
                    out(i,j)=max(Val8(:));
                case 8
                    out(i,j)=mean(Val8(:));
                case 9
                    out(i,j)=median(Val8(:));
                otherwise
                    error('Third argument value is 1 to 10');
            end
            
            
        end
    end
    out=uint8(out);
else
    switch type
        case 1
            out = edge(I,'sobel');
        case 2
            out= edge(I,'prewitt');
        case 3
            out= edge(I,'roberts');
        case 4
            out= edge(I,'canny');
        otherwise
            error('type value between 1 to 10');
    end
end

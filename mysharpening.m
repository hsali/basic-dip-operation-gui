function BW=mysharpening(varargin); 
% jaffsharpimg(image,sharp,mask,);

I=varargin{1};
sharp=varargin{2};
% mask=varargin{3};
switch sharp
case 1
BW = edge(I,'sobel');
case 2
BW = edge(I,'prewitt');
case 3
BW = edge(I,'roberts');
case 4
BW = edge(I,'canny');
    otherwise
        error('invalid type');
end
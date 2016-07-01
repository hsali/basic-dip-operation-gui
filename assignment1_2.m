function varargout = assignment1_2(varargin)
% ASSIGNMENT1_2 MATLAB code for assignment1_2.fig
%      ASSIGNMENT1_2, by itself, creates a new ASSIGNMENT1_2 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT1_2 returns the handle to a new ASSIGNMENT1_2 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT1_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT1_2.M with the given input arguments.
%
%      ASSIGNMENT1_2('Property','Value',...) creates a new ASSIGNMENT1_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before assignment1_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to assignment1_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help assignment1_2

% Last Modified by GUIDE v2.5 11-May-2013 18:19:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @assignment1_2_OpeningFcn, ...
                   'gui_OutputFcn',  @assignment1_2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before assignment1_2 is made visible.
function assignment1_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to assignment1_2 (see VARARGIN)
set(handles.slider_value,'handlevisibility','on')
% Choose default command line output for assignment1_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes assignment1_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = assignment1_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_apply.
function pushbutton_apply_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image_o image_g image_op
image_o1=image_op;
axes(handles.axes_orignal_image);
imagesc(image_o1); colormap gray;  axis off;
axes(handles.axes_operated_image);
imagesc(image_op); colormap gray; axis off;
msgbox('You can Save you image');
guidata(hObject, handles);


% --- Executes on button press in button_load_image.
function button_load_image_Callback(hObject, eventdata, handles)
% hObject    handle to button_load_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.jpg;*.tif;*.png;*.gif',...
    'All Image Files';...
           '*.*','All Files' },'Select Your Image');    
global  image_o image_g  rows cols;
path=fullfile(pathname,filename);
% check whether pic is coloured or RGB
image_o=imread(path);
[rows cols m]=size(image_o);
set(handles.text_load,'String',num2str(size(image_o)));
if m==1;
    image_g=image_o;
else
    image_g=rgb2gray(image_o); 
end
axes(handles.axes_orignal_image);
imagesc(image_o);colormap gray;axis off
axes(handles.axes_operated_image);
imagesc(image_g);colormap gray;axis off

% --- Executes on button press in pushbutton_exit.
function pushbutton_exit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=questdlg('Do you want to exit this program','Decision','Yes','No','No');
if strcmp(a,'Yes')
delete(gcf);
else
     msgbox('Ok Keep using applicatioin','Decision');
     guidata(hObject, handles);
end





% --- Executes on button press in pushbutton_reset.
function pushbutton_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image_o image_g 
set(handles.popupmenu_operation,'value',1);
set(handles.edit_value,'string',0.0);
set(handles.slider_value,'value',0);
axes(handles.axes_operated_image);
imshow(image_g); colormap gray;axis off
axes(handles.axes_orignal_image);
imshow(image_o); axis off
guidata(hObject, handles);


% --- Executes on button press in pushbutton_home_page.
function pushbutton_home_page_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_home_page (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);
assignment1;

% --- Executes on button press in pushbutton_save.
function pushbutton_save_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% axes(handles.axes_operated_image);
% global path;
% [filename filepath]=uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
%           '*.*','All Files' },'Save Image',...
%           'C:\Work\newfile.jpg');
% if isequal(filename,0) || isequal(pathname,0)
%  a=msgbox('Image do not saved','Message box','help')
% else
%    a=msgbox('image has saved','Message box','help')
% end
global image_op
[filename filepath]=uiputfile();
p=fullfile(filepath,filename);
imwrite(image_op,p);
guidata(hObject, handles);
% --- Executes on slider movement.
function slider_value_Callback(hObject, eventdata, handles)
% hObject    handle to slider_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global  image_g image_op pch sdr;
sdr=get(hObject,'Value');
set(handles.edit_value,'String',sdr);
switch pch
   
    case 1
        image_op=myrotation(image_g,sdr);
        
   case 2
        image_op=myscaling(image_g,sdr,1);
      
   case 3
        image_op=myscaling(image_g,1,sdr);
       
   case 5

        image_op=myshifting(image_g,sdr,0);
        
     case 4
     
        image_op=myshifting(image_g,0,sdr);
        
    otherwise
        warndlg('Choose Operation','Help');
end
        axes(handles.axes_orignal_image);
        imagesc(image_g);colormap('gray'); axis off;
        axes(handles.axes_operated_image);
        imagesc(image_op);colormap('gray');axis off;
guidata(hObject, handles);
    
% --- Executes during object creation, after setting all properties.
function slider_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on selection change in popupmenu_operation.
function popupmenu_operation_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_operation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_operation contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_operation
global rows cols pch sdr
pch=get(handles.popupmenu_operation,'Value');
set(handles.slider_value,'VALUE',0)
switch pch
    case 1
        set(handles.slider_value,'Min',0.0,'Max',360.0);
        set(handles.edit_value,'String',sdr);
%         set(handles.slider_value,'handlevisibility','on');
    case 2 %horizontal scale 0.1 to 10
        set(handles.slider_value,'Min',0.0,'Max',10.0);
        set(handles.edit_value,'String',sdr);
%         set(handles.slider_value,'handlevisibility','on');
    case 3 % vertical scale
        set(handles.slider_value,'Min',0.0,'Max',10.0);
        set(handles.edit_value,'String',sdr);
%         set(handles.slider_value,'handlevisibility','on');
    case 4
        set(handles.slider_value,'Min',0.0,'Max',rows);
        set(handles.edit_value,'String',sdr);
%         set(handles.slider_value,'handlevisibility','on');
    case 5
        set(handles.slider_value,'Min',0.0,'Max',cols);
        set(handles.edit_value,'String',sdr);
%         set(handles.slider_value,'handlevisibility','on');
    otherwise
        warndlg('Choose operation','Help');
end
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function popupmenu_operation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_operation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_value_Callback(hObject, eventdata, handles)
% hObject    handle to edit_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_value as text
%        str2double(get(hObject,'String')) returns contents of edit_value as a double
global evalue
evalue=str2num(get(hObject,'string'));
% --- Executes during object creation, after setting all properties.
function edit_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

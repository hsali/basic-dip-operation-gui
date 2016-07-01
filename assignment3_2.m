function varargout = assignment3_2(varargin)
% ASSIGNMENT3_2 MATLAB code for assignment3_2.fig
%      ASSIGNMENT3_2, by itself, creates a new ASSIGNMENT3_2 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT3_2 returns the handle to a new ASSIGNMENT3_2 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT3_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT3_2.M with the given input arguments.
%
%      ASSIGNMENT3_2('Property','Value',...) creates a new ASSIGNMENT3_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before assignment3_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to assignment3_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help assignment3_2

% Last Modified by GUIDE v2.5 12-May-2013 22:58:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @assignment3_2_OpeningFcn, ...
    'gui_OutputFcn',  @assignment3_2_OutputFcn, ...
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


% --- Executes just before assignment3_2 is made visible.
function assignment3_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to assignment3_2 (see VARARGIN)

% Choose default command line output for assignment3_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes assignment3_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = assignment3_2_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_load_Callback(hObject, eventdata, handles)
% hObject    handle to edit_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_load as text
%        str2double(get(hObject,'String')) returns contents of edit_load as a double


% --- Executes during object creation, after setting all properties.
function edit_load_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_sharpening.
function pushbutton_sharpening_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_sharpening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% sh=str2num(get(handles.edit_load,'String'));

% --- Executes on selection change in popupmenu_sharpenging.
function popupmenu_sharpenging_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_sharpenging (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_sharpenging contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_sharpenging
global image_o image_g image_op;
set(handles.text_load,'string',num2str(size(image_o)));
sharp=get(hObject,'Value');
sharp=sharp-1;
if  sharp>5 && sharp<10
    set(handles.edit_mask,'string',num2str(ones(3,3)*1/9));
else if sharp==5
        set(handles.edit_mask,'string',num2str([1 1 1;1 -8 1;1 1 1]));
    else if sharp==10
            set(handles.edit_mask,'string',num2str(ones(3,3)));
        else
            set(handles.edit_mask,'string','0.0');
        end
    end
end
% image filtering
mask=eval(get(handles.edit_mask,'String'));
if sharp>4 && sharp<10
image_op=myfilters(image_g,mask,sharp);
axes(handles.axes_operated_image);
imagesc(image_op);colormap gray; axis off;
axes(handles.axes_orignal_image);
imshow(image_o) ; axis off;
else
image_op=myfilters(image_g,sharp);
axes(handles.axes_operated_image);
imagesc(image_op);colormap gray; axis off;
axes(handles.axes_orignal_image);
imshow(image_o) ; axis off;
end







% --- Executes during object creation, after setting all properties.
function popupmenu_sharpenging_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_sharpenging (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_exit.
function pushbutton_exit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);
clear all;

% --- Executes on button press in pushbutton_reset.
function pushbutton_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image_o image_g rows cols m
set(handles.text_load,'string',num2str(size(image_o)));
if m==1
    image_g=image_o;
else
    image_g=rgb2gray(image_o);
end
axes(handles.axes_orignal_image);
imshow(image_o);
axes(handles.axes_operated_image);
imshow(image_g)
set(handles.text_load,'string',[rows cols m]);
set(handles.edit_mask,'string',0.0);
set(handles.popupmenu_sharpenging,'value',1);

% --- Executes on button press in pushbutton_save.
function pushbutton_save_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename filepath]=uiputfile('*.*','select place');
path=fullfile(filepath,filename);
im=getimage(handles.axes_operated_image);
imwrite(im,path)
% --- Executes on button press in pushbutton_home_page.
function pushbutton_home_page_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_home_page (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_load.
function pushbutton_load_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image_o image_g m;
path =imgetfile;
% path=fullfile(filepath,filename);  % strcat(filepath,filename);
image_o=imread(path);
[rows cols m]=size(image_o);
if m==1;
    image_g=image_o;
else
    image_g=rgb2gray(image_o);
end

set(handles.text_load,'string',num2str(size(image_o)));
axes(handles.axes_orignal_image);
imshow(image_o);
axes(handles.axes_operated_image);
imshow(image_g);
guidata(hObject,handles);

function edit_mask_Callback(hObject, eventdata, handles)
% hObject    handle to edit_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_mask as text
%        str2double(get(hObject,'String')) returns contents of edit_mask as a double
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit_mask_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_apply.
function pushbutton_apply_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image_o image_g image_op
image_g=image_op;
set(handles.text_load,'string',num2str(size(image_o)));
axes(handles.axes_orignal_image);
imagesc(image_g); colormap gray;
axes(handles.axes_operated_image);
imagesc(image_op); colormap gray;
msgbox('You can Save you image');
guidata(hObject, handles);


% --- Executes on button press in pushbutton_homepage.
function pushbutton_homepage_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_homepage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);
assignment1;

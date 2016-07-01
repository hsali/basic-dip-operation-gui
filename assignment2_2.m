function varargout = assignment2_2(varargin)
% ASSIGNMENT2_2 MATLAB code for assignment2_2.fig
%      ASSIGNMENT2_2, by itself, creates a new ASSIGNMENT2_2 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT2_2 returns the handle to a new ASSIGNMENT2_2 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT2_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT2_2.M with the given input arguments.
%
%      ASSIGNMENT2_2('Property','Value',...) creates a new ASSIGNMENT2_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before assignment2_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to assignment2_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help assignment2_2

% Last Modified by GUIDE v2.5 12-May-2013 22:21:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @assignment2_2_OpeningFcn, ...
                   'gui_OutputFcn',  @assignment2_2_OutputFcn, ...
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


% --- Executes just before assignment2_2 is made visible.
function assignment2_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to assignment2_2 (see VARARGIN)

% Choose default command line output for assignment2_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes assignment2_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = assignment2_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_negative.
function pushbutton_negative_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_apply.
function pushbutton_apply_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global image_o image_g image_op
image_g=image_op;

axes(handles.axes_orignal_image);
imagesc(image_g); colormap gray;
axes(handles.axes_operated_image);
imagesc(image_op); colormap gray;
msgbox('You can Save you image');
guidata(hObject, handles);

% --- Executes on button press in pushbutton_gamma.
function pushbutton_gamma_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 
% --- Executes on button press in pushbutton_exit.
function pushbutton_exit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);


% --- Executes on button press in pushbutton_refresh.
function pushbutton_refresh_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_refresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image_o image_g rows cols m
if m==1
    image_g=image_o;
else
    image_g=rgb2gray(image_o);
end
axes(handles.axes_orignal_image);
imshow(image_o);
axes(handles.axes_operated_image);
imagesc(image_g); colormap gray;
set(handles.text_load,'string',[rows cols m]);
set(handles.text_gamma,'string',0.0);
set(handles.popupmenu_operation,'value',1);
set(handles.slider_gamma,'value',0);


% --- Executes on button press in pushbutton_home_page.
function pushbutton_home_page_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_home_page (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(gcf);
assignment1;


function edit_gamma_Callback(hObject, eventdata, handles)
% hObject    handle to edit_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_gamma as text
%        str2double(get(hObject,'String')) returns contents of edit_gamma as a double


% --- Executes during object creation, after setting all properties.
function edit_gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_load.
function pushbutton_load_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,filepath]=uigetfile('*.*','Pick an image');
global image_o image_g rows cols m;
path=fullfile(filepath,filename);
image_o=imread(path);
[rows cols m]=size(image_o);
if m==1;
    image_g=image_o;
else
    image_g=rgb2gray(image_o);
end

set(handles.text_load,'String',[rows cols m]);
axes(handles.axes_orignal_image);
imshow(image_o);
axes(handles.axes_operated_image);
imagesc(image_g);colormap gray;


function edit_path_Callback(hObject, eventdata, handles)
% hObject    handle to edit_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_path as text
%        str2double(get(hObject,'String')) returns contents of edit_path as a double


% --- Executes during object creation, after setting all properties.
function edit_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_save.
function pushbutton_save_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename filepath]=uiputfile('*.*','select place');
path=fullfile(filepath,filename);
im=getimage(handles.axes_operated_image);
imwrite(im,path)
% helpdlg('You have saved you file at %d with name %d',filepath,filename);
% --- Executes on slider movement.
function slider_gamma_Callback(hObject, eventdata, handles)
% hObject    handle to slider_gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gamma image_g image_op image_o pch;
gamma=get(handles.slider_gamma,'Value');
set(handles.text_gamma,'String',gamma);
if pch==4
image_op=mygammatfimage(image_g,gamma);
        axes(handles.axes_orignal_image);
        imshow(image_o);
        axes(handles.axes_operated_image);
        imagesc(image_op);colormap('gray');
else
    msgbox('choose operation');
end

guidata(hObject, handles);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_gamma (see GCBO)
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
global image_o image_g image_op gamma pch;
pch=get(hObject,'value');
switch pch
    case 2
        image_op=mynegativeimage(image_g);
        axes(handles.axes_orignal_image);
        imshow(image_o);
        axes(handles.axes_operated_image);
        imagesc(image_op);colormap('gray');
    case 3
        image_op=mylogimage(image_g);
        axes(handles.axes_orignal_image);
        imshow(image_o);
        axes(handles.axes_operated_image);
        imagesc(image_op);colormap('gray');
    case 4
        image_op=mygammatfimage(image_g,gamma);
        axes(handles.axes_orignal_image);
        imshow(image_o);
        axes(handles.axes_operated_image);
        imagesc(image_op);colormap('gray');
    otherwise
        msgbox('Choose operation');
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

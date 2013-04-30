function varargout = upload(varargin)
% UPLOAD M-file for upload.fig
%      UPLOAD, by itself, creates a new UPLOAD or raises the existing
%      singleton*.
%
%      H = UPLOAD returns the handle to a new UPLOAD or the handle to
%      the existing singleton*.
%
%      UPLOAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UPLOAD.M with the given input arguments.
%
%      UPLOAD('Property','Value',...) creates a new UPLOAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before upload_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to upload_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help upload

% Last Modified by GUIDE v2.5 21-Apr-2013 19:54:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @upload_OpeningFcn, ...
                   'gui_OutputFcn',  @upload_OutputFcn, ...
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


% --- Executes just before upload is made visible.
function upload_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to upload (see VARARGIN)

% Choose default command line output for upload
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes upload wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = upload_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_upload.
function pushbutton_upload_Callback(hObject, eventdata, handles)
[filename pathname] = uigetfile('*.jpg;*.bmp','Select bmp file');
ab = strcat(pathname,filename)
axes(handles.axes2);
imshow(ab);
imageA = imread(ab);

imageA = rgb2gray(imageA);                          
levelA = graythresh(imageA);
imageA = im2bw(imageA, levelA);
imageA = ~imageA;          

fftA = fft2(double(imageA));
fftA = fftshift(fftA);
fftA = abs(fftA);                                   %get the magnitude
fftB = log(fftA + 1);
fftA = mat2gray(fftB);
[m,n] = size(fftA);
fftA = fftA(1:m/2,n/2:n); 

axes(handles.axes3);
imshow(fftA, []); % Display the result


handles.pushbutton_upload = fftA;
guidata(hObject,handles) 

%plot+scrollowanie+poziom+pion+mniejsza rozdzielczosc(4lub8 razy128/256)
%badania + wnioski = raport
%zamiast stem mamy uzyc plota, trzeba doda� inne okno do kolumn
%transformaty, wybieranie wiersza/kolumny - trzeba rozkmini� jakie�
%scrollowanie zamiast wybierania w edit text, zmniejszyc
%rozdzielczosc(wyswietlac co kt�ras pr�bke)

% hObject    handle to pushbutton_upload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double





% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double

x = str2double(get(hObject, 'String'));
axes(handles.axes4);
[m,n] = size(handles.pushbutton_upload);
if m >= x
    stem(handles.pushbutton_upload(x,:));
else
    error('wiersz poza zakresem');
end
    

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


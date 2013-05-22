function varargout = ProjektPrzejsciowy(varargin)
% ProjektPrzejsciowy M-file for ProjektPrzejsciowy.fig
%      ProjektPrzejsciowy, by itself, creates a new ProjektPrzejsciowy or raises the existing
%      singleton*.
%
%      H = ProjektPrzejsciowy returns the handle to a new ProjektPrzejsciowy or the handle to
%      the existing singleton*.
%
%      ProjektPrzejsciowy('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ProjektPrzejsciowy.M with the given input arguments.
%
%      ProjektPrzejsciowy('Property','Value',...) creates a new ProjektPrzejsciowy or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProjektPrzejsciowy_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProjektPrzejsciowy_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ProjektPrzejsciowy

% Last Modified by GUIDE v2.5 04-May-2013 18:25:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProjektPrzejsciowy_OpeningFcn, ...
                   'gui_OutputFcn',  @ProjektPrzejsciowy_OutputFcn, ...
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


% --- Executes just before ProjektPrzejsciowy is made visible.
function ProjektPrzejsciowy_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProjektPrzejsciowy (see VARARGIN)

% Choose default command line output for ProjektPrzejsciowy
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ProjektPrzejsciowy wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ProjektPrzejsciowy_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function pushbutton_ProjektPrzejsciowy_Callback(hObject, eventdata, handles)
    [filename pathname] = uigetfile('*.jpg;*.bmp','Select bmp file');
    if isequal(filename, 0) || isequal(pathname, 0)  
    else
        ab = strcat(pathname, filename);
        axes(handles.axes2);
        imshow(ab);
        imageA = imread(ab);
        imageA = rgb2gray(imageA);                          
        levelA = graythresh(imageA);
        imageA = im2bw(imageA, levelA);
        imageA = ~imageA;          
        fftA = fft2(double(imageA));
        fftA = fftshift(fftA);
        fftA = abs(fftA);
        fftB = log(fftA + 1);
        fftA = mat2gray(fftB);
        [m,n] = size(fftA);
        fftA = fftA(1:m/2,n/2:n); 
        axes(handles.axes3);
        imshow(fftA, []);
        handles.pushbutton_ProjektPrzejsciowy = fftA(1:4:end,1:4:end);
        
        
        [m,n] = size(fftA);
        pos = get(handles.axes3, 'position');
        width = pos(4) / m * n;
        
        [maxX, maxY] = size(handles.pushbutton_ProjektPrzejsciowy);
        
        set(handles.text4, 'visible', 'on');
        set(handles.text5, 'visible', 'on');
        set(handles.slider2, 'visible', 'on');
        set(handles.slider2, 'position', [pos(1) + pos(3) * 0.5 - width * 0.5, pos(2) - 16, width, 16]);
        set(handles.slider2, 'Value', 1);
        set(handles.slider2, 'Min', 1);
        set(handles.slider2, 'Max', maxY);
        set(handles.slider2, 'SliderStep', [1, 1] / (maxY - 1));
        
        set(handles.slider3, 'visible', 'on');
        set(handles.slider3, 'position', [pos(1) + pos(3) * 0.5 + width * 0.5, pos(2), 16, pos(4)]);
        set(handles.slider3, 'Value', maxX);
        set(handles.slider3, 'Min', 1);
        set(handles.slider3, 'Max', maxX);
        set(handles.slider3, 'SliderStep', [1, 1] / (maxX - 1));
        guidata(hObject,handles)   
    end

%plot+scrollowanie+poziom+pion+mniejsza rozdzielczosc(4lub8 razy128/256)
%badania + wnioski = raport
%zamiast stem mamy uzyc plota, trzeba doda? inne okno do kolumn
%transformaty, wybieranie wiersza/kolumny - trzeba rozkmini? jakie?
%scrollowanie zamiast wybierania w edit text, zmniejszyc
%rozdzielczosc(wyswietlac co kt?ras pr?bke)

% hObject    handle to pushbutton_ProjektPrzejsciowy (see GCBO)
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
[m,n] = size(handles.pushbutton_ProjektPrzejsciowy);
if m >= x
    stem(handles.pushbutton_ProjektPrzejsciowy(x,:));
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


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of
%        slider

    axes(handles.axes4);
    [m, n] = size(handles.pushbutton_ProjektPrzejsciowy);
    currentColumn = floor(get(hObject, 'Value'));
    currentColumnString = int2str(currentColumn);
    newString = ['Column: ' currentColumnString];
    set(handles.text3, 'String', newString);
    set(handles.text3, 'visible', 'on');
    plot(handles.pushbutton_ProjektPrzejsciowy( : , currentColumn));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    axes(handles.axes5);
    [m, n] = size(handles.pushbutton_ProjektPrzejsciowy);
    currentRow = floor(get(hObject, 'Value'));
    currentRowString = int2str(m - currentRow + 1);
    newString = ['Row: ' currentRowString];
    set(handles.text2, 'String', newString);
    set(handles.text2, 'visible', 'on');
    plot(handles.pushbutton_ProjektPrzejsciowy(m - currentRow + 1, :));


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

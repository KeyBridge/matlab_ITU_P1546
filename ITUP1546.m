function varargout = ITUP1546(varargin)
% ITUP1546 M-file for ITUP1546.fig
%      ITUP1546, by itself, creates a new ITUP1546 or raises the existing
%      singleton*.
%
%      H = ITUP1546 returns the handle to a new ITUP1546 or the handle to
%      the existing singleton*.
%
%      ITUP1546('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ITUP1546.M with the given input arguments.
%
%      ITUP1546('Property','Value',...) creates a new ITUP1546 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ITUP1546_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ITUP1546_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ITUP1546

% Last Modified by GUIDE v2.5 27-Aug-2009 10:52:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ITUP1546_OpeningFcn, ...
                   'gui_OutputFcn',  @ITUP1546_OutputFcn, ...
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


% --- Executes just before ITUP1546 is made visible.
function ITUP1546_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ITUP1546 (see VARARGIN)

% Choose default command line output for ITUP1546
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ITUP1546 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ITUP1546_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function distance_Callback(hObject, eventdata, handles)
% hObject    handle to distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of distance as text
%        str2double(get(hObject,'String')) returns contents of distance as a double
d = str2double(get(hObject,'String'));
if isnan(d)
    d = [];
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function distance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to distance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in dplot.
function dplot_Callback(hObject, eventdata, handles)
% hObject    handle to dplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dplot

plotdgraph = get(hObject,'Value');
guidata(hObject, handles);

function frequency_Callback(hObject, eventdata, handles)
% hObject    handle to frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frequency as text
%        str2double(get(hObject,'String')) returns contents of frequency as a double
f = str2double(get(hObject,'String'));
if isnan(f)
    f = [];
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function frequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time as text
%        str2double(get(hObject,'String')) returns contents of time as a double
t = str2double(get(hObject,'String'));
if isnan(t)
    t = [];
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function heff_Callback(hObject, eventdata, handles)
% hObject    handle to heff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of heff as text
%        str2double(get(hObject,'String')) returns contents of heff as a double
heff = str2double(get(hObject,'String'));
if isnan(heff)
    heff = [];
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function heff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to heff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in h1plot.
function h1plot_Callback(hObject, eventdata, handles)
% hObject    handle to h1plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of h1plot
ploth1graph = get(hObject,'Value');

guidata(hObject, handles);

% --- Executes on button press in Calculate.
function Calculate_Callback(hObject, eventdata, handles)
% hObject    handle to Calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

d = str2double(get(handles.distance,'String'));
f = str2double(get(handles.frequency,'String'));
t = str2double(get(handles.time,'String'));
heff = str2double(get(handles.heff,'String'));
ha = str2double(get(handles.Ha,'String'));
hb = str2double(get(handles.Hb,'String'));
if isnan(ha)
    ha = [];
end
if isnan(hb)
    hb = [];
end
plotdgraph = get(handles.dplot,'Value');
ploth1graph = get(handles.h1plot, 'Value');
if get(handles.landpath, 'Value')
    path = 'Land';
end
if get(handles.coldseapath, 'Value')
    path = 'Cold';
end
if get(handles.warmseapath, 'Value')
    path = 'Warm';
end
fs = 0;
if get(handles.step12, 'Value')
    tca = str2double(get(handles.TCA,'String'));
    fs = fs + Step_12(f,tca);
end
if get(handles.step13, 'Value')
    eff = str2double(get(handles.eff,'String'));
    eff1 = str2double(get(handles.eff1,'String'));
    set(handles.tropo,'String',num2str(Step_13(d,f,t,eff,eff1)));  
end

if get(handles.landEnviroment, 'Value')
    env = 'land';
end
if get(handles.denseEnviroment, 'Value')
    env = 'dense';
end
if get(handles.urbanEnviroment, 'Value')
    env = 'urban';
end
if get(handles.openEnviroment, 'Value')
    env = 'open';
end

if get(handles.step15, 'Value')
    fs = fs + Step_15(d,heff,ha,f,env);
end
if get(handles.step14, 'Value')
    h2 = str2double(get(handles.h2,'String'));
    fs = fs + Step_14(h2,f,path,env,d,heff);
end

if plotdgraph
    dx = [  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13,...
    14, 15, 16, 17, 18, 19, 20, 25, 30, 35, 40, 45, 50,...
    55, 60, 65, 70, 75, 80, 85, 90, 95,100,110,120,130,...
    140,150,160,170,180,190,200,225,250,275,300,325,350,...
    375,400,425,450,475,500,525,550,575,600,625,650,675,...
    700,725,750,775,800,825,850,875,900,925,950,975,1000];
y = 1:1:length(dx);
for x=1:length(dx)
    y(x) = P1546FieldStr(dx(x),f,t,heff,ha,hb,path,fs);
end
figure(2);
semilogx(dx,y,'b-')
elseif ploth1graph
        hx = [10, 20, 37.5, 75, 150, 300, 600, 1200];
y = 1:1:length(hx);
for x=1:length(hx)
    y(x) = P1546FieldStr(d,f,t,hx(x),ha,hb,path,fs);
end
figure(2);
semilogx(hx,y,'b--')
else

    set(handles.resultValue,'String',num2str(P1546FieldStr(d,f,t,heff,ha,hb,path,fs)));

end
guidata(hObject, handles);

function Ha_Callback(hObject, eventdata, handles)
% hObject    handle to Ha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ha as text
%        str2double(get(hObject,'String')) returns contents of Ha as a double
ha = str2double(get(hObject,'String'));
if isnan(ha)
    ha = [];
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Ha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Hb_Callback(hObject, eventdata, handles)
% hObject    handle to Hb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Hb as text
%        str2double(get(hObject,'String')) returns contents of Hb as a double
hb = str2double(get(hObject,'String'));
if isnan(hb)
    hb = [];
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function Hb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Hb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in step12.
function step12_Callback(hObject, eventdata, handles)
% hObject    handle to step12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of step12
if get(hObject,'Value')
    set(handles.TCA, 'String', '');
else
    set(handles.TCA, 'String', 'Terrain Clearence >');
end
guidata(hObject, handles);

% --- Executes on button press in step13.
function step13_Callback(hObject, eventdata, handles)
% hObject    handle to step13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of step13
if get(hObject,'Value')
    set(handles.eff, 'String', '');
    set(handles.eff1, 'String', '');
else
    set(handles.eff, 'String', 'h1 Clearence >');
    set(handles.eff1, 'String', 'h2 Clearence >');
end
guidata(hObject, handles);

% --- Executes on button press in step15.
function step15_Callback(hObject, eventdata, handles)
% hObject    handle to step15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of step15



function TCA_Callback(hObject, eventdata, handles)
% hObject    handle to TCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TCA as text
%        str2double(get(hObject,'String')) returns contents of TCA as a double
tca = str2double(get(hObject,'String'));
if isnan(tca)
    tca = [];
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function TCA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TCA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eff_Callback(hObject, eventdata, handles)
% hObject    handle to eff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eff as text
%        str2double(get(hObject,'String')) returns contents of eff as a double
eff = str2double(get(hObject,'String'));
if isnan(eff)
    eff = [];
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function eff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eff1_Callback(hObject, eventdata, handles)
% hObject    handle to eff1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eff1 as text
%        str2double(get(hObject,'String')) returns contents of eff1 as a double
eff1 = str2double(get(hObject,'String'));
if isnan(eff1)
    eff1 = [];
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function eff1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eff1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in step14.
function step14_Callback(hObject, eventdata, handles)
% hObject    handle to step14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of step14

if get(hObject,'Value')
    set(handles.h2, 'String', '');
else
    set(handles.h2, 'String', 'H2 (m)');
end
guidata(hObject, handles);

function h2_Callback(hObject, eventdata, handles)
% hObject    handle to h2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h2 as text
%        str2double(get(hObject,'String')) returns contents of h2 as a double
h2 = str2double(get(hObject,'String'));
if isnan(h2)
    h2 = [];
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function h2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


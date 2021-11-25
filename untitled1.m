% FIREFIGHTING LOADOUT CONFIGURATOR
% WRITTEN AND DEVELOPED BY SAMUEL GREGG
% 4/19/2017
%
% PURPOSE: 
% Allows a Firefighter to determine which role is optimal,
% by collecting data and preferences on different tools and jobs
% used in a typical firefighting scenario. Provides the user a variety
% of combinations to chose from.
%
% I/O SUMMARY:
% The program collects the user's weight with unit preference,
% and choice of job and extra optional tools. In return, descriptions 
% of the role in addition to visual breakdowns and total weight output are
% displayed. Many different combinations, or 'loadouts' can be made.
%
% INPUT:
% - Weight
% - Units (Lbs/Kgs)
% - Role (Four choices)
% - Extras (Five choices)
%
% OUTPUT:
% - Converted weight
% - Total Weight (Both Lbs/Kgs)
% - Pie chart with weight distribution
% - Health recommendation (Safe/Too Heavy)
%
% EXECUTION:
% The program works by first collecting the user's weight and unit.
% Once the user has confirmed their weight, they are able to select between
% various firefighting positions, and finally, chose any extra equipment
% that may be needed. Once weight, role, and extras are selected, the 
% program calculates the total weight of the firefighter, renders a pie 
% chart illustrating the weight breakdown, and offers a rudimentary safety
% suggestion based upon the amount of weight being carried.

% ---------------------------PRE-INITIALIZATION----------------------------

function varargout = untitled1(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled1_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled1_OutputFcn, ...
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

% ---------------------------GLOBAL INITIALIZATION-------------------------

function untitled1_OpeningFcn(hObject, eventdata, handles, varargin)
clc

global choice
choice = 1;

axes(handles.imageBox)
matlabImage = imread('title.png');
image(matlabImage)
axis off
axis image

handles.output = hObject;
guidata(hObject, handles);

% ---------------------------INITIALIZE GUI HANDLES------------------------

function uipushtool2_ClickedCallback(hObject, eventdata, handles)
function weightBox_KeyPressFcn(hObject, eventdata, handles)
function conversionOutput_CreateFcn(hObject, eventdata, handles)
function extrasWeightBox_CreateFcn(hObject, eventdata, handles)
function pounds_Callback(hObject, eventdata, handles)
function kilograms_Callback(hObject, eventdata, handles)
function weightBox_Callback(hObject, eventdata, handles)
function flashlight_Callback(hObject, eventdata, handles)
function radio_Callback(hObject, eventdata, handles)
function boltcutters_Callback(hObject, eventdata, handles)
function thermal_Callback(hObject, eventdata, handles)
function jawsoflife_Callback(hObject, eventdata, handles)
function poundsOrKilograms_CreateFcn(hObject, eventdata, handles)
function varargout = untitled1_OutputFcn(hObject, eventdata, handles) 
function roleSelector_SelectionChangedFcn(hObject, eventdata, handles)
function weightBox_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% ---------------------------MAIN BODY-------------------------------------
% -------------------------------------------------------------------------

% --------- ENABLE VISUALS BASED ON CURRENTLY SELECTED ROLE
function man1_Callback(hObject, eventdata, handles)

global choice
choice = 1;

set(handles.man1,'Enable','off')
set(handles.man2,'Enable','on')
set(handles.man3,'Enable','on')
set(handles.man4,'Enable','on')

[name,desc] = descriptionUpdate;
set(handles.infoText,'String',desc)
set(handles.descriptionText,'String',name)

set(handles.basicButton,'Value',1)

axes(handles.imageBox)
matlabImage = imread('basic.jpg');
image(matlabImage)
axis off
axis image
function man2_Callback(hObject, eventdata, handles)

global choice
choice = 2;

set(handles.man1,'Enable','on')
set(handles.man2,'Enable','off')
set(handles.man3,'Enable','on')
set(handles.man4,'Enable','on')

[name,desc] = descriptionUpdate;
set(handles.infoText,'String',desc)
set(handles.descriptionText,'String',name)

set(handles.canButton,'Value',1)
axes(handles.imageBox)
matlabImage = imread('can.jpg');
image(matlabImage)
axis off
axis image
function man3_Callback(hObject, eventdata, handles)

global choice
choice = 3;

set(handles.man1,'Enable','on')
set(handles.man2,'Enable','on')
set(handles.man3,'Enable','off')
set(handles.man4,'Enable','on')

[name,desc] = descriptionUpdate;
set(handles.infoText,'String',desc)
set(handles.descriptionText,'String',name)

set(handles.ironsButton,'Value',1)
axes(handles.imageBox)
matlabImage = imread('irons.jpg');
image(matlabImage)
axis off
axis image
function man4_Callback(hObject, eventdata, handles)

global choice
choice =4;

set(handles.man1,'Enable','on')
set(handles.man2,'Enable','on')
set(handles.man3,'Enable','on')
set(handles.man4,'Enable','off')

[name,desc] = descriptionUpdate;
set(handles.infoText,'String',desc)
set(handles.descriptionText,'String',name)

set(handles.roofButton,'Value',1)
axes(handles.imageBox)
matlabImage = imread('roof.jpg');
image(matlabImage)
axis off
axis image

% --------- CONFIRM USER INPUT, COMPLETE PRELIMINARY CALCULATIONS ---------
function pushbutton7_Callback(hObject, eventdata, handles)

fprintf('The user has confirmed their input.\n');
input = get(handles.weightBox,'String');
global weight;

unitSelected = (get(handles.pounds,'Value') + get(handles.kilograms,'Value'));

if unitSelected == 0
    errordlg('You must select either Pounds or Kilograms!','Input Error')
    pause(.1)
else
    inputNum = str2num(input);
    
    if isempty(input)
        errordlg('You must enter a value!','Input Error')
        pause(.1)
        set(handles.weightBox,'String','');
        
    elseif (isempty(inputNum)==1)
        errordlg('You must only enter numbers!','Input Error')
        pause(.1)
        set(handles.weightBox,'String','');
    elseif (inputNum >= 500)||(inputNum <= 0)
        errordlg('Please enter a reasonable number.','Input Error')
        pause(.1)
        set(handles.weightBox,'String','');
    else
        set(handles.calculateButton, 'enable','on')
        set(handles.weightBox, 'enable','off')
        set(handles.kilograms, 'enable','off')
        set(handles.pounds, 'enable','off')
        set(handles.kilograms, 'enable','off')
        set(handles.pushbutton7,'ForegroundColor',[0 .5 0])
        set(handles.pushbutton7,'enable','off')
        
        set(handles.poundsOrKilograms,'ForegroundColor',[0 .5 0])
        
        weightinput = str2num(get(handles.weightBox,'String'));
        unit = get(handles.poundsOrKilograms.SelectedObject,'String');
        fprintf('The users weight is %d %s\n',weightinput,unit);
        
        if strcmp('Kilograms',unit)
            weight = round(weightinput/0.45359237);
            kiloOutput = num2str(sprintf('%d Kilograms is equal to %d Pounds\n',weightinput,weight));
            set(handles.conversionOutput,'String',kiloOutput);
            set(handles.conversionOutput,'Visible','on')
            fprintf(kiloOutput);
        else
            weight = weightinput;
        end
    end
    
end

% --------- ENABLE SWITCHING ROLES - DISPLAY ROLE GRAPHICALLY -------------
function basicButton_Callback(hObject, eventdata, handles)
global choice
choice = 1;

%fprintf('Basic gear was selected.\n');
[name,desc] = descriptionUpdate;
set(handles.infoText,'String',desc)
set(handles.descriptionText,'String',name)

matlabImage = imread('basic.jpg');
axes(handles.imageBox)
image(matlabImage)
axis off
axis image
function canButton_Callback(hObject, eventdata, handles)
global choice
choice = 2;

%fprintf('Can Man was selected.\n');
[name,desc] = descriptionUpdate;
set(handles.infoText,'String',desc)
set(handles.descriptionText,'String',name)

matlabImage = imread('can.jpg');
axes(handles.imageBox)
image(matlabImage)
axis off
axis image
function ironsButton_Callback(hObject, eventdata, handles)
global choice
choice = 3;

%fprintf('Irons was selected.\n');
[name,desc] = descriptionUpdate;
set(handles.infoText,'String',desc)
set(handles.descriptionText,'String',name)

matlabImage = imread('irons.jpg');
axes(handles.imageBox)
image(matlabImage)
axis off
axis image
function roofButton_Callback(hObject, eventdata, handles)

global choice
choice = 4;

%fprintf('Roof Man was selected.\n');
[name,desc] = descriptionUpdate;
set(handles.infoText,'String',desc)
set(handles.descriptionText,'String',name)

matlabImage = imread('roof.jpg');
axes(handles.imageBox)
image(matlabImage)
axis off
axis image

% --------- UPDATE NAME + DESCRIPTION BASED ON ROLE -----------------------
function [name,desc] = descriptionUpdate(hObject, eventdata, handles)

global choice

if choice == 1
    name = 'Basic Gear';
    desc = 'Basic gear consists of only the bear essentials needed to protect the firefighter in an IDLH environnemt. Typically, this includes a Helmet, Flash Hood, Jacket, Gloves, Pants, and Boots.';
elseif choice == 2
    name = 'Can Man';
    desc = 'The Can Man is responsible for carrying a portable water can. Despite its small stature, the water tank can prove to be significantly powerful, even against larger fires.';
elseif choice == 3
    name = 'Irons';
    desc = 'Irons consist of a Halligan Bar, and an Axe. These two tools are used for forcing entry into locked/restricted areas. A set of irons can make a major difference in a time sensitive scenario.';
elseif choice == 4
    name = 'Roof Man';
    desc = 'The Roof Man is tasked with creating holes for ventilation. Using a rotating saw and hook, the Roof Man can assist in removing dense smoke from the building, and creating hole for a deck gun.';
else
    desc = 'ARRAY ERROR. SEE LINE 306';
end

% --------- MAIN CALCULATIONS AND DATA OUTPUT -----------------------------
function calculateButton_Callback(hObject, eventdata, handles)

set(handles.calculateButton, 'enable', 'off')
set(handles.basicButton, 'enable','off')
set(handles.canButton, 'enable','off')
set(handles.radio, 'enable','off')
set(handles.ironsButton, 'enable','off')
set(handles.roofButton, 'enable','off')
set(handles.flashlight, 'enable','off')
set(handles.boltcutters, 'enable','off')
set(handles.jawsoflife, 'enable','off')
set(handles.thermal, 'enable','off')

set(handles.man1,'Enable','off')
set(handles.man2,'Enable','off')
set(handles.man3,'Enable','off')
set(handles.man4,'Enable','off')

global extrasWeight
global totalWeight
global gearWeight
global choice
global weight

if choice == 1
    fprintf('The user selected Basic Gear.\n');
elseif choice == 2
    fprintf('The user selected Can Man.\n');
elseif choice == 3
    fprintf('The user selected Irons.\n');
elseif choice == 4
    fprintf('The user selected Roof Man.\n');
else
    fprintf('ARRAY ERROR. SEE LINE 354');
end

gearWeight = 59;
extrasWeight = 0;
weightReadout = sprintf('Your Weight: %d Pounds', round(weight));

set(handles.yourWeight,'String',weightReadout);

pause(.25);

if choice == 1
    gearWeight = 59;
elseif choice == 2
    gearWeight = 96;
elseif choice == 3
    gearWeight = 87;
elseif choice == 4
    gearWeight = 130;
else
end

if (get(handles.radio,'Value')) == 1
    set(handles.radioOutput,'String','+5 Pounds')
    totalWeight = totalWeight + 5;
    extrasWeight = extrasWeight + 5;
    pause(.15);
end

if (get(handles.flashlight,'Value')) == 1
    set(handles.flashlightOutput,'String','+7 Pounds')
    totalWeight = totalWeight + 7;
    extrasWeight = extrasWeight + 7;
    pause(.15);
end

if (get(handles.boltcutters,'Value')) == 1
    set(handles.boltcuttersOutput,'String','+10 Pounds')
    totalWeight = totalWeight + 10;
    extrasWeight = extrasWeight + 10;
    pause(.15);
end

if (get(handles.jawsoflife,'Value')) == 1
    set(handles.jawsoflifeOutput,'String','+30 Pounds')
    totalWeight = totalWeight + 30;
    extrasWeight = extrasWeight + 30;
    pause(.15);
end

if (get(handles.thermal,'Value')) == 1
    set(handles.thermalOutput,'String','+5 Pounds')
    totalWeight = totalWeight + 5;
    extrasWeight = extrasWeight + 5;
    pause(.15);
end

set(handles.weightPie,'Visible','On')
axes(handles.weightPie)
if extrasWeight == 0
   total = [weight,gearWeight]; 
   labels = {'Body','Gear'};
else
   total = [weight,gearWeight,extrasWeight];
   labels = {'Body','Gear','Tools'};
end
colormap([0 .5 0;
         0 0 .5;      
         .85 .33 .1])
pie(handles.weightPie,total,labels);

gearWeightReadout = sprintf('Gear Weight: %d Pounds', gearWeight);
set(handles.roleWeight,'String',gearWeightReadout)
extrasWeightReadout = sprintf('Extras Weight: %d Pounds', extrasWeight);
set(handles.extrasWeightBox,'String',extrasWeightReadout)

totalWeight = gearWeight + weight + extrasWeight;

pause(.25);


healthFactor = (totalWeight / (gearWeight + extrasWeight));
fprintf('This loadout has a health factor of %d',round(healthFactor));

if ( 3.5 < healthFactor)
    set(handles.recommendation,'String','This is an optimal weight!')
    set(handles.recommendation,'ForegroundColor',[0 .5 0])
elseif (2 <= healthFactor)&&(healthFactor <= 3.5)
    set(handles.recommendation,'String','This weight may be safe.')
    set(handles.recommendation,'ForegroundColor',[0 0 .5])
elseif (1.2 < healthFactor)&&(healthFactor < 2)
    set(handles.recommendation,'String','This is too heavy!')
    set(handles.recommendation,'ForegroundColor',[1 0 0])
else
    set(handles.recommendation,'String','Are you kidding?')
    set(handles.recommendation,'ForegroundColor',[.5 0 .5])
end

pause(.5);

set(handles.totalWeight, 'Visible','on')
set(handles.kgBox, 'Visible','on')
pause(.5);
totalWeightKg = round(totalWeight * 0.45359237);
finalCalculationLBS = sprintf('TOTAL FIREFIGHTER WEIGHT:');
finalCalculationKGS = sprintf('%d Pounds \n (%d Kilograms)',totalWeight, totalWeightKg);

set(handles.totalWeight,'String',finalCalculationLBS);
set(handles.kgBox,'String',finalCalculationKGS);
set(handles.startOver, 'Visible','on');

% --------- WIPE GLOBAL VARIABLES AND RESET ALL INPUTS --------------------
function startOver_Callback(hObject, eventdata, handles)

fprintf('\nResetting.\n');
pause(.15)

global weight
global gearWeight
global totalWeight
global choice

weight = 0;
gearWeight = 0;
totalWeight = 0;
choice = 1;

set(handles.pounds, 'enable','on')
set(handles.kilograms, 'enable','on')
set(handles.basicButton, 'enable','on')
set(handles.canButton, 'enable','on')
set(handles.radio, 'enable','on')
set(handles.ironsButton, 'enable','on')
set(handles.roofButton, 'enable','on')
set(handles.flashlight, 'enable','on')
set(handles.boltcutters, 'enable','on')
set(handles.jawsoflife, 'enable','on')
set(handles.thermal, 'enable','on')
set(handles.pushbutton7, 'enable','on')

set(handles.pounds, 'Value',1)
set(handles.kilograms, 'Value',0)
set(handles.basicButton, 'Value',1)
set(handles.canButton, 'Value',0)
set(handles.radio, 'Value',0)
set(handles.ironsButton, 'Value',0)
set(handles.roofButton, 'Value',0)
set(handles.flashlight, 'Value',0)
set(handles.boltcutters, 'Value',0)
set(handles.jawsoflife, 'Value',0)
set(handles.thermal, 'Value',0)
set(handles.pushbutton7, 'Value',0)

set(handles.weightBox, 'enable','on')
set(handles.weightPie,'Visible','off')

set(handles.radioOutput,'String','')
set(handles.flashlightOutput,'String','')
set(handles.boltcuttersOutput,'String','')
set(handles.jawsoflifeOutput,'String','')
set(handles.thermalOutput,'String','')

fprintf('Resetting..\n');

set(handles.yourWeight,'String','')
set(handles.roleWeight,'String','')

set(handles.conversionOutput,'Visible','off')
set(handles.startOver, 'Visible','off')
set(handles.totalWeight, 'Visible','off')
set(handles.kgBox, 'Visible','off')

set(handles.totalWeight,'String','')
set(handles.weightBox,'String','')
set(handles.recommendation,'String','')

set(handles.man1,'Enable','on')
set(handles.man2,'Enable','on')
set(handles.man3,'Enable','on')
set(handles.man4,'Enable','on')

fprintf('Resetting...\n');

set(handles.pushbutton7,'ForegroundColor',[0 0 0])
set(handles.poundsOrKilograms,'ForegroundColor',[1 0 0])

axes(handles.imageBox)
matlabImage = imread('title.png');
image(matlabImage)
axis off
axis image

set(handles.extrasWeightBox,'String','')
set(handles.descriptionText,'String','')
set(handles.infoText,'String','')

total = 1;
labels = {' '};
colormap([.94 .94 .94])
pie(handles.weightPie,total,labels);

fprintf('Resetting.... Done!\n');
pause(.15)

clc

% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
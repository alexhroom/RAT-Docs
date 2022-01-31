function thisPanel = mainGuiContrastPanelSetup(problem,contrast)

problemClass = problem.problem;
problemStruct = problemClass.toStruct();

thisPanel = javaObjectEDT(mainGuiContrastPanel());

contrastName = 'name TODO'; %problem.contrastNames{contrast};
thisTextfield = javaObjectEDT(thisPanel.getMainGuiContrastNameTxtFld());
thisTextfield.setText(contrastName);

% contrastType = problem.contrastTypes{contrast};
% thisTextfield = javaObjectEDT(thisPanel.getMainGuiContrastTypeTxtFld());
% thisTextfield.setText(contrastType);

pathBox = javaObjectEDT(thisPanel.getMainGuiContrastPathTxtFld());
% switch contrastType
%     case 'Ascii File'
%         pathBox.setVisible(true);
%         pathBox.setText(problem.contrastFiles{contrast});
%     otherwise
        pathBox.setVisible(false);
%end

scrPane = javaObjectEDT(thisPanel.getMainGuiContrastScrollPane());
switch lower(problemStruct.ModelType)
    case 'layers'
        table = mainGuiContrastLayersDetailsTable(problemStruct,contrast);
    otherwise
        table = mainGuiContrastCustomLayersDetailsTable(problemStruct,contrast);
end
scrPane.setViewportView(table);

scaleBox = javaObjectEDT(thisPanel.getMainGuiContrastScalefTxtFld());
backBox = javaObjectEDT(thisPanel.getMainGuiContrastBackTxtFld());
shiftBox = javaObjectEDT(thisPanel.getMainGuiContrastShiftTxtFld());

whichBack = problemStruct.backgroundNames(problemStruct.contrastBacks{contrast}(1));
backBox.setText(whichBack);

whichScale = problemStruct.scalefactorNames{problemStruct.contrastScales(contrast)};
scaleBox.setText(whichScale);

whichShift = problemStruct.qzshiftNames{problemStruct.contrastShifts(contrast)};
shiftBox.setText(whichShift);

repeatsCheckbox = javaObjectEDT(thisPanel.getRepeatLayersCheckbox());
repeatsTxtField = javaObjectEDT(thisPanel.getRepeatLayersTextBox());

if strcmpi(problemStruct.ModelType,'layers') == 1
    repeats = problemStruct.contrastRepeatSLDs{contrast};
    repeatsTxtField.setText(java.lang.String(num2str(repeats(2))));
    if repeats(1) == 1
        repeatsCheckbox.setSelected(true);
    else
        repeatsCheckbox.setSelected(false);
        repeatsTxtField.setEnabled(false);
    end
else
    repeatsCheckbox.setVisible(false);
    repeatsTxtField.setVisible(false);
end

dataQMin = javaObjectEDT(thisPanel.getDataQminTextField());
dataQMax = javaObjectEDT(thisPanel.getDataQmaxTextField());
simQMin = javaObjectEDT(thisPanel.getSimQminTextField());
simQMax = javaObjectEDT(thisPanel.getSimQmaxTextField());

dataQMin.setText(num2str(problemStruct.dataLimits{contrast}(1)));
dataQMax.setText(num2str(problemStruct.dataLimits{contrast}(2)));
simQMin.setText(num2str(problemStruct.simLimits{contrast}(1)));
simQMax.setText(num2str(problemStruct.simLimits{contrast}(2)));

% set(dataQMin,'UserData',contrast);
% set(dataQMax,'UserData',contrast);
% set(simQMin,'UserData',contrast);
% set(simQMax,'UserData',contrast);
% set(repeatsCheckbox,'UserData',contrast);
% set(repeatsTxtField,'UserData',contrast);


numPointsLabel = javaObjectEDT(thisPanel.getSimNPointsLabel());
numPointsTextBox = javaObjectEDT(thisPanel.getSimNPointsTextBox());
%if (problem.dataPresent(contrast) == 1)
    numPointsLabel.setVisible(false);
    numPointsTextBox.setVisible(false);
%else
%    numPointsTextBox.setText(num2str(problem.simNPoints(contrast)));
%    h = handle(numPointsTextBox,'CallbackProperties');set(h,'ActionPerformedCallback',@simNPointsChanged);
%    setappdata(numPointsTextBox,'UserData',contrast);
%end

resample = problemStruct.resample(contrast);
resampleCheckbox = javaObjectEDT(thisPanel.getMainGuiResampleCheckbox);
if resample
    resampleCheckbox.setSelected(true);
else
    resampleCheckbox.setSelected(false);
end

h = handle(resampleCheckbox,'CallbackProperties');
set(h,'ActionPerformedCallback',@resampleCheckboxChanged);
setappdata(h,'UserData',contrast);

h = handle(dataQMin,'CallbackProperties');
set(h,'ActionPerformedCallback',@dataQMinChanged);
% accessible = get(h,'AccessibleContext');
% set(accessible,'UserData',contrast);
setappdata(h,'UserData',contrast)

h = handle(dataQMax,'CallbackProperties');
set(h,'ActionPerformedCallback',@dataQMaxChanged);
% accessible = get(h,'AccessibleContext');
% set(accessible,'UserData',contrast);
setappdata(h,'UserData',contrast)

h = handle(simQMin,'CallbackProperties');
set(h,'ActionPerformedCallback',@simQMinChanged);
% accessible = get(h,'AccessibleContext');
% set(accessible,'UserData',contrast);
setappdata(h,'UserData',contrast)

h = handle(simQMax,'CallbackProperties');
set(h,'ActionPerformedCallback',@simQMaxChanged);
% accessible = get(h,'AccessibleContext');
% set(accessible,'UserData',contrast);
setappdata(h,'UserData',contrast)

h = handle(repeatsCheckbox,'CallbackProperties');
set(h,'ActionPerformedCallback',@repeatsBoxChecked);
setappdata(h,'UserData',contrast);

h = handle(repeatsTxtField ,'CallbackProperties');
set(h,'ActionPerformedCallback',@repeatsTxtChanged);
setappdata(h,'UserData',contrast);

if ~(problemStruct.dataPresent(contrast))
    dataQMin.setEditable(false);
    dataQMax.setEditable(false);
end

% include = problem.include_data(contrast);
% includeInFitCheckbox = thisPanel.getIncludeInFitCheckBox;
% if include == 1
%     includeInFitCheckbox.setSelected(true);
% else
%     includeInFitCheckbox.setSelected(false);
% end
% 




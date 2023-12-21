function addFigureLabel(figHandle, axesHandle, LabelString, LabelSize)
% This function is to add labels to each subplot in a figure object.
% Input:
% figHandle - the created figure window object
% axesHandle - the axes handle (check axes.OuterPosition)
% LabelString - label string
% LabelSize - the font size

%% main function
% define the position of the label axes
axesPosition = axesHandle.OuterPosition;
leftPosition = axesPosition(1);
bottomPosition = axesPosition(2) + axesPosition(4);

% create the axes  
ax_1 = axes(figHandle, 'Position', [leftPosition, bottomPosition, 0.08, 0.05], 'Clipping', 'off', 'Box', 'off');
axis(ax_1,'off');
axis(ax_1, [0,1,-1,0]);
text(ax_1, 0, -1, LabelString, ...
    'Interpreter', 'Latex', 'FontSize', LabelSize, ...
    'HorizontalAlignment', 'Left', 'VerticalAlignment', 'middle');

end
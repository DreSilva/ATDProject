function activitylabels = importfileActLabel(filename)
%% Initialize variables.
delimiter = ' ';
startRow = 1;
endRow = inf;

%% Format for each line of text:
%   column1: text (%s)
%	column2: text (%s)
formatSpec = '%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
%% Close the text file.
fclose(fileID);

%% Create output variable
activitylabels = [dataArray{1:end-1}];


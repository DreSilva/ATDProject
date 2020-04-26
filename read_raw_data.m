function filedata = read_raw_data(filename)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   filedata = IMPORTFILE(FILENAME) Reads data from text file
%   FILENAME for the default selection.
%
%   filedata = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from
%   rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   filedata = importfile('acc_exp20_user10.txt', 1, 11601);
%% Initialize variables.
delimiter = ' ';
startRow = 1;
endRow = inf;
%% Format for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%[^\n\r]';
%% Open the text file.
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'TextType', 'string', 'EmptyValue', NaN, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
%% Close the text file.
fclose(fileID);
%% Create output variable
filedata = [dataArray{1:end-1}];

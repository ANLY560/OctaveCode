Fs = 1/3600;    % Sampling frequency for hourly samples
T = 1/Fs;       % Sampling period 
L = 8760;       % Length of data set
t = (0:L-1)*T;  % Time vectorize

%% Load Data
data = load('COandNOx2.txt');
CO = data(:, 1);
NOx = data(:, 2);
temp = data(:, 3);
RH = data(:, 4);
AH = data(:, 5);
m = length(L);

if (CO(:,1) == -200) CO(:,1)=0 end;
if (NOx(:,1) == -200) NOx(:,1)=0 end;


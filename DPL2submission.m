%%% PLEASE READ %%%
% These lines of code generate the daw data and save it to a text file. The raw
% data is different each time you submit your script, but the structure of the 
% text file is the same. If your code is written to read in data from a text file
% organized like the provided example file, your code should work just fine, even
% though the actual range of capacitance values you calculate will change each
% time you submit your script.
[IRaw,tRaw] = Data_Generation;
T = table(tRaw',IRaw','VariableNames',["Time (s)","Current (A)"]);
writetable(T,'DPL2_Raw_Data.txt');
RData = readtable('DPL2_Raw_Data.txt');
Time = table2array(RData(:,1)); %times
Current = table2array(RData(:,2)); %currents

Z = 10; %ohms
L = .01; %henries
f = 500; %hertz
w = 2*pi*f; %frequency
v0 = 5; %volts

g = 5*1e-3; %goal
c1 = 100*1e-6;
rmsemax = 1;
rmsemin = 1;
s = -1e-6;
t = Time;

c2 = 1e-6;
s2 = 1e-6;

while rmsemin > g
    theta_min = ((1/c2)-L*w^2)/(w*Z);
    Bmin = Z^2 + ((w*L)-1/(w*c2))^2;
    Imin = (v0*sin(w*t + atan(theta_min))) / sqrt(Bmin);
    theoCurrentmin = Imin;
    rmsemin = rmse(theoCurrentmin,Current);
    c2 = c2+s2;
end

while rmsemax > g
    theta_max = ((1/c1) - L*w^2) / (w*Z);
    Bmax = Z^2 + ((w*L) - 1 / (w*c1))^2;
    Imax = (v0 * sin(w*t + atan(theta_max))) / sqrt(Bmax);
    theoCurrentmax = Imax;
    rmsemax = rmse(theoCurrentmax,Current);
    c1 = c1+s;
end

Cmax = c1 + s;
Cmin = c2 - s2;
%% MAKE YOUR FIRST PLOT BELOW THIS COMMENT BLOCK
%% Do not create a new figure 1 or a variable called F1.
%% Simply use the plot function to plot the arrays of interest.
%% Make sure your plot has a title, axis labels, and a legend
F1 = figure(1);
plot(Time,Current,'g-')
xlabel('time');
ylabel('current');
legend('ahaha')
%% MAKE YOUR SECOND PLOT BELOW THIS COMMENT BLOCK
%% Do not create a new figure 2 or a variable called F2.
%% Simply use the plot function to plot the arrays of interest.
%% Make sure your plot has a title, axis labels, and a legend
F2 = figure(2);

RData = readtable('DPL2_Raw_Data.txt');
Time = table2array(RData(:,1)); %times
Current = table2array(RData(:,2)); %currents

Z = 10; %ohms
L = .01; %henries
f = 500 %hertz
w = 2*pi*f;; %frequency
v0 = 5; %volts

g = 5*1e-3;
c1 = 100*1e-6;
rmsemax = 1;
rmsemin = 1;
s = -1e-6;
t = Time;

c2 = 1e-6;
s2 = 1e-6;

while rmsemine > goal
    theta_min = ((1/c2)-L*w^2)/(w*Z);
    Bmin = Z^2 + ((w*L)-1/(w*c2))^2;
    Imin = (v0*sin(w*t + atan(theta_min))) / sqrt(Bmin);
    theoCurrentmin = Imin;
    rmsemin = rmse(theoCurrentmin,Current);
    c2 = c2+s2;
end

while rmsemax > goal
    theta_max = ((1/c1) - L*w^2) / (w*R);
    Bmax = Z^2 + ((w*L) - 1 / (w*c2))^2;
    Imin = (v0 * sin(w*t + atan(theta_min))) / sqrt(Bmin);
    theoCurrentmin = Imin;
    rmsemin = rmse(theoCurrentmin,current);
    c2 = c2 +s2;
end

while rmsemax > goal
    theta_max = ((1/c1) - L*w^2) / (w*Z);
    Bmax = Z^2 + ((w*L) - 1 / (w*c1))^2;
    Imax = (v0 * sin(w*t + atan(theta_max))) / sqrt(Bmax);
    theoCurrentmax = Imax;
    rmsemax = rmse(theoCurrentmax,Current);
    c1 = c1+s;
end

cmax = c1 + s;
cmin = c2 - s2;

plot(Time,Current,'s-')
xlabel('time')
ylablel('current')
legend('hahshdbsshbsbdh')
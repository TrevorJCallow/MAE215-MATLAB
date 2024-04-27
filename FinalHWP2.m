function Output = TipSlide(P,y,m,l,mu)
z = length(P); 
Output = zeros(1,z) %preallocating an array the size of entries in the inputs

for Q = 1:z %entry In
WC (1, Q) = 9.81*m(1,Q); % entry
F (1, Q) = mu(1,Q) *WC(1,Q); % Friction

if P(1,Q) < F(1,Q) %fricton
Xc(1,Q) = .5*l(1,Q)
MAA (1, Q) = -P(1, Q) *y (1,Q) + WC(1, Q) *Xc (1,Q);  
if MAA (1, Q) < Q
Output (1, Q) = 0;% tip
else
Output (1,Q) = 1;% none
end
else
Output (1,Q) = -1;% slide
end
end
end % do not write below this line
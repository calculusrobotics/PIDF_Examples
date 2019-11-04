function percent = control(error, intError, derivError, omega_d)
P = 0.1*2*2;
I = 0.00;
D = -10*P*2;
F = 1/1.2;

%percent = 1;
percent = P * error + I * intError + D * derivError + F * omega_d;
end


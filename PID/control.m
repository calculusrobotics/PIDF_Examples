function percent = control(error, intError, derivError)
P = 0.1*2*2*10;
I = 0.00;
D = 10*P*2*2;

percent = P * error + I * intError + D * derivError;
end


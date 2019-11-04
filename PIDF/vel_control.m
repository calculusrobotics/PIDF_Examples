J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
A = [
    -b/J   K/J
    -K/L   -R/L
];
B = [
    0
    1/L];

C = [1, 0];
D = 0;



T = 0.01;
N = 500;

sys = c2d(ss(A, B, C, D), T);

V = 12;



omega = 0;
omega_d = pi/4;
x = [0, 0]';

error = omega_d - omega;
errorDeriv = 0;
errorInt = 0;

ts = [];
omegas = [];

for i=0:N
    omega = x(1);
    lastError = error;
    error = omega_d - omega;
    errorDeriv = error - lastError;
    errorInt = errorInt + error;
    
    u = V * control(error, errorInt, errorDeriv, omega_d);
    x = sys.A * x + sys.B * u;
    
    ts(i + 1) = i * T;
    omegas(i + 1) = omega;
end

plot(ts, omegas);
yline(omega_d);
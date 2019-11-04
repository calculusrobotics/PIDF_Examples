J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
A = [
    0   1      0
    0   -b/J   K/J
    0   -K/L   -R/L
];
B = [
    0
    0
    1/L];

C = [1, 0, 0];
D = 0;



T = 0.01;
N = 500;

sys = c2d(ss(A, B, C, D), T);

V = 12;



theta = 0;
theta_d = 2 * pi;
x = [0, 0, 0]';

error = theta_d - theta;
errorDeriv = 0;
errorInt = 0;

ts = [];
thetas = [];

for i=0:N
    theta = x(1);
    lastError = error;
    error = theta_d - theta;
    errorDeriv = error - lastError;
    errorInt = errorInt + error;
    
    u = V * control(error, errorInt, errorDeriv);
    x = sys.A * x + sys.B * u;
    
    ts(i + 1) = i * T;
    thetas(i + 1) = theta;
end

plot(ts, thetas);
yline(theta_d);
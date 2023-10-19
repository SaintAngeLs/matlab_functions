x = (-8*pi: 10^(-4): 8*pi)';
disp(size(x))
y_error = (sin(x) - x).*x.^(-3);
tic
y = xsin3(x);
toc
figure(1)
plot(x,y, '-g')
hold on
plot(x,y_error, '-r')
fprintf("\n-------------------------------------\n")
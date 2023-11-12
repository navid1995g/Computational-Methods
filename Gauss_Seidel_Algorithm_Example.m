clear;
clc;

% Gauss-Seidel Algorithm Example

A = [0.8 -0.4 0;-0.4 0.8 -.4;0 -0.4 0.8];
b = [41;25;125];

% Initial guess

x1(1) = 0;
x2(1) = 0;
x3(1) = 0;

% Relaxation Factor

lambda = 1.2;

Iteration = 10;

for k = 1:Iteration
    
    x1(k + 1) = (41 + 0.4*x2(k))/0.8
    
    % Relaxation Term (Uncomment)
    % x1(k + 1) = relaxation(x1(k + 1),x1(k),lambda)
    
    err1 = error(x1(k + 1),x1(k))
   
    x2(k + 1) = (25 + 0.4*x1(k + 1) + 0.4*x3(k))/0.8
    
    % Relaxation Term (Uncomment)
    % x2(k + 1) = relaxation(x2(k + 1),x2(k),lambda)
    
    err2 = error(x2(k + 1),x2(k))

    x3(k + 1) = (105 + 0.4*x2(k + 1))/0.8
    
    % Relaxation Term (Uncomment)
    % x3(k + 1) = relaxation(x3(k + 1),x3(k),lambda)
    
    err3 = error(x3(k + 1),x3(k))

    if error(x1(k + 1),x1(k)) < 5 && error(x2(k + 1),x2(k)) < 5 && error(x3(k + 1),x3(k)) < 5

        break
        
    end

end

function x = relaxation(x_new,x_old,lambda)

    x = lambda*x_new + (1 - lambda)*x_old;

end

function err = error(x_new,x_old)

    err = (x_new - x_old)/x_new*100;

end

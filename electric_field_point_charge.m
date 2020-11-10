% Electric field vectors at (x,y,z) due to single point charge
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%                       PROGRAM DESCRIPTION
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Place a point charge, q1, at position r1 = (1,0,0) where 
%    Figure 1a (q1 = +e)
%    Figure 1b (q11 = -e)
%
% We will evaluate the vector field, E(r2) = E(x,y,z), for some {x,y,z}
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

e0 = 8.854e-12; % [C^2 J^-1 m^-1]
q1 = 1.602e-19; % [C], unit of charge
r1 = [1, 0, 0]; % [nm], [x, y, z]-coordinate of q1 in 

% Figure 1: Plot the positive point charge
figure(1); clf; zoom on;
subplot(1,2,1); 
h1 = plot3(r1(:,1),r1(:,2),r1(:,3),'bo','markersize',10); hold on;
set(h1, 'markerfacecolor', get(h1, 'color')); % Use same color to fill in markers

% Format Figure #1
xlabel('x-axis [nm]','Interpreter','latex'); 
ylabel('y-axis [nm]','Interpreter','latex'); 
zlabel('z-axis [nm]','Interpreter','latex'); 
set(gca,'TickLabelInterpreter','latex','FontSize',16,'box','on',...
    'linewidth',2); grid on;

% Figure 1: Plot the negative charge
subplot(1,2,2); 
h1 = plot3(r1(:,1),r1(:,2),r1(:,3),'ro','markersize',10); hold on;
set(h1, 'markerfacecolor', get(h1, 'color')); % Use same color to fill in markers

% Format Figure #1
xlabel('x-axis [nm]','Interpreter','latex'); 
ylabel('y-axis [nm]','Interpreter','latex'); 
zlabel('z-axis [nm]','Interpreter','latex'); 
set(gca,'TickLabelInterpreter','latex','FontSize',16,'box','on',...
    'linewidth',2); grid on;

% Define the coordinates r2 = (x,y,z) at which to evaluate E(r2)
x = -5:1:5; % [nm]
y = -5:1:5; % [nm]
z = -5:1:5; % [nm]

% Take all permutations (x,y,z) - which scales as (dim x)(dim y)(dim z)
[X,Y,Z] = ndgrid(x,y,z);
x = X(:); 
y = Y(:);
z = Z(:); 

r2 = [x, y, z]; % (3) column vectors

% Evaluate the vector, r21, for all (x,y,z), where r21 = r1 - r2 and 
% r21 is the vector from r2 to r1
r21 = r2 - r1; % [nm], matrix of (3) col vectors, r12_x, r12_y, r12_z

% Define the unit vector, hat{r12} for all (x,y,z)
rh21 = r21./vecnorm(r21,2,2);

% Define the magnitude of r21
r21m = vecnorm(r21,2,2); 

% %check that rh21 is normalized
% check = vecnorm(rh21,2,2);
% openvar('check')

% Define the electric field components (vector) at every point (x,y,z)
Ex = (4*pi*e0)^(-1)*(q1./r21m.^2).*rh21(:,1); % [V m / nm^2]
Ey = (4*pi*e0)^(-1)*(q1./r21m.^2).*rh21(:,2); %     or 
Ez = (4*pi*e0)^(-1)*(q1./r21m.^2).*rh21(:,3); % 10e8 V/m


% Now, plot the vector field, E(r2), for every point (x,y,z)
figure(1); 
subplot(1,2,1); 
f1 = quiver3(x,y,z,Ex,Ey,Ez,'b','markersize',1); 
xlim([-5,5]); ylim([-5,5]); zlim([-5,5]);
title('Positive Charge','Interpreter','Latex','FontSize',16); 
f1.ShowArrowHead = 'on';
f1.MaxHeadSize = 0.5; 
legend('+q','$E(r)$','interpreter','latex','FontSize',16,'box','off'); 

subplot(1,2,2); 
f1 = quiver3(x,y,z,-Ex,-Ey,-Ez,'r','markersize',1); 
xlim([-5,5]); ylim([-5,5]); zlim([-5,5]);
title('Negative Charge','Interpreter','Latex','FontSize',16); 
f1.ShowArrowHead = 'on';
f1.MaxHeadSize = 0.5; 
legend('-q','$E(r)$','interpreter','latex','FontSize',16,'box','off'); 
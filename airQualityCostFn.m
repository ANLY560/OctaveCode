%%
%  This script plots the original data, computes a cost function, J,
%  and using gradient descent finds the intercept (theta0) and slope (theta1) 
%   for a linear regression based on the original data.  
%
%  This script also calls the following scripts/functions
%    -plotData.m
%    -computeCost.m
%    -gradientDescent.m
%
%   You need to have all scripts as well as your data file (airQuality.txt) in
%   the same working directory before you start running this script!
%
%%

%% ==================== Part 1: Loading and Plotting ===================

fprintf('Plotting Data ...\n')
data = load('airQuality.txt');
X = data(:, 1); y = data(:, 2);
if (data(:,:) < 0) 
  data(:,:) = 0
endif
m = length(y); % number of training examples

fprintf('Min values of CO and NOx are: ');
fprintf('%f %f \n', min(data(:,1)), min(data(:,2)));

% Plot Data
% Note: You have to complete the code in plotData.m
plotData(X, y);

%% =================== Part 2: Gradient descent ===================
fprintf('Running Gradient Descent ...\n')

X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
iterations = 1500;
alpha = 0.05;

% compute initial cost
computeCost(X, y, theta);

% run gradient descent
theta = gradientDescent(X, y, theta, alpha, iterations);

% print theta to screen
fprintf('Theta found by gradient descent: ');
fprintf('%f %f \n', theta(1), theta(2));

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

%% ============= Part 3: Visualizing J(theta_0, theta_1) =============
fprintf('Visualizing J(theta_0, theta_1) ...\n')

% Grid over which we will calculate J
theta0_vals = linspace(0, 1000, 100);
theta1_vals = linspace(0, 1000, 100);

% initialize J_vals to a matrix of 0's
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% Fill out J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];    
	  J_vals(i,j) = computeCost(X, y, t);
    end
end


% Because of the way meshgrids work in the surf command, we need to 
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% Contour plot
figure;
% Plot J_vals as 15 contours spaced logarithmically between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-20, 30, 200))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);

fprintf('The red x in Figure 3 marks the minimum, i.e. the intercept and slope')
fprintf('of the regression line based on gradient descent.'\n)

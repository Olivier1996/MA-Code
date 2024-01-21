%Fixed Values
%%
clear all
close all

xxx = 1.75;
font_l = 14*xxx;
font_s = 12*xxx;
set(0,'DefaultTextinterpreter','latex')
HA = 'HorizontalAlignment'; HV = 'VerticalAlignment';

font_label=24;
size_lines=4;

% Generate sample data
x = 0:0.5:10;
y1 = x.^2;
y2 = 0.5 * x.^2;


% Create a figure
figure;

% Plot the two curves
plot(x, y1, 'b', 'LineWidth', size_lines, 'color', [0 100/255 0]);
hold on;
plot(x, y2, 'r', 'LineWidth', size_lines, 'color', [0.5 0 0]);


% Set the legend
legend('Old Yield Curve', 'New Yield Curve','Location', 'southeast');

% Remove x and y ticks
set(gca, 'XTick', []);
set(gca, 'YTick', []);

% Set labels and title
xlabel('Time', 'fontsize',font_label);
ylabel('Interest Rate', 'fontsize',16);


% Hold off to end the figure
hold off;
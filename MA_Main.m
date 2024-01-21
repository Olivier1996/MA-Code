%%%%% Main file for Q6 %%%%%%

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
T = 15; 



%% Model Base with Demand Shock
dynare MA_model_BaseD_matlab.mod

figure (1)
subplot(2,2,1)
plot(1:T, (int(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0]); hold on
plot([1, T], [4, 4], 'Color', 'black', 'LineWidth', 1);
xlim([1 T])
ylim([-2 5])
ylabel('Percent','fontsize',16)
xlabel('Interest Rate','fontsize',font_label)
legend('Taylor Rule', 'Location', 'southeast');
subplot(2,2,2)
plot(1:T, (unemp(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0]); hold on
plot([1, T], [0, 0], 'Color', 'black', 'LineWidth', 1);
xlim([1 T])
ylim([-2 8])
ylabel('Percent','fontsize',16)
xlabel('Unemployment Rate','fontsize',font_label)
subplot(2,2,3)
plot(1:T, (infl(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0]); hold on
plot([1, T], [2, 2], 'Color', 'black', 'LineWidth', 1);
xlim([1 T])
ylim([0 2.5])
ylabel('Percent','fontsize',16)
xlabel('Inflation Rate','fontsize',font_label)
subplot(2,2,4)
plot(1:T, (z(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0]); hold on
plot([1, T], [0, 0], 'Color', 'black', 'LineWidth', 1);
xlim([1 T])
ylim([-16 1])
ylabel('Percent','fontsize',16)
xlabel('Demand Shock','fontsize',font_label)






%% Model FG with Demand Shock
dynare MA_model_FGD_matlab.mod

figure (2)
subplot(2,2,1)
plot(1:T, (int_FGD(1:T)*100), 'LineWidth', size_lines, 'color', [0.5 0 0]); hold on
plot([1, T], [4, 4], 'Color', 'black', 'LineWidth', 1);
xlim([1 T])
ylim([-2 5])
ylabel('Percent','fontsize',16)
xlabel('Interest Rate','fontsize',font_label)
legend('Optimal Ploicy with FG', 'Location', 'southeast');
subplot(2,2,2)
plot(1:T, (unemp_FGD(1:T)*100), 'LineWidth', size_lines, 'color', [0.5 0 0]); hold on
plot([1, T], [0, 0], 'Color', 'black', 'LineWidth', 1);
xlim([1 T])
ylim([-2 8])
ylabel('Percent','fontsize',16)
xlabel('Unemployment Rate','fontsize',font_label)
subplot(2,2,3)
plot(1:T, (infl_FGD(1:T)*100), 'LineWidth', size_lines, 'color', [0.5 0 0]); hold on
plot([1, T], [2, 2], 'Color', 'black', 'LineWidth', 1);
xlim([1 T])
ylim([0 2.5])
ylabel('Percent','fontsize',16)
xlabel('Inflation Rate','fontsize',font_label)
subplot(2,2,4)
plot(1:T, (z_FGD(1:T)*100), 'LineWidth', size_lines, 'color', [0.5 0 0]); hold on
plot([1, T], [0, 0], 'Color', 'black', 'LineWidth', 1);
xlim([1 T])
ylim([-16 1])
ylabel('Percent','fontsize',16)
xlabel('Demand Shock','fontsize',font_label)

%% Create a new figure both model in one plot
figure(3);

% Subplot 1: Interest Rate
subplot(2,2,1);
% Base Model Plot
plot(1:T, (int(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0], 'LineStyle', '-'); hold on;
% FGD Model Plot
plot(1:T, (int_FGD(1:T)*100), 'LineWidth', size_lines, 'color', [0.5 0 0], 'LineStyle', '-'); 
plot([1, T], [4, 4], 'Color', 'black', 'LineWidth', 1);
xlim([1 T]);
ylim([-2 5]);
ylabel('Percent','fontsize',16);
xlabel('Interest Rate','fontsize',font_label);
legend('Taylor Rule', 'Optimal Ploicy with FG', 'Location', 'southeast');

% Subplot 2: Unemployment Rate
subplot(2,2,2);
% Base Model Plot
plot(1:T, (unemp(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0], 'LineStyle', '-'); hold on;
% FGD Model Plot
plot(1:T, (unemp_FGD(1:T)*100), 'LineWidth', size_lines, 'color', [0.5 0 0], 'LineStyle', '-');
plot([1, T], [0, 0], 'Color', 'black', 'LineWidth', 1);
xlim([1 T]);
ylim([-2 8]);
ylabel('Percent','fontsize',16);
xlabel('Unemployment Rate','fontsize',font_label);

% Subplot 3: Inflation Rate
subplot(2,2,3);
% Base Model Plot
plot(1:T, (infl(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0], 'LineStyle', '-'); hold on;
% FGD Model Plot
plot(1:T, (infl_FGD(1:T)*100), 'LineWidth', size_lines, 'color', [0.5 0 0], 'LineStyle', '-');
plot([1, T], [2, 2], 'Color', 'black', 'LineWidth', 1);
xlim([1 T]);
ylim([0 2.5]);
ylabel('Percent','fontsize',16);
xlabel('Inflation Rate','fontsize',font_label);

% Subplot 4: Demand Shock
subplot(2,2,4);
% Base Model Plot
plot(1:T, (z(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0], 'LineStyle', '-'); hold on;
% FGD Model Plot
plot(1:T, (z_FGD(1:T)*100), 'LineWidth', size_lines, 'color', [0.5 0 0], 'LineStyle', '-');
plot([1, T], [0, 0], 'Color', 'black', 'LineWidth', 1);
xlim([1 T]);
ylim([-16 1]);
ylabel('Percent','fontsize',16);
xlabel('Demand Shock','fontsize',font_label);



%% Model GT with Demand Shock
%dynare MA_model_GTD_matlab.mod

%figure (4)
%subplot(2,2,1)
%plot(1:T, (int_GTD(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0]); hold on
%plot([1, T], [4, 4], 'Color', 'black', 'LineWidth', 1);
%xlim([1 T])
%xlabel('Interest Rate','fontsize',font_label)
%subplot(2,2,2)
%plot(1:T, (unemp_GTD(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0]); hold on
%plot([1, T], [0, 0], 'Color', 'black', 'LineWidth', 1);
%xlim([1 T])
%ylim([-4 8])
%ylabel('Percent','fontsize',16)
%xlabel('Unemployment Rate','fontsize',font_label)
%subplot(2,2,3)
%plot(1:T, (infl_GTD(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0]); hold on
%plot([1, T], [2, 2], 'Color', 'black', 'LineWidth', 1);
%xlim([1 T])
%ylim([0 5])
%ylabel('Percent','fontsize',16)
%xlabel('Inflation Rate','fontsize',font_label)
%subplot(2,2,4)
%plot(1:T, (z_GTD(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0]); hold on
%plot([1, T], [0, 0], 'Color', 'black', 'LineWidth', 1);
%xlim([1 T])
%ylim([-16 1])
%ylabel('Percent','fontsize',16)
%xlabel('Demand Shock','fontsize',font_label)


%% Model FG Test with Demand Shock
%dynare MA_FG_Test.mod

%figure (5)
%subplot(2,2,1)
%plot(1:T, (int_T(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0]); hold on
%plot([1, T], [4, 4], 'Color', 'black', 'LineWidth', 1);
%xlim([1 T])
%ylim([-2 5])
%ylabel('Percent','fontsize',16)
%xlabel('Interest Rate','fontsize',font_label)
%subplot(2,2,2)
%plot(1:T, (unemp_T(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0]); hold on
%plot([1, T], [0, 0], 'Color', 'black', 'LineWidth', 1);
%xlim([1 T])
%ylim([-2 8])
%ylabel('Percent','fontsize',16)
%xlabel('Unemployment Rate','fontsize',font_label)
%subplot(2,2,3)
%plot(1:T, (infl_T(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0]); hold on
%plot([1, T], [2, 2], 'Color', 'black', 'LineWidth', 1);
%xlim([1 T])
%ylim([0 2.5])
%ylabel('Percent','fontsize',16)
%xlabel('Inflation Rate','fontsize',font_label)
%plot(1:T, (z_T(1:T)*100), 'LineWidth', size_lines, 'color', [0 100/255 0]); hold on
%plot([1, T], [0, 0], 'Color', 'black', 'LineWidth', 1);
%xlim([1 T])
%ylim([-16 1])
%ylabel('Percent','fontsize',16)
%xlabel('Demand Shock','fontsize',font_label)

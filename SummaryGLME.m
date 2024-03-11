colorset = [1 0 0; ...
    0.8 0.2 0; ...
    0.6 0.1 0; ...
    0.4 0.05 0; ...
    0 0 1];

for k_trialN = 1:5
load(['ResultSummary_GLME_20210901_trial_' num2str(k_trialN) '.mat']);

% plot estimated p-value of OV effect on each variable of interest
figure(1); hold on
subplot(1,3,1); hold on
plot(1:7,estimatedP.OVonCORR,'-o', ...
    'MarkerFaceColor',colorset(k_trialN,:), ...
    'MarkerEdgeColor',colorset(k_trialN,:), ...
    'Color', colorset(k_trialN,:), ...
    'LineWidth',3, ...
    'MarkerSize',10); hold on
xticks(1:7); yticks(0.3:0.1:1.1); 
xticklabels({'10','20','30','40','50','60','70'});
yticklabels({'30','40','50','60','70','80','90','100'});
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18)
legend({'trial n = 20' 'trial n = 30' 'trial n = 40' 'trial n = 50' 'trial n = 60'},'FontSize',14)
ylim([0.3 1.02])
xlabel('Sample size', 'FontSize', 16)
ylabel('Power', 'FontSize', 16)
title('Accuracy', 'FontSize', 16)

subplot(1,3,2); hold on
plot(1:7,estimatedP.OVonRT,'-o', ...
    'MarkerFaceColor',colorset(k_trialN,:), ...
    'MarkerEdgeColor',colorset(k_trialN,:), ...
    'Color', colorset(k_trialN,:), ...
    'LineWidth',3, ...
    'MarkerSize',10); hold on
xticks(1:7); yticks(0.3:0.1:1.1); 
xticklabels({'10','20','30','40','50','60','70'});
yticklabels({'30','40','50','60','70','80','90','100'});
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18)
ylim([0.3 1.02])
xlabel('Sample size', 'FontSize', 16)
ylabel('Power', 'FontSize', 16)
title('RT', 'FontSize', 16)

subplot(1,3,3); hold on
plot(1:7,estimatedP.OVonDwell,'-o', ...
    'MarkerFaceColor',colorset(k_trialN,:), ...
    'MarkerEdgeColor',colorset(k_trialN,:), ...
    'Color', colorset(k_trialN,:), ...
    'LineWidth',3, ...
    'MarkerSize',10); hold on
xticks(1:7); yticks(0.3:0.1:1.1); 
xticklabels({'10','20','30','40','50','60','70'});
yticklabels({'30','40','50','60','70','80','90','100'});
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18)
ylim([0.3 1.02])
xlabel('Sample size', 'FontSize', 16)
ylabel('Power', 'FontSize', 16)
title('Dwell', 'FontSize', 16)



% plot estimated p-value of VD effect on each variable of interest
figure(2); hold on
subplot(1,3,1); hold on
plot(1:7,estimatedP.VDonCORR,'-o', ...
    'MarkerFaceColor',colorset(k_trialN,:), ...
    'MarkerEdgeColor',colorset(k_trialN,:), ...
    'Color', colorset(k_trialN,:), ...
    'LineWidth',3, ...
    'MarkerSize',10); hold on
xticks(1:7); yticks(0.7:0.1:1.1); 
xticklabels({'10','20','30','40','50','60','70'});
yticklabels({'70','80','90','100'});
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18)
ylim([0.7 1.1])
xlabel('Sample size', 'FontSize', 16)
ylabel('Power', 'FontSize', 16)
legend({'trial n = 20' 'trial n = 30' 'trial n = 40' 'trial n = 50' 'trial n = 60'},'FontSize',14)
title('Accuracy', 'FontSize', 16)

subplot(1,3,2); hold on
plot(1:7,estimatedP.VDonRT,'-o', ...
    'MarkerFaceColor',colorset(k_trialN,:), ...
    'MarkerEdgeColor',colorset(k_trialN,:), ...
    'Color', colorset(k_trialN,:), ...
    'LineWidth',3, ...
    'MarkerSize',10); hold on
xticks(1:7); yticks(0.7:0.1:1.1); 
xticklabels({'10','20','30','40','50','60','70'});
yticklabels({'70','80','90','100'});
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18)
ylim([0.7 1.1])
xlabel('Sample size', 'FontSize', 16)
ylabel('Power', 'FontSize', 16)
title('RT', 'FontSize', 16)

subplot(1,3,3); hold on
plot(1:7,estimatedP.VDonDwell,'-o', ...
    'MarkerFaceColor',colorset(k_trialN,:), ...
    'MarkerEdgeColor',colorset(k_trialN,:), ...
    'Color', colorset(k_trialN,:), ...
    'LineWidth',3, ...
    'MarkerSize',10); hold on
xticks(1:7); yticks(0.7:0.1:1.1); 
xticklabels({'10','20','30','40','50','60','70'});
yticklabels({'70','80','90','100'});
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',18)
ylim([0.7 1.1])
xlabel('Sample size', 'FontSize', 16)
ylabel('Power', 'FontSize', 16)
title('Dwell', 'FontSize', 16)


end

figure(1);
sgtitle('OV effect on ...') 
figure(2);
sgtitle('VD effect on ...') 

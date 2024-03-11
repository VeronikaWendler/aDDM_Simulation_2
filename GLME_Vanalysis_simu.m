% analyze data with GLME
clear all
clc
k_trial = 5;
folderName = [pwd '/simulation_20210824'];
listing = dir(folderName);
simFiles= {listing(3:end).name};
nSim = 100;
for k_sim = 86:nSim
    
    load([folderName '/' simFiles{k_sim}])
    nDataset    = length(AllData);
    
    str = simFiles{k_sim}; % First define the string.
    str1 = str(17:end-4); % Gives a character
    dbl1 = str2double(str1)  % Give a number (double)
    %% analyze
    for k_subjSet = 1:nDataset
        clear glme tbl
        tblALL = AllData{k_subjSet,k_trial};
        V1 = tblALL(:,3);
        V2 = tblALL(:,4);
        OV = V1+V2;
        VD = V1-V2;
        absVD = abs(VD);
        subj= tblALL(:,1);
        RT       = tblALL(:,6);
        logRT    = log(tblALL(:,6));
        Accuracy = logical(tblALL(:,5));
        DwellLeft = tblALL(:,7);
        DwellRight = tblALL(:,8);
        
        Dwellopt = zeros(size(Accuracy));  
        Dwellopt(Accuracy) = DwellLeft(Accuracy);
        Dwellopt(~Accuracy) = DwellRight(~Accuracy);

        tbl = table(subj,V1,V2,Accuracy,RT,logRT,OV,VD,absVD,DwellLeft,DwellRight,Dwellopt);
        
        % with full random effect
        glme.CORR        = fitglme(tbl,'Accuracy ~ 1 + OV + absVD + (1+ OV + absVD |subj)','Distribution','Binomial');
        glme.RT        = fitglme(tbl,'RT ~ 1 + OV + absVD+ (1+ OV + absVD |subj)','Distribution','Normal');
        glme.Dwell       = fitglme(tbl,'Dwellopt ~ 1 + OV + absVD + (1+ OV + absVD |subj)','Distribution','Normal');
        glme.CORR_adv    = fitglme(tbl,'Accuracy ~ 1 + OV + absVD + Dwellopt + (1|subj)','Distribution','Binomial');
        save(['glmeOVeffect_3/glme_sim' str1 '_subjN' num2str(k_subjSet) '_trial' num2str(k_trial)],'glme','tbl')
    end
end
%% load data
clear all
clc
k_trial = 5;
nSim = 100;
glmelistingt = dir(['glmeOVeffect_3/*trial' num2str(k_trial) '.mat']);
SuccSimList = length(glmelistingt);
glmeList = {glmelistingt.name};
nDataset    = 7;
count = zeros(1, nDataset+1);
SUMMARY.corrP = nan(nSim,nDataset,3);     SUMMARY.rtP = nan(nSim,nDataset,3);    SUMMARY.DwellP = nan(nSim,nDataset,3);    SUMMARY.corr_advP = nan(nSim,nDataset,4);
SUMMARY.corrBeta = nan(nSim,nDataset,3);     SUMMARY.rtBeta = nan(nSim,nDataset,3);    SUMMARY.DwellBeta = nan(nSim,nDataset,3);    SUMMARY.corr_advBeta = nan(nSim,nDataset,4);
missingGLME = {};
for k_sim = 1:100
%      str = glmeList{k_sim}; % First define the string.
%      str1 = str(9:end-18); % Gives a character
%      dbl1 = str2double(str1);  % Give a number (double)
    for k_subjSet = 1:nDataset
        currPro = SuccSimList-sum(count)
        resultNAME = ['glme_sim' num2str(k_sim) '_subjN' num2str(k_subjSet) '_trial' num2str(k_trial) '.mat'];
        if isfile(['glmeOVeffect_3/' resultNAME])
            load(['glmeOVeffect_3/' resultNAME]);
            count(k_subjSet) = count(k_subjSet) +1;
            SUMMARY.corrP(k_sim,k_subjSet,:) = glme.CORR.Coefficients.pValue;
            SUMMARY.rtP(k_sim,k_subjSet,:) = glme.RT.Coefficients.pValue;
            SUMMARY.DwellP(k_sim,k_subjSet,:) = glme.Dwell.Coefficients.pValue;
            SUMMARY.corr_advP(k_sim,k_subjSet,:) = glme.CORR_adv.Coefficients.pValue;
            
            SUMMARY.corrBeta(k_sim,k_subjSet,:) = glme.CORR.Coefficients.Estimate;
            SUMMARY.rtBeta(k_sim,k_subjSet,:) = glme.RT.Coefficients.Estimate;
            SUMMARY.DwellBeta(k_sim,k_subjSet,:) = glme.Dwell.Coefficients.Estimate;
            SUMMARY.corr_advBeta(k_sim,k_subjSet,:) = glme.CORR_adv.Coefficients.Estimate;
            
            
        else
            count(8) = count(8) +1;
            missingGLME{count(8)} = resultNAME;
        end
    end
end
missingGLME = missingGLME';
overviewBeta.OVonCORR= nanmean(squeeze(SUMMARY.corrBeta(:,:,2)));
overviewBeta.OVonRT= nanmean(squeeze(SUMMARY.rtBeta(:,:,2)));
overviewBeta.OVonDwell= nanmean(squeeze(SUMMARY.DwellBeta(:,:,2)));
overviewBeta.OVonCORRadv= nanmean(squeeze(SUMMARY.corr_advBeta(:,:,2)));


overviewBeta.VDonCORR= nanmean(squeeze(SUMMARY.corrBeta(:,:,3)));
overviewBeta.VDonRT= nanmean(squeeze(SUMMARY.rtBeta(:,:,3)));
overviewBeta.VDonDwell= nanmean(squeeze(SUMMARY.DwellBeta(:,:,3)));
overviewBeta.VDonCORRadv= nanmean(squeeze(SUMMARY.corr_advBeta(:,:,3)));

overviewP.OVonCORR= nansum(squeeze(SUMMARY.corrP(:,:,2))<0.05);
overviewP.OVonRT= nansum(squeeze(SUMMARY.rtP(:,:,2))<0.05);
overviewP.OVonDwell= nansum(squeeze(SUMMARY.DwellP(:,:,2))<0.05);
overviewP.OVonCORRadv= nansum(squeeze(SUMMARY.corr_advP(:,:,2))<0.05);

overviewP.VDonCORR= nansum(squeeze(SUMMARY.corrP(:,:,3))<0.05);
overviewP.VDonRT= nansum(squeeze(SUMMARY.rtP(:,:,3))<0.05);
overviewP.VDonDwell= nansum(squeeze(SUMMARY.DwellP(:,:,3))<0.05);
overviewP.VDonCORRadv= nansum(squeeze(SUMMARY.corr_advP(:,:,3))<0.05);

estimatedP.OVonCORR= overviewP.OVonCORR./count(1:7);
estimatedP.OVonRT= overviewP.OVonRT./count(1:7);
estimatedP.OVonDwell= overviewP.OVonDwell./count(1:7);
estimatedP.OVonCORRadv= overviewP.OVonCORRadv./count(1:7);

estimatedP.VDonCORR= overviewP.VDonCORR./count(1:7);
estimatedP.VDonRT= overviewP.VDonRT./count(1:7);
estimatedP.VDonDwell= overviewP.VDonDwell./count(1:7);
estimatedP.VDonCORRadv= overviewP.VDonCORRadv./count(1:7);

save(['ResultSummary_GLME_20210901_trial_' num2str(k_trial)],'SUMMARY','overviewP','overviewBeta','missingGLME','count','estimatedP')


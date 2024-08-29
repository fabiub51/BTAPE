%% Decoding 
addpath('C:\Users\berne\Documents\MATLAB\spm12'); 
addpath('C:\Users\berne\Documents\Master FU\2. Semester\NMDA practical\Bistable_perception');
addpath('C:\Users\berne\Documents\MATLAB\decoding_toolbox')
% do specification and estimation on realigned files 

%% Establishing directories where the data are
tpm_path = 'C:\Users\berne\Documents\MATLAB\spm12\tpm';
pre_data_dir = 'C:\Users\berne\Documents\Master FU\2. Semester\NMDA practical\Bistable_perception\Derivatives\sub-00';
mask_dir = 'C:\Users\berne\Documents\Master FU\2. Semester\NMDA practical\Bistable_perception\Decoding\ROIs';
%% Specification - first level analysis 
for i = 1:length(subs)
    runs = [1 2 3 4 5 6];
    data_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/run-'); 
    func_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/');
    delay_sim = 3;
    delay_alt = 2;
    C01_specification_roi(func_dir, data_dir, runs, subs(i), delay_sim, delay_alt);
end 

%% Estimation
for i = 1:length(subs)
    func_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/');
    output_dir = strcat(func_dir,'1st_level');
    C02_estimation(output_dir);
end 

%% Decoding ROI

roi_left_S2 = fullfile(mask_dir, "rSII_TR50_left_CUT_Stim_vs_Null.nii"); % Mask left S2
roi_right_S2 = fullfile(mask_dir, 'rSII_TR50_right_CUT_Stim_vs_Null.nii'); % Mask right S2
rois = {roi_left_S2, roi_right_S2};
results = {};
result_figures = {};
for i = 1:length(subs)
    for m = 1:length(rois)
        mask  = rois{m};
        decoding_participant_level_roi(subs(i), mask, pre_data_dir)
        results{end+1} = load(fullfile(strcat('C:\Users\berne\Documents\Master FU\2. Semester\NMDA practical\Bistable_perception\Derivatives\sub-00',num2str(subs(i)),'\func\1st_level\results_decoding_roi\res_confusion_matrix.mat'))); %getpath and confusion matrices 
        figure; heatmap(results{1,i}.results.confusion_matrix.output{1}, 'Colormap', jet)
    end
end 

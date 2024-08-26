%% Preprocessing %% 

%add SPM12
addpath('C:\Users\berne\Documents\MATLAB\spm12'); %This ensures your SPM12 is loaded and running

%Vector indicating which steps should be performed
% v(1) = Realignment
% v(2) = Coregistration
% v(3) = Segmentation 
% v(4) = Normalization 
% v(5) = Smoothing 
v = [1,1,1,1,1]; 

%all participants
subs = [1,3,4]; 
runs = [1,2,3,4,5,6,7]; % These are the 6 functional runs + the localizer

%% Establishing directories where the data are
tpm_path = 'C:\Users\berne\Documents\MATLAB\spm12\tpm';
pre_data_dir = 'C:\Users\berne\Documents\Master FU\2. Semester\NMDA practical\Bistable_perception\Derivatives\sub-00';

% This is the folder structure how I understood BIDS: 
% Bistable perception (Project) 
    % Raw Data - how the data come out of the scanner (dcm files)
        % sub-00x - folder for every participant
    % Derivatives - any manipulation that was done to the data
        % 1st_level - folder for the GLM containing all 3 participants
        % sub-00x - folder for every participant
            % anat - any type of anatomical image
            % func - functional data
                % run-0x - all of the runs (from one to 7) 
%% Realignment 
clear matlabbatch 

for i = 1:length(subs)
        data_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/run-');
        switch v(1)
            case 1
                B01_realignment(data_dir,length(runs),subs(i));
            otherwise
        end
end
%% Coregistration

for i = 1:length(subs)
        ref_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/run-01');
        source_dir = strcat(pre_data_dir,num2str(subs(i)),'/anat');
        switch v(2)
            case 1
                B02_coregister(ref_dir, source_dir);
            otherwise
        end
end
%% Segmentation

for i = 1:length(subs)
        source_dir = strcat(pre_data_dir,num2str(subs(i)),'/anat');
        switch v(3)
            case 1
                B03_segment(tpm_path, source_dir);
            otherwise
        end
end

%% Normalize 

for i = 1:length(subs)
        data_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/run-');
        source_dir = strcat(pre_data_dir,num2str(subs(i)),'/anat');
        switch v(4)
            case 1
                B04_normalise(data_dir,source_dir,length(runs),subs(i));
            otherwise
        end
end
%% Smoothing

for i = 1:length(subs)
    data_dir = strcat(pre_data_dir,num2str(subs(i)),'/func/run-');    
    switch v(5)
        case 1
            B05_smoothing(data_dir,length(runs),subs(i));
        otherwise
    end
end

%% Specification - first level analysis of all 3 participants 
%sub-001
delay_sim = 3;
delay_alt = 2;

%sub-003
delay_sim_2 = 12;
delay_alt_2 = 2;

%sub-004
delay_sim_3 = 3; 
delay_alt_3 = 2; 

output_dir = fullfile('C:\Users\berne\Documents\Master FU\2. Semester\NMDA practical\Bistable_perception\Derivatives\1st_level');

C01_specification_runs(output_dir, pre_data_dir, runs, subs, delay_sim, delay_alt, delay_sim_2, delay_alt_2, delay_sim_3, delay_alt_3);
    

%% Estimation
C02_estimation(output_dir);

%% Contrasts 

C03_contrasts(output_dir)
    

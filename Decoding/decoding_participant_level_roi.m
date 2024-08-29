function decoding_participant_level_roi(sub_no, mask, pre_data_dir)

% make directory for the results 
dir = strcat(pre_data_dir,num2str(sub_no),'\func\1st_level');
mkdir(dir,'\results_decoding_roi')

% Set defaults
cfg = decoding_defaults;
cfg.decoding.method = 'classification';

% Set the analysis that should be performed 
cfg.analysis = 'ROI'; 
cfg.scale.method = 'min0max1global';
% Set the output directory where data will be saved
if sub_no < 10
    cfg.results.dir = strcat(pre_data_dir, num2str(sub_no),'\func\1st_level\results_decoding_roi');
end

% Set the filepath where your SPM.mat and all related betas are
if sub_no < 10
    beta_loc = strcat(pre_data_dir, num2str(sub_no),'\func\1st_level');
end

% Set the filename of the brain mask; 
cfg.files.mask = mask; %from the input into the function 

% Set the label names to the regressor names 
labelnames1  = 'ALT';
labelnames2  = 'SIM';

% Values for every type of stimulation/imagery 
labelvalue1 = 1; % value for labelname1
labelvalue2 = -1; % value for labelname2

%% Decide whether to see the searchlight/ROI/... during decoding
cfg.plot_selected_voxels = 0; % 0: no plotting, 1: every step, 2: every second step, 100: every hundredth step...

%% Add additional output measures if you like
% See help decoding_transform_results for possible measures
cfg.results.overwrite = 1;
cfg.results.output = {'confusion_matrix'}; % select confusion matrix as output

% The following function extracts all beta names and corresponding run
% numbers from the SPM.mat
regressor_names = design_from_spm(beta_loc);

% Extract all information for the cfg.files structure 
cfg = decoding_describe_data(cfg,{labelnames1,labelnames2},[labelvalue1,labelvalue2],regressor_names,beta_loc);

% This creates the leave-one-run-out cross validation design:
cfg.design = make_design_cv(cfg); 

% Run decoding
results = decoding(cfg);

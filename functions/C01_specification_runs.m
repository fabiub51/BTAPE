function C01_specification_runs(pre_data_dir, runs, subs, delay_sim_1, delay_alt_1, delay_sim_2, delay_alt_2, delay_sim_3, delay_alt_3)

output_dir = fullfile('C:\Users\berne\Documents\Master FU\2. Semester\NMDA practical\Bistable_perception\Derivatives\1st_level');
%% Create data 

% For participant 1
for s = subs(1)
    file_dir_1 = {}; %creating the directory of the files for every run
    motion_regressors_1 = {}; %creating the directory for motion regressors
    data_1 = {}; %creating data directory
    data_dir = strcat(pre_data_dir,num2str(s),'/func/run-'); 

    % for loading the onsets
    condition_1 = 'ALT';
    condition_2 = 'SIM';

    onsets = {};
    conditions = {};
    onsets_condition_1_1 = {};
    onsets_condition_2_1 = {};

    delay_alt = delay_alt_1*800/1000; % Hom many stimuli did it take to generate the percept * 800ms / 1000 = Xs 
    duration_alt_1 = 24 - delay_alt; 
    delay_sim = delay_sim_1*800/1000; % Hom many stimuli did it take to generate the percept * 800ms / 1000 = Xs 
    duration_sim_1 = 24 - delay_sim; 
    for r = 1:length(runs)
        file_dir_1{r} = strcat(data_dir,num2str(0),num2str(runs(r)));
        % Motion regressors
        ms = spm_select('List', file_dir_1{r}, '^rp_sub','.txt');
        motion_files = cellstr(fullfile(file_dir_1{r},ms));
        motion_regressors_1{r} = motion_files;

        % Data
        fs = spm_select('expand', fullfile(file_dir_1{r},strcat('swrsub-00',num2str(s),'_task-BTP_run-0',num2str(runs(r)),'_bold.nii')));
        files = cellstr(fs);
        data_1{r} = files; % Building the cell array with all the filenames (7x360)

        % Onsets
        if r < 7
            log_file = load(fullfile(file_dir_1{r}, strcat('log_run_0',num2str(runs(r)))));
            onsets{r} = log_file.log.onset;
            conditions{r} = log_file.log.conditions;
    
            onsets_condition_1_1{r} = onsets{r}(find(conditions{r} == 1));
            onsets_condition_2_1{r} = onsets{r}(find(conditions{r} == 2));
            onsets_condition_1_1{r} = onsets_condition_1_1{r} + delay_alt; 
            onsets_condition_2_1{r} = onsets_condition_2_1{r} + delay_sim;
        elseif r == 7
            log_file = load(fullfile(file_dir_1{r}, strcat('log_run_0',num2str(runs(r)))));
            onsets{r} = log_file.log.onset;
            conditions{r} = log_file.log.conditions;
            onsets_condition_1_1{r} = onsets{r}(find(conditions{r} == 1));
            onsets_condition_2_1{r} = onsets{r}(find(conditions{r} == 2));
        end
    end
end

% For participant 2
for s = subs(2)
    file_dir_2 = {}; %creating the directory of the files for every run
    motion_regressors_2 = {}; %creating the directory for motion regressors
    data_2 = {}; %creating data directory
    data_dir = strcat(pre_data_dir,num2str(s),'/func/run-'); 

    % for loading the onsets
    condition_1 = 'ALT';
    condition_2 = 'SIM';

    onsets = {};
    conditions = {};
    onsets_condition_1_2 = {};
    onsets_condition_2_2 = {};

    delay_alt = delay_alt_2*800/1000; % Hom many stimuli did it take to generate the percept * 800ms / 1000 = Xs
    duration_alt_2 = 24 - delay_alt;
    delay_sim = delay_sim_2*800/1000; % Hom many stimuli did it take to generate the percept * 800ms / 1000 = Xs 
    duration_sim_2 = 24 - delay_sim; 
    for r = 1:length(runs)
        file_dir_2{r} = strcat(data_dir,num2str(0),num2str(runs(r)));
        ms = spm_select('List', file_dir_2{r}, '^rp_sub','.txt');

        % Motion regressors
        motion_files = cellstr(fullfile(file_dir_2{r},ms));
        motion_regressors_2{r} = motion_files;

        % Data
        fs = spm_select('expand', fullfile(file_dir_2{r},strcat('swrsub-00',num2str(s),'_task-BTP_run-0',num2str(runs(r)),'_bold.nii')));
        files = cellstr(fs);
        data_2{r} = files; % Building the cell array with all the filenames (7x360)

        % Onsets
        log_file = load(fullfile(file_dir_1{r}, strcat('log_run_0',num2str(runs(r)))));
        onsets{r} = log_file.log.onset;
        conditions{r} = log_file.log.conditions;

        if r < 7

        onsets_condition_1_2{r} = onsets{r}(find(conditions{r} == 1));
        onsets_condition_2_2{r} = onsets{r}(find(conditions{r} == 2));
        onsets_condition_1_2{r} = onsets_condition_1_2{r} + delay_alt; 
        onsets_condition_2_2{r} = onsets_condition_2_2{r} + delay_sim;

        else
            onsets_condition_1_2{r} = onsets{r}(find(conditions{r} == 1));
            onsets_condition_2_2{r} = onsets{r}(find(conditions{r} == 2));
        end
    end
end

% For participant 3
for s = subs(3)
    file_dir_3 = {}; %creating the directory of the files for every run
    motion_regressors_3 = {}; %creating the directory for motion regressors
    data_3 = {}; %creating data directory
    data_dir = strcat(pre_data_dir,num2str(s),'/func/run-'); 

    % for loading the onsets
    condition_1 = 'ALT';
    condition_2 = 'SIM';

    onsets = {};
    conditions = {};
    onsets_condition_1_3 = {};
    onsets_condition_2_3 = {};

    delay_alt = delay_alt_3*800/1000; % Hom many stimuli did it take to generate the percept * 800ms / 1000 = Xs
    duration_alt_3 = 24 - delay_alt;
    delay_sim = delay_sim_3*800/1000; % Hom many stimuli did it take to generate the percept * 800ms / 1000 = Xs 
    duration_sim_3 = 24 - delay_sim; 
    for r = 1:length(runs)
        file_dir_3{r} = strcat(data_dir,num2str(0),num2str(runs(r)));
        ms = spm_select('List', file_dir_3{r}, '^rp_sub','.txt');

        % Motion regressors
        motion_files = cellstr(fullfile(file_dir_3{r},ms));
        motion_regressors_3{r} = motion_files;

        % Data
        fs = spm_select('expand', fullfile(file_dir_3{r},strcat('swrsub-00',num2str(s),'_task-BTP_run-0',num2str(runs(r)),'_bold.nii')));
        files = cellstr(fs);
        data_3{r} = files; % Building the cell array with all the filenames (7x360)

        % Onsets
        log_file = load(fullfile(file_dir_1{r}, strcat('log_run_0',num2str(runs(r)))));
        onsets{r} = log_file.log.onset;
        conditions{r} = log_file.log.conditions;

        if r < 7

        onsets_condition_1_3{r} = onsets{r}(find(conditions{r} == 1));
        onsets_condition_2_3{r} = onsets{r}(find(conditions{r} == 2));
        onsets_condition_1_3{r} = onsets_condition_1_3{r} + delay_alt; 
        onsets_condition_2_3{r} = onsets_condition_2_3{r} + delay_sim;

        else
            onsets_condition_1_3{r} = onsets{r}(find(conditions{r} == 1));
            onsets_condition_2_3{r} = onsets{r}(find(conditions{r} == 2));
        end
    end
end

%% Load batch structure 
matlabbatch{1}.spm.stats.fmri_spec.dir = {output_dir};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 1;   
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).scans = data_1{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).onset = onsets_condition_1_1{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).duration = duration_alt_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).onset = onsets_condition_2_1{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).duration = duration_sim_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi_reg = motion_regressors_1{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).scans = data_1{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).onset = onsets_condition_1_1{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).duration = duration_alt_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).onset = onsets_condition_2_1{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).duration = duration_sim_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi_reg = motion_regressors_1{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).scans = data_1{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).onset = onsets_condition_1_1{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).duration = duration_alt_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).onset = onsets_condition_2_1{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).duration = duration_sim_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(3).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).multi_reg = motion_regressors_1{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(3).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).scans = data_1{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).onset = onsets_condition_1_1{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).duration = duration_alt_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).onset = onsets_condition_2_1{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).duration = duration_sim_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(4).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).multi_reg = motion_regressors_1{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(4).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).scans = data_1{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).onset = onsets_condition_1_1{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).duration = duration_alt_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).onset = onsets_condition_2_1{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).duration = duration_sim_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(5).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).multi_reg = motion_regressors_1{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(5).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).scans = data_1{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).onset = onsets_condition_1_1{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).duration = duration_alt_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).onset = onsets_condition_2_1{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).duration = duration_sim_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(6).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).multi_reg = motion_regressors_1{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(6).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(7).scans = data_1{7};
matlabbatch{1}.spm.stats.fmri_spec.sess(7).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(7).cond(1).onset = onsets_condition_1_1{7};
matlabbatch{1}.spm.stats.fmri_spec.sess(7).cond(1).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(7).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(7).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(7).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(7).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(7).cond(2).onset = onsets_condition_2_1{7};
matlabbatch{1}.spm.stats.fmri_spec.sess(7).cond(2).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(7).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(7).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(7).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(7).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(7).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(7).multi_reg = motion_regressors_1{7};
matlabbatch{1}.spm.stats.fmri_spec.sess(7).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(8).scans = data_2{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(8).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(8).cond(1).onset = onsets_condition_1_2{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(8).cond(1).duration = duration_alt_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(8).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(8).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(8).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(8).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(8).cond(2).onset = onsets_condition_2_2{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(8).cond(2).duration = duration_sim_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(8).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(8).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(8).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(8).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(8).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(8).multi_reg = motion_regressors_2{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(8).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(9).scans = data_2{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(9).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(9).cond(1).onset = onsets_condition_1_2{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(9).cond(1).duration = duration_alt_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(9).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(9).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(9).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(9).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(9).cond(2).onset = onsets_condition_2_2{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(9).cond(2).duration = duration_sim_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(9).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(9).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(9).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(9).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(9).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(9).multi_reg = motion_regressors_2{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(9).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(10).scans = data_2{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(10).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(10).cond(1).onset = onsets_condition_1_2{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(10).cond(1).duration = duration_alt_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(10).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(10).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(10).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(10).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(10).cond(2).onset = onsets_condition_2_2{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(10).cond(2).duration = duration_sim_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(10).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(10).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(10).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(10).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(10).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(10).multi_reg = motion_regressors_2{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(10).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(11).scans = data_2{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(11).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(11).cond(1).onset = onsets_condition_1_2{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(11).cond(1).duration = duration_alt_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(11).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(11).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(11).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(11).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(11).cond(2).onset = onsets_condition_2_2{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(11).cond(2).duration = duration_sim_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(11).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(11).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(11).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(11).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(11).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(11).multi_reg = motion_regressors_2{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(11).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(12).scans = data_2{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(12).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(12).cond(1).onset = onsets_condition_1_2{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(12).cond(1).duration = duration_alt_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(12).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(12).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(12).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(12).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(12).cond(2).onset = onsets_condition_2_2{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(12).cond(2).duration = duration_sim_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(12).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(12).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(12).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(12).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(12).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(12).multi_reg = motion_regressors_2{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(12).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(13).scans = data_2{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(13).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(13).cond(1).onset = onsets_condition_1_2{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(13).cond(1).duration = duration_alt_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(13).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(13).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(13).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(13).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(13).cond(2).onset = onsets_condition_2_2{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(13).cond(2).duration = duration_sim_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(13).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(13).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(13).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(13).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(13).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(13).multi_reg = motion_regressors_2{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(13).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(14).scans = data_2{7};
matlabbatch{1}.spm.stats.fmri_spec.sess(14).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(14).cond(1).onset = onsets_condition_1_2{7};
matlabbatch{1}.spm.stats.fmri_spec.sess(14).cond(1).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(14).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(14).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(14).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(14).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(14).cond(2).onset = onsets_condition_2_2{7};
matlabbatch{1}.spm.stats.fmri_spec.sess(14).cond(2).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(14).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(14).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(14).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(14).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(14).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(14).multi_reg = motion_regressors_2{7};
matlabbatch{1}.spm.stats.fmri_spec.sess(14).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(15).scans = data_3{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(15).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(15).cond(1).onset = onsets_condition_1_3{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(15).cond(1).duration = duration_alt_3;
matlabbatch{1}.spm.stats.fmri_spec.sess(15).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(15).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(15).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(15).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(15).cond(2).onset = onsets_condition_2_3{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(15).cond(2).duration = duration_sim_3;
matlabbatch{1}.spm.stats.fmri_spec.sess(15).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(15).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(15).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(15).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(15).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(15).multi_reg = motion_regressors_3{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(15).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(16).scans = data_3{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(16).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(16).cond(1).onset = onsets_condition_1_3{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(16).cond(1).duration = duration_alt_3;
matlabbatch{1}.spm.stats.fmri_spec.sess(16).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(16).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(16).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(16).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(16).cond(2).onset = onsets_condition_2_3{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(16).cond(2).duration = duration_sim_3;
matlabbatch{1}.spm.stats.fmri_spec.sess(16).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(16).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(16).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(16).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(16).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(16).multi_reg = motion_regressors_3{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(16).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(17).scans = data_3{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(17).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(17).cond(1).onset = onsets_condition_1_3{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(17).cond(1).duration = duration_alt_3;
matlabbatch{1}.spm.stats.fmri_spec.sess(17).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(17).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(17).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(17).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(17).cond(2).onset = onsets_condition_2_3{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(17).cond(2).duration = duration_sim_3;
matlabbatch{1}.spm.stats.fmri_spec.sess(17).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(17).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(17).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(17).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(17).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(17).multi_reg = motion_regressors_3{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(17).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(18).scans = data_3{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(18).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(18).cond(1).onset = onsets_condition_1_3{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(18).cond(1).duration = duration_alt_3;
matlabbatch{1}.spm.stats.fmri_spec.sess(18).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(18).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(18).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(18).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(18).cond(2).onset = onsets_condition_2_3{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(18).cond(2).duration = duration_sim_3;
matlabbatch{1}.spm.stats.fmri_spec.sess(18).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(18).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(18).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(18).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(18).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(18).multi_reg = motion_regressors_3{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(18).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(19).scans = data_3{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(19).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(19).cond(1).onset = onsets_condition_1_3{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(19).cond(1).duration = duration_alt_3;
matlabbatch{1}.spm.stats.fmri_spec.sess(19).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(19).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(19).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(19).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(19).cond(2).onset = onsets_condition_2_3{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(19).cond(2).duration = duration_sim_3;
matlabbatch{1}.spm.stats.fmri_spec.sess(19).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(19).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(19).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(19).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(19).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(19).multi_reg = motion_regressors_3{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(19).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(20).scans = data_3{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(20).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(20).cond(1).onset = onsets_condition_1_3{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(20).cond(1).duration = duration_alt_3;
matlabbatch{1}.spm.stats.fmri_spec.sess(20).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(20).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(20).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(20).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(20).cond(2).onset = onsets_condition_2_3{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(20).cond(2).duration = duration_sim_3;
matlabbatch{1}.spm.stats.fmri_spec.sess(20).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(20).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(20).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(20).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(20).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(20).multi_reg = motion_regressors_3{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(20).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(21).scans = data_3{7};
matlabbatch{1}.spm.stats.fmri_spec.sess(21).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(21).cond(1).onset = onsets_condition_1_3{7};
matlabbatch{1}.spm.stats.fmri_spec.sess(21).cond(1).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(21).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(21).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(21).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(21).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(21).cond(2).onset = onsets_condition_2_3{7};
matlabbatch{1}.spm.stats.fmri_spec.sess(21).cond(2).duration = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(21).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(21).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(21).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(21).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(21).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(21).multi_reg = motion_regressors_3{7};
matlabbatch{1}.spm.stats.fmri_spec.sess(21).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';

%% Executing the job 
spm_jobman('run', matlabbatch);

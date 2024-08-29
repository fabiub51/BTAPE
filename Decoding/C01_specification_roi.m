function C01_specification_roi(func_dir,data_dir, runs, sub_no, delay_sim, delay_alt)

%% output directory
cd(func_dir);
mkdir('1st_level');
output_dir = fullfile(func_dir, '1st_level');
%% Create data 
file_dir = {}; %creating the directory of the files for every run
for r = 1:length(runs)
    if runs < 10
        file_dir{r} = strcat(data_dir,num2str(0),num2str(runs(r)));
    else
        file_dir{r} = strcat(data_dir,num2str(runs(r)));
    end
end

data = {};
for f = 1:length(runs)
    fs = spm_select('expand', fullfile(file_dir{f},strcat('wrsub-00',num2str(sub_no),'_task-BTP_run-0',num2str(runs(f)),'_bold.nii')));
    files = cellstr(fs);
    data{f} = files; % Building the cell array with all the filenames (7x360)

end 

%% Motion regressors 

motion_regressors   = {};
for m = 1:length(runs)
    ms = spm_select('List', file_dir{m}, '^rp_sub','.txt');
    motion_files = cellstr(fullfile(file_dir{m},ms));
    motion_regressors{m} = motion_files;
end
%% Load onsets
condition_1 = 'ALT';
condition_2 = 'SIM';

onsets = {};
conditions = {};
onsets_condition_1 = {};
onsets_condition_2 = {};

delay_sim = delay_sim*800/1000; % Hom many stimuli did it take to generate the percept * 800ms / 1000 = Xs 
duration_sim = 24 - delay_sim; 
delay_alt = delay_alt*800/1000; % Hom many stimuli did it take to generate the percept * 800ms / 1000 = Xs 
duration_alt = 24 - delay_alt; 

for l = 1:length(runs)
    log_file = load(fullfile(file_dir{l}, strcat('log_run_0',num2str(runs(l)))));
    onsets{l} = log_file.log.onset;
    conditions{l} = log_file.log.conditions;

    onsets_condition_1{l} = onsets{l}(find(conditions{l} == 1));
    onsets_condition_2{l} = onsets{l}(find(conditions{l} == 2));

    onsets_condition_1{l} = onsets_condition_1{l} + delay_alt; 
    onsets_condition_2{l} = onsets_condition_2{l} + delay_sim;

end 



%% Load batch structure 
matlabbatch{1}.spm.stats.fmri_spec.dir = {output_dir};
matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 1;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).scans = data{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).onset = onsets_condition_1{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).duration = duration_alt;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).onset = onsets_condition_2{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).duration = duration_sim;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi_reg = motion_regressors{1};
matlabbatch{1}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).scans = data{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).onset = onsets_condition_1{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).duration = duration_alt;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).onset = onsets_condition_2{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).duration = duration_sim;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi_reg = motion_regressors{2};
matlabbatch{1}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).scans = data{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).onset = onsets_condition_1{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).duration = duration_alt;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).onset = onsets_condition_2{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).duration = duration_sim;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(3).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(3).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(3).multi_reg = motion_regressors{3};
matlabbatch{1}.spm.stats.fmri_spec.sess(3).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).scans = data{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).onset = onsets_condition_1{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).duration = duration_alt;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).onset = onsets_condition_2{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).duration = duration_sim;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(4).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(4).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(4).multi_reg = motion_regressors{4};
matlabbatch{1}.spm.stats.fmri_spec.sess(4).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).scans = data{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).onset = onsets_condition_1{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).duration = duration_alt;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).onset = onsets_condition_2{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).duration = duration_sim;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(5).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(5).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(5).multi_reg = motion_regressors{5};
matlabbatch{1}.spm.stats.fmri_spec.sess(5).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).scans = data{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).name = condition_1;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).onset = onsets_condition_1{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).duration = duration_alt;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(1).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).name = condition_2;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).onset = onsets_condition_2{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).duration = duration_sim;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).tmod = 0;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).cond(2).orth = 1;
matlabbatch{1}.spm.stats.fmri_spec.sess(6).multi = {''};
matlabbatch{1}.spm.stats.fmri_spec.sess(6).regress = struct('name', {}, 'val', {});
matlabbatch{1}.spm.stats.fmri_spec.sess(6).multi_reg = motion_regressors{6};
matlabbatch{1}.spm.stats.fmri_spec.sess(6).hpf = 128;
matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';

%% Executing the job 
spm_jobman('run', matlabbatch);

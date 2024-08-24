function B04_normalise(data_dir,source_dir,no_runs, sub_no)

normalise = struct; 

%% Anatomical image

source_file = spm_select('List',source_dir,'^y','.nii');
source_file_s = cellstr([repmat([source_dir filesep], size(source_file,1), 1) source_file]);

%% Functional images

file_dir = {};
for r = 1:no_runs
    if no_runs < 10
        file_dir{r} = strcat(data_dir,num2str(0),num2str(r));
    else
        file_dir{r} = strcat(data_dir,num2str(r));
    end
end

data_n = {};
for f = 1:no_runs
    fs = spm_select('expand', fullfile(file_dir{f},strcat('rsub-00',num2str(sub_no),'_task-BTP_run-0',num2str(f),'_bold.nii')));
    files = cellstr(fs);
    data_n = vertcat(data_n,files); % Here, compared to realignment, we need a cell array with the dimensions of all images x 1 (e.g. for ...
    % participant 4: 2520x1
end
%% Fill matlabbatch

normalise.matlabbatch{1}.spm.spatial.normalise.write.subj.def = source_file_s;
normalise.matlabbatch{1}.spm.spatial.normalise.write.subj.resample = data_n;

normalise.matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
normalise.matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
normalise.matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 4;
normalise.matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'w';

spm_jobman('run', normalise.matlabbatch);

clear matlabbatch

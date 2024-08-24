function B02_coregister(data_dir, source_dir)
coregister = struct;
ref_file = spm_select('List', data_dir, '^mean');
source_file = spm_select('List',source_dir,'^sub','.nii');
ref_file_s = cellstr([repmat([data_dir filesep], size(ref_file,1), 1) ref_file, repmat(',1',size(ref_file,1),1)]);
source_file_s = cellstr([repmat([source_dir filesep], size(source_file,1), 1) source_file, repmat(',1',size(source_file,1),1)]);
        
coregister.matlabbatch{1}.spm.spatial.coreg.estimate.ref = ref_file_s;
coregister.matlabbatch{1}.spm.spatial.coreg.estimate.source = source_file_s;
coregister.matlabbatch{1}.spm.spatial.coreg.estimate.other = {''};
coregister.matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
coregister.matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
coregister.matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
coregister.matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
spm_jobman('run', coregister.matlabbatch);

clear matlabbatch

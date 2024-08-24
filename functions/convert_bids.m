%% Sort fmri data (.nii and .json) into BIDS compatible folder structures
% N.B. the .nii and .json files are converted from the raw dicom files using
% the dicm2nii tool box 
% (https://de.mathworks.com/matlabcentral/fileexchange/42997-xiangruili-dicm2nii)
sub_no = 'sub-001';
sub_dir = 'C:\Users\berne\Documents\Master FU\2. Semester\NMDA practical\Bistable_perception\Derivatives\sub-001';

% create subfolders for func and anat images
func_dir = fullfile(sub_dir, 'func');
anat_dir = fullfile(sub_dir, 'anat');



if ~isfolder(func_dir)
    mkdir(func_dir);
    disp('"func" folder is created');
else
    disp('"func" folder already exists');
end

if ~isfolder(anat_dir)
    mkdir(anat_dir);
    disp('"anat" folder is created');
else
    disp('"anat" folder already exists');
end

% move files
files = dir(sub_dir);
for i = 1:length(files)
    if startsWith(files(i).name, 'anat') && ~files(i).isdir
        
        movefile(fullfile(files(i).folder, files(i).name), fullfile(anat_dir, files(i).name));
    end

    if contains(files(i).name, 'func_task') && ~files(i).isdir
        movefile(fullfile(files(i).folder, files(i).name), fullfile(func_dir, files(i).name))
    end
end

% rename files
files = dir(anat_dir);
cd(anat_dir);

gunzip('*.gz')
delete('*.gz')
files = dir(anat_dir);
for i = 1:length(files)
    if startsWith(files(i).name, 'anat') && ~files(i).isdir
        [~, name, ext] = fileparts(files(i).name);
        movefile(files(i).name, strcat(sub_no, "_T1w", ext)) % new name: 'sub-007_T1w...'
    end
end

func_files = dir(func_dir);
cd(func_dir);

gunzip('*.gz') % unzip the gz files
delete('*.gz') % delete the gz files

files = dir(func_dir);

func_files = {};
original_numbers = [];
for i = 1:length(files)
    if contains(files(i).name, 'func_task') && ~files(i).isdir
        func_files{end+1} = files(i).name;
        % Extracting original number
        num_str = regexp(files(i).name, '\d{3}', 'match');
        if ~isempty(num_str)
            original_numbers(end+1) = str2double(num_str{1});
        end
    end
end

% Sorting
[~, sort_idx] = sort(original_numbers);
sorted_func_files = func_files(sort_idx);

% Renaming .nii and .json files in sequence starting from 01
for i = 1:length(sorted_func_files)
    [~, name, ext] = fileparts(sorted_func_files{i});
    new_number = sprintf('%02d', i/2); % Generate a two-digit number starting from 01
    new_name = strcat(sub_no, "_task-BTP_run-", new_number, '_bold', ext); % e.g. 'sub-007_task-BTP_run-01_bold.nii'
    
    % Rename the .nii file
    if strcmp(ext, '.nii')
        movefile(sorted_func_files{i}, new_name);
        
        % Find and rename the corresponding .json file
        json_file = strcat(name, '.json');
        if isfile(json_file)
            new_json_name = strcat(sub_no, "_task-BTP_run-", new_number, '_bold.json');
            movefile(json_file, new_json_name);
        end
    end
end

func_files = dir(func_dir);

% create run folders
for i = 1:7
    run_dir{i} = fullfile(func_dir, strcat('run-0',num2str(i)));
    mkdir(run_dir{i});
end

% Move file into correct run
for i= 1:length(func_files)
    for b = 1:7
        if contains(func_files(i).name, strcat(num2str(b),'_b')) == 1
            movefile(fullfile(func_files(i).folder,func_files(i).name), fullfile(run_dir{b}));
        end
    end
end 

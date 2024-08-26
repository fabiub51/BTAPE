%% Function as an assistance to generate contrasts

ALT = -1/24; %specify values for the alternating condition
SIM = 1/18; % specify values for the simultaneuos condition
Localizer = -1/24; % specify values for the localizer

single = [ALT SIM 0 0 0 0 0 0]; % single functional run with zeros for motion correction
func_runs = repmat(single,1,6); % all functional runs for one participant
localizer_run = [Localizer Localizer 0 0 0 0 0 0]; % single localizer run
all_runs = cat(2, func_runs,localizer_run); % bringing both together for a participant

contrast = repmat(all_runs,1,3); % repeating for all participants
run_index = zeros(1,21); % adding 21 zeros at the end for all runs 
contrast = cat(2, contrast, run_index); % putting everything together
sum(contrast) % checking if the sum is 0 or 1 
Bistable perception experiment SoSe24 MCNB - Emily, Fabius, Hüma, Lea

  %% Univariate analysis

The repository contains a conversion script, the batch script which calls individual functions and script that helped creating 
different contrasts in the folder "main". The raw data were converted to .nii files using the dicm2nii converter. 
The file structure is explained in the main_bistable script. 
All the functions are listed in the "functions" folder. 
We created one single GLM that contains all runs from 3 participants that were available to us in order to generate more robust 
results compared to a 2nd level analysis with such small n. 
Results were always inspected using the GUI.

  %% Decoding

There is a second pipeline we wanted to try out in order to test the hypothesis whether both S2 regions (left and right) represent
information on the "nature" of the percept - being alternating or simultaneous. For this, the decoding batch script is found in 
the folder "Decoding" along with the decoding function, a separate specication function (since we opted for a large GLM in the 
other pipeline), and the ROIs that were used. 

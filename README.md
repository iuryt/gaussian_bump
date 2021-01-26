# Flow Over Gaussian Bump

This is the MITgcm simulation of a flow over a gaussian bump based on [exp2](https://github.com/MITgcm/MITgcm/tree/master/verification/exp2) from MITgcm documentation.

<img src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/Init_BAT.png" data-canonical-src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/Init_BAT.png" width="600" height="auto" />

## How to run an experiment

1. Follow the [Getting Started](https://mitgcm.readthedocs.io/en/latest/getting_started/getting_started.html) section on MITgcm documentation to set up the model;
2. Clone this experiment to the `MITgcm/exp` folder (you can also download the repository and extract it to MITgcm folder.);
3. Configure [`compile.sh`](https://github.com/iuryt/gaussian_bump/blob/main/compile.sh) for the designated `optfile`;
4. Run [`compile.sh`](https://github.com/iuryt/gaussian_bump/blob/main/compile.sh). If everything is correctly configured, you will have the `mitgcmuv` executable inside `run_<experiment>` folders; 
5. Create a symbolic link for the files in `input` and `input_<experiment>` to `run_<experiment>` folder.
6. Run the executable `mitgcmuv` inside `run_<experiment>` folder (You can base your submit file on [`submit.lsf`](https://github.com/iuryt/gaussian_bump/blob/main/input/submit.lsf)).

The current configuration on [`code/SIZE.h`](https://github.com/iuryt/gaussian_bump/blob/main/code/SIZE.h) works in parallel using 4 cores (see [Documentation](https://mitgcm.readthedocs.io/en/latest/) to learn how to set up for a different number of cores).
If the experiment is already configured you just have to run `mpirun -np 4 ./mitgcmuv` in `run_<experiment>` folder.
If you are using a supercomputer, check with support how to setup a batch script for your experiment.

## How to generate the initial conditions

In `notebooks` there is a file called [`00-Init.ipynb`](https://github.com/iuryt/gaussian_bump/blob/main/notebooks/00-Init.ipynb) that creates the initial conditions
The data will be saved to `input` folder. You may have to change the grid spacing in `input_<experiment>/data` or number of points in [`code/SIZE.h`](https://github.com/iuryt/gaussian_bump/blob/main/code/SIZE.h) if you change the code in the notebooks.

We define the Barotropic velocity from the free surface using the geostrophic balance:
<img src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/Init_ETA.png" data-canonical-src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/Init_BAT.png" width="auto" height="200" />

We defined three options for the initial mass field: homogeneous (N0), constant stratification (NC) and with a thermocline defined by a `tanh` (NZ).

<img src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/Init_Temp.png" data-canonical-src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/Init_BAT.png" width="auto" height="300" />


## How to read the data from the output

The notebook [`notebooks/01-Analysis.ipynb`](https://github.com/iuryt/gaussian_bump/blob/main/notebooks/01-Analysis.ipynb) its a tutorial that explains how to read and plot the output from this experiment.




# Flow Over Gaussian Bump

This is the MITgcm simulation of a flow over a gaussian bump based on [exp2](https://github.com/MITgcm/MITgcm/tree/master/verification/exp2) from MITgcm documentation. 


<img src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/Init_BAT.png" data-canonical-src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/Init_BAT.png" width="600" height="auto" />

## Context

This is part of a mentoring that I am giving to the BSME student Alan Andonian from prof. Amit Tandon's [laboratory](https://tandonlab.sites.umassd.edu/people/) (UMassD). I created this repository to organize the numerical experiments I am running for him to analyze. 

The main idea is to familiarize him to basic Geophysical Fluid Dynamics problems and Python programming. And, of course, give him an opportunity to learn more about control version on GitHub. One of the first problems is the [Taylor-Proudman Theorem](https://en.wikipedia.org/wiki/Taylor%E2%80%93Proudman_theorem). This experiment is perfect to understand this theorem, as even being 400m above the top of the gaussian bump, the flow cannot "jump it", which results into a [Taylor column](https://en.wikipedia.org/wiki/Taylor_column) above the bump. 

<img src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/quiver_zeta_13m_N0.png" data-canonical-src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/quiver_zeta_13m_N0.png" width="600" height="auto" />

The same does not happen to an stratified fluid, in which thermal-wind balance allows vertical shear.


<img src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/quiver_zeta_13m_NC.png" data-canonical-src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/quiver_zeta_13m_NC.png" width="600" height="auto" />

I also believe that this repository can help other students that are beginning to setup and run their own numerical simulations using MITgcm. 


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

We define the Barotropic velocity from the free surface using the geostrophic balance <img src="https://render.githubusercontent.com/render/math?math=u = -\dfrac{g}{f}\dfrac{d\eta}{dy}">:

<img src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/Init_ETA.png" data-canonical-src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/Init_BAT.png" width="auto" height="200" />

We defined three options for the initial mass field: homogeneous (N0), constant stratification (NC) and with a thermocline defined by a `tanh` (NZ).

<img src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/Init_Temp.png" data-canonical-src="https://github.com/iuryt/gaussian_bump/blob/main/notebooks/img/Init_BAT.png" width="auto" height="300" />


## How to read the data from the output

The notebook [`notebooks/01-Analysis.ipynb`](https://github.com/iuryt/gaussian_bump/blob/main/notebooks/01-Analysis.ipynb) its a tutorial that explains how to read and plot the output from this experiment.




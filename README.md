# SplittingMethods
MATLAB code for numerical simulation of charge transfer by stationary and moving discrete breathers in nonlinear lattices modeled with semi-classical Hamiltonian dynamics. Using the code and developed explicit and semi-implicit structure-preserving splitting methods, please cite Bajārs, J., Archilla, J.F.R.: *Splitting methods for semi-classical Hamiltonian dynamics of charge transfer in nonlinear lattices*. Mathematics **10**(19), 3460 (2022), [DOI:10.3390/math10193460](https://www.mdpi.com/2227-7390/10/19/3460).

File `SplittingMethods_PureCode_WithoutData.zip` contains pure code without precomputed data and images.

<p float="left">
  <img src="Figures/stat_solution.png" width="46%" /> &nbsp; &nbsp;   
  <img src="Figures/mov_solution.png" width="46%" /> 
</p>

This research has been financially supported by the specific support objective activity 1.1.1.2. “Post-doctoral Research Aid” of the Republic of Latvia (Project No. 1.1.1.2/VIAA/4/20/617 “Data-Driven Nonlinear Wave Modelling”), funded by the European Regional Development Fund (project id. N. 1.1.1.2/16/I/001).

#### Instructions to run the code
- Volume-preserving differential equations are defined in file `DynamicalSystems/VolumePreservingODEs.py`.
- Training and testing data for four example cases are computed in the following files: `DynamicalSystems/TrainingData_AdvectionEq.py`, `DynamicalSystems/TrainingData_RigidBody_Single.py`, `DynamicalSystems/TrainingData_RigidBody_Whole.py`, and `DynamicalSystems/TrainingData_ChargedParticle.py`, respectively.
- All training and testing data is saved in associated problem folders `DynamicalSystems/SavedTrainingData/`.
- All neural network functionas are defined in folder `NeuralNetworkFnc`.
- File `NeuralNetworkFnc/module-class.py` contains LocSympNets and SymLocSympNets modules.
- File `NeuralNetworkFnc/training-class.py` contains neural network training functions.
- Additional neural network supporting functions are defined in files `NeuralNetworkFnc/mySequential.py` and `NeuralNetworkFnc/custom_dataset.py`.
- LocSympNets training script files for four example cases are: `training_AdvectionEq_script.py`, `training_RigidBody_Single_script.py`, `training_RigidBody_Whole_script.py`, and `training_ChargedParticle_script.py`, respectively. 
- SymLocSympNets training script files for four example cases are: `training_AdvectionEq_sym_script.py`, `training_RigidBody_Single_sym_script.py`, `training_RigidBody_Whole_sym_script.py`, and `training_ChargedParticle_sym_script.py`, respectively. 
- All trained neural networks are saved in associated problem folders `SavedNeuralNets/`.
- LocSympNets prediction and testing script files for four example cases are: `predictions_AdvectionEq_script.py`, `predictions_RigidBody_Single_script.py`, `predictions_RigidBody_Whole_script.py`, and `predictions_ChargedParticle_script.py`, respectively. 
- SymLocSympNets training and testing script files for four example cases are: `predictions_AdvectionEq_sym_script.py`, `predictions_RigidBody_Single_sym_script.py`, `predictions_RigidBody_Whole_sym_script.py`, and `predictions_ChargedParticle_sym_script.py`, respectively. 
- Produced images are saved in associated problem folders `Figures/`.

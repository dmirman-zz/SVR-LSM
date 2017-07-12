# Multivariate Lesion-Symptom Mapping Using Support Vector Regression 
# SVR-LSM toolbox

## Theory and background
Lesion analysis is a classic approach to study brain functions. Because brain function is a result of coherent activations of a collection of functionally related voxels, lesion-symptom relations are generally contributed by multiple voxels simultaneously. Although voxel-based lesion-symptom mapping (VLSM) has made substantial contributions to the understanding of brain-behavior relationships, a better understanding of the brain-behavior relationship contributed by multiple brain regions needs a multivariate lesion-symptom mapping (MLSM). The purpose of this artilce was to develop an MLSM using a machine learning-based multivariate regression algorithm: support vector regression (SVR). In the proposed SVR-LSM, the symptom relation to the entire lesion map as opposed to each isolated voxel is modeled using a nonlinear function, so the intervoxel correlations are intrinsically considered, resulting in a potentially more sensitive way to examine lesion-symptom relationships.

For detailed information about the SVR-LSM method, please see the following paper, and please cite that paper if you use the method:

Zhang, Y., Kimberg, D. Y., Coslett, H. B., Schwartz, M. F., & Wang, Z. (2014). Multivariate lesion-symptom mapping using support vector regression. *Human Brain Mapping, 35*(12), 5861–5876. DOI: 10.1002/hbm.22590. http://onlinelibrary.wiley.com/doi/10.1002/hbm.22590/full

## Software
This toolbox requires
* MATLAB (The MathWork, Inc., Natick, MA), version 7.12 or higher
* SPM (Wellcome Institute of Imaging Neuroscience, London, UK), version SPM8 or SPM12b
* libSVM (http://www.csie.ntu.edu.tw/~cjlin/libsvm/), version 3.18

See manual for information about installation and use.
#!/bin/bash
#########################################################
#####                                               #####
#####   INSTALLATION OF FANTASIA IN ANY COMPUTER    #####
#####                                               #####
#########################################################

# How to cite FANTASIA: 

# This tutorial explains all the steps required for the installation of the software used by FANTASIA ProtT5 model is included (other models could be added -see step 7).

# 1. Decompress FANTASIA.tar.gz which contains a copy of all folders, scripts and other files needed to install and execute FANTASIA

tar -xvzf FANTASIA.tar.gz

# 2. Create the conda environment with required software

cd FANTASIA/

conda create --name gopredsim --file tf_conda_env_spec.txt python=3.9.13

conda activate gopredsim #Check that everything is correctly installed

conda install -c bioconda seqtk #Install seqtk

# 3. Create the python environment and install the required packages

#Note: make sure that you are executing the python from the conda environment. Otherwise, there may be version conflicts

#If encountering any error saying that the version of the package is not available or not compatible with other package's version, modify requirements.txt and remove the version (it is indicated by "==XX.XX.X" and it will automatically find the one that is compatible with the rest of the packages). Be aware that the changing the version of some packages may affect the inference of the embeddings and the validity of results obtained.

#Note2: to deactivate python environments, just type "deactivate"

#General enviromment used for ProTT5 model (and could potentially be used for other models except SeqVec)

python3 -m venv venv

source venv/bin/activate

pip install -r requirements.txt

deactivate

# 4. Change "/path-to-FANTASIA-folder/" to the correct path in the scripts for launching the program.

FANTASIA_PATH=$(pwd) #You should be inside teh FANTASIA folder

sed -i "s|/path-to-FANTASIA-folder|$FANTASIA_PATH|g" launch_*.sh

# 5. Change "/path-to-FANTASIA-folder/" to the correct paths in the script to generate the config files required by the software.

sed -i "s|/path-to-FANTASIA-folder|$FANTASIA_PATH|g" generate_gopredsim_input_files.sh

# 6. GOPredSim can be run using CPUs or GPUs. CPUs is the default option selected in these scripts. However, GPUs can be used to increase the speed when dealing with large amounts of data. In clusters, make sure to select GPU nodes and to load the correspondent CUDA module when launching the pipeline. A sample script for executing the pipeline is included. Paths for execution and conda activation should be double checked.

# 7. By default, ProtT5 model files is included in the GOPredSim/models folder. If those files are removed, GOPredSim will automatically download it in the user .cache. If GOPredSim is used in a cluster, this download is user-specific, and, as files are quite big in some cases, it may rise an error if not enough space. To add more models, download files using the links found in /GOPredSim/venv/lib/python3.9/site-packages/bio_embeddings/utilities/defaults.yml and put them in the GOPredSim/models folder. In addition, this information must be added to the configuration files for the embedding part (.yml files) as explained in https://github.com/sacdallago/bio_embeddings/issues/114.

# 8. The folder includes two additional scripts to convert the format on the output to the input of topGO and to collapse GO annotation of several isoforms into GO annotation per gene. Additional information on how to run the pipeline and these steps can be found on GitHub (https://github.com/MetazoaPhylogenomicsLab/FANTASIA).
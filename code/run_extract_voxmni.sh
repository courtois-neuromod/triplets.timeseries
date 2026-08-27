#!/bin/bash
#SBATCH --account=def-pbellec
#SBATCH --job-name=extract_tseries
#SBATCH --output=/home/mstlaure/links/scratch/neuromod/triplets.timeseries/slurm_files/slurm-%A_%a.out
#SBATCH --error=/home/mstlaure/links/scratch/neuromod/triplets.timeseries/slurm_files/slurm-%A_%a.err
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=24
#SBATCH --mem-per-cpu=4000M
#SBATCH --mail-type=ALL
#SBATCH --mail-user=marie.stl@gmail.com

# activate project's virtual env
source /home/mstlaure/links/projects/rrg-pbellec/mstlaure/cneuromod_extract_tseries/env/bin/activate

cd cneuromod_extract_tseries

# launch job
python -m timeseries.run dataset="triplets" parcellation="gm_epi_MNI-allsubmask" subject_list=["${1}"] output_dir="../../timeseries/voxel_mni" data_dir="../../sourcedata"

mv ../../timeseries/voxel_mni/sub-${1}/func/sub-${1}_task-triplets_space-MNI152NLin2009cAsym_atlas-AllSubsAlgo_label-BoldGM_res-func_mask.nii.gz ../../timeseries/voxel_mni/task-triplets_space-MNI152NLin2009cAsym_label-GMfromTemplate_desc-AllFunc_mask.nii.gz

mv ../../timeseries/voxel_mni/sub-${1}/func/sub-${1}_task-triplets_space-MNI152NLin2009cAsym_atlas-AllSubsAlgo_label-BoldGM_res-func_timeseries.h5 ../../timeseries/voxel_mni/sub-${1}/sub-${1}_task-triplets_space-MNI152NLin2009cAsym_desc-voxelwise_timeseries.h5

rm -r ../../timeseries/voxel_mni/sub-${1}/func


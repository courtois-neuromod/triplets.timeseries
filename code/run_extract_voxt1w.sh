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
python -m timeseries.run dataset="triplets" parcellation="gm_epi" subject_list=["${1}"] output_dir="../../timeseries/voxel_native" data_dir="../../sourcedata"

mv ../../timeseries/voxel_native/sub-${1}/func/sub-${1}_task-triplets_space-T1w_label-GM_desc-indivBoldGMfromFS_mask.nii.gz ../../timeseries/voxel_native/sub-${1}/sub-${1}_task-triplets_space-T1w_label-GMfromFS_desc-indivFunc_mask.nii.gz

mv ../../timeseries/voxel_native/sub-${1}/func/sub-${1}_task-triplets_space-T1w_atlas-Freesurfer_label-BoldGM_res-func_timeseries.h5 ../../timeseries/voxel_native/sub-${1}/sub-${1}_task-triplets_space-T1w_desc-voxelwise_timeseries.h5

rm -r ../../timeseries/voxel_native/sub-${1}/func


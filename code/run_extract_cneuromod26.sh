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
python -m timeseries.run dataset="triplets" parcellation="schaefer1000Tian50Nette128" subject_list=["${1}"] output_dir="../../timeseries/cneuromod2026" data_dir="../../sourcedata"

mv ../../timeseries/cneuromod2026/sub-${1}/func/sub-${1}_task-triplets_space-MNI152NLin2009cAsym_atlas-Schaefer2018TianS3NettekovenAsym_desc-1000Parcels7Networks50Subcort128Cereb_dseg.nii.gz ../../timeseries/cneuromod2026/sub-${1}/sub-${1}_task-triplets_space-MNI152NLin2009cAsym_atlas-cneuromod26_desc-1134Parcels_dseg.nii.gz

mv ../../timeseries/cneuromod2026/sub-${1}/func/sub-${1}_task-triplets_space-MNI152NLin2009cAsym_atlas-Schaefer2018TianS3NettekovenAsym_desc-1000Parcels7Networks50Subcort128Cereb_timeseries.h5 ../../timeseries/cneuromod2026/sub-${1}/sub-${1}_task-triplets_space-MNI152NLin2009cAsym_atlas-cneuromod26_desc-1134Parcels_timeseries.h5

mv ../../timeseries/cneuromod2026/sub-${1}/func/sub-${1}_task-triplets_space-MNI152NLin2009cAsym_label-GM_desc-indivBoldGMfromFS_mask.nii.gz ../../timeseries/cneuromod2026/sub-${1}/sub-${1}_task-triplets_space-MNI152NLin2009cAsym_label-GMfromFS_desc-indivFunc_mask.nii.gz

rm -r ../../timeseries/cneuromod2026/sub-${1}/func



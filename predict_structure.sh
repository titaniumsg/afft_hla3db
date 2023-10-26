#!/bin/bash

# If using a slurm scheduler, these lines will be used
#SBATCH --job-name=afft_hla3db
#SBATCH --time=1:00:00
#SBATCH -p gpuq
#SBATCH --gres=gpu:1
#SBATCH --mem=64G
#SBATCH -o outfile.out
#SBATCH --error=./error.out

# To run on CHOP's Respublica Cluster, uncomment the following two lines:
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/isilon/sgourakis_lab_storage/anaconda3/envs/alphafold/lib:/mnt/isilon/sgourakis_lab_storage/anaconda3/envs/alphafold/lib/python3.9/site-packages/tensorrt
# source /mnt/isilon/sgourakis_lab_storage/anaconda3/bin/activate

conda activate alphafold

# Make folders and alignment files
python initialize.py

# This will likely need to be obtained from an external link
PARAMS_FILE = params/7WKJ_af_mhc_params_2351.pkl

if ! test -f ${PARAMS_FILE}; then
  echo "Model parameters file is missing."
fi

for targets in ./input_seq/*.txt; do
	targname=$(echo ${targets} | cut -f 3 -d '/' | cut -f 1 -d '_')
	echo ${targname}

	python run_prediction.py --targets ${targname}/inputs/target.tsv --outfile_prefix ${targname}/outfile --model_names model_2_ptm_ft --model_params_files ${PARAMS_FILE} --ignore_identities

done

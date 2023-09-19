#!/bin/bash
#SBATCH --job-name=test
#SBATCH --time=6:00:00
#SBATCH -p gpuq
#SBATCH --gres=gpu:1
#SBATCH --mem=64G
#SBATCH -o outfile.out
#SBATCH --error=./error.out
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/isilon/sgourakis_lab_storage/anaconda3/envs/alphafold/lib:/mnt/isilon/sgourakis_lab_storage/anaconda3/envs/alphafold/lib/python3.9/site-packages/tensorrt

source /mnt/isilon/sgourakis_lab_storage/anaconda3/bin/activate
conda activate alphafold

for targets in ./input_sequenceblind/*.txt; do
	targname=$(echo ${targets} | cut -f 3 -d '/' | cut -f 1 -d '_')
	echo ${targname}

	python run_prediction.py --targets ${targname}/inputs/target.tsv --outfile_prefix ${targname}/outfile --model_names model_2_ptm_ft --model_params_files params/7WKJ_af_mhc_params_2351.pkl  --ignore_identities

#	end_time=`date +%s`
#	echo Execution_time_in seconds, `expr $end_time - $start_time`>>time_data/time_${targname}.csv
done

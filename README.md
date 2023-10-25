# AF-FT Trained on HLA3DB

#### This repository is a _slight_ modification of the original [alphafold_finetune repo](https://github.com/phbradley/alphafold_finetune) presented in [Motmaen et al., PNAS 2023](doi.org/10.1073/pnas.2216697120). 


### Setup
1. Create a new conda environment using `conda env create -f alphafold_env.yml`
2. Download the model parameters from XXX and place them into the `params` folder

### Structure prediction

1. Populate the `input_seq` folder with the HLA and peptide sequence (on separate lines, see example). Make sure the file name is `XYZ_seq.txt` where XYZ is the target name.
2. `bash predict_structure.sh` - will run based off of files in `input_seq`. This should take 3-5 minutes on a GPU if requesting 64 GB of memory. The script is currently set up to run on a slurm scheduler and may need to be modified for your setup.
3. The output can be found in a folder named `XYZ` where XYZ is the target name.

# AF-FT Trained on HLA3DB

#### This repository is a _slight_ modification of the original [alphafold_finetune repo](https://github.com/phbradley/alphafold_finetune) presented in [Motmaen et al., PNAS 2023](doi.org/10.1073/pnas.2216697120). 

AlphaFold-FineTune (AF-FT) was retrained on peptide/HLA-I 9mer structures from [HLA3DB](https://hla3db.research.chop.edu/) with peptide sequence homologs removed during training. Retraining was conducted by Sreeja Kutti Kandy and the code to predict strucutres based on the saved model is provided after modification by Sagar Gupta. Please contact Dr. Nikolaos Sgourakis via [email](mailto:sgourakisn@chop.edu) if you have any questions/issues.

### Setup
1. Create a new conda environment using `conda env create -f alphafold_env.yml`.
2. Download the model parameters from [OneDrive](https://1drv.ms/u/s!AiO4ndFz-lft5FTz1SKFgfI-f4Cx?e=BPt1QX) (350 MB) and place them into the `params` folder.

### Structure prediction

1. Populate the `input_seq` folder with the HLA and peptide sequence (on separate lines, see example in `input_seq/7P4B_seq.txt`). Make sure the file name is `XYZ_seq.txt` where XYZ is the target name.
2. `bash predict_structure.sh` - will run based off of files in `input_seq`. This should take 3-5 minutes on a GPU if requesting 64 GB of memory. The script is currently set up to run on a slurm scheduler and may need to be modified for your setup.
3. The output can be found in a folder named `XYZ` where XYZ is the target name. See example in `7P4B/` where `outfile_7P4B_model_1_model_2_ptm_ft.pdb` is the final structure model.

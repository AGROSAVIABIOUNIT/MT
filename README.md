MultiTyper v0.1

This process packaged together typing software for different species include Salmonella spp., Escherichia coli, Enterococcus sp.*, Neisseria gonorrhoeae*, Streptococcus pneumoniae*,...

Software per specie

Salmonella: Seqsero2 v1.1.1, Sistr_cmd v1.1.1
Ecoli: Ectyper v1.0.0
Enterococcus: CHEWBBAKKA
Neisseria gonorrhoeae: Ng-master
Streptococcus pneumoniae: Pneumocat, Seroba 

*not available in this version - comming soon!!

##conda install

sh scripts/auto_conda_install.sh

##edit path to nextflow scripts and data base directories, and define specie into the run file "run_mt_pipeline_test.sh" 

NEXTFLOW_PIPELINE_DIR=/path/to/nf_files_base_directory
DATA_DIR=/path/to/data_base_directory
SPECIES= Salmonella or Ecoli

##run MT

sh run_mt_pipeline_test.sh

All in one site!!
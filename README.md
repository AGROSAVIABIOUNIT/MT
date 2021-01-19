# __MultiTyper v0.1__

This process packaged together typing software for different species include Salmonella spp., Escherichia coli, Enterococcus sp.(*), Neisseria gonorrhoeae(*), Streptococcus pneumoniae(*) and scalable using nextflow

## Software per specie

Salmonella: Seqsero2 v1.1.1, Sistr_cmd v1.1.1 <br>
Ecoli: Ectyper v1.0.0 <br>
Enterococcus: CHEWBBAKKA <br>
Neisseria gonorrhoeae: Ng-master <br>
Streptococcus pneumoniae: Pneumocat, Seroba <br>

*not available in this version - comming soon!!

## conda install (optional)

_sh scripts/auto_conda_install.sh_

## nextflow install (optional)

_sh scripts/auto_nextflow_install.sh_

## edit path to nextflow scripts and data base directories, and define specie into the run file "run_mt_pipeline_test.sh" 

_NEXTFLOW_PIPELINE_DIR=/path/to/nf_files_base_directory_ <br>
_DATA_DIR=/path/to/data_base_directory_ <br>
_SPECIES= Salmonella or Ecoli_ <br>

## run MT

_bash run_mt_pipeline_test.sh_

## All in one site!!

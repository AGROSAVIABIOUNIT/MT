##Please to run change path to nextflow script and data base directories: line 1 and 2  
NEXTFLOW_PIPELINE_DIR=/nf/
DATA_DIR=/Ecoli/
SPECIES=Ecoli

SERO_PROCESS=""
for TEST in Salmonella Ecoli Ngono Spneumo 
do
    if [[ $SPECIES == $TEST* ]]
    then
        SERO_PROCESS=$TEST
    fi
done

if [[ $SERO_PROCESS = "Salmonella" ]]
then
    nextflow run ${NEXTFLOW_PIPELINE_DIR}/salm_typing_mt.nf \
    --input_dir ${DATA_DIR}/fastas \
    --fasta_pattern '*.fasta' \
    --output_dir ${DATA_DIR}/mt_output \
    --species ${SERO_PROCESS} \
    -w ${DATA_DIR}/mt_output/work \
    -resume
else
    if [[ $SERO_PROCESS = "Ecoli" ]]
    then
    nextflow run ${NEXTFLOW_PIPELINE_DIR}/ecoli_typing_mt.nf\
    --input_dir ${DATA_DIR}/fastas \
    --fasta_pattern '*.fasta' \
    --output_dir ${DATA_DIR}/mt_output \
    -w ${DATA_DIR}/mt_output/work \
    -resume
    fi
fi 

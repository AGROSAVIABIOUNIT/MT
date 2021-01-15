#!/usr/bin/env nextflow
params.input_dir = false
params.output_dir = false
params.fasta_pattern = false
params.species = false

if (params.input_dir) {
  input_dir = params.input_dir - ~/\/$/
  output_dir = params.output_dir - ~/\/$/
  fasta_pattern = params.fasta_pattern
  fastas_file = input_dir + '/' + fasta_pattern
  Channel
    .fromPath(fastas_file)
    .ifEmpty { error "Cannot find any fastas matching: ${fastas_file}" }
    .set { fastas }
}

//duplicate channels
fastas.into {seqs_seqsero; seqs_sistr}

//seqsero
process seqsero2 {
   memory '8 GB'
   conda 'seqsero2=1.1.1'
   publishDir "${output_dir}",
   mode:'copy',
   saveAs: { file -> "seqsero2_output/${fastas_file}.tsv"}
 

  input:
  file (fastas_file) from seqs_seqsero

  output:
  file('seqsero2_output/*.tsv') 

"""
  SeqSero2_package.py -m k -p 2 -t 4 -i ${fastas_file} -d seqsero2_output
"""
}

//sistr
process sistr {
   memory '8 GB'
   conda 'sistr_cmd=1.1.1'
   publishDir "${output_dir}",
   mode:'copy',
   saveAs: { file -> "sistr_cmd_output/${fastas_file}.csv"}
 
  input:
  file (fastas_file) from seqs_sistr

  output:
  file ('sistr_output/results.csv') 

"""
mkdir sistr_output
sistr --qc -vv --alleles-output sistr_output/allele-results.json --novel-alleles sistr_output/novel-alleles.fasta --cgmlst-profiles sistr_output/cgmlst-profiles.csv -f csv -o sistr_output/results.csv ${fastas_file}

"""
}

#!/usr/bin/env nextflow
params.input_dir = false
params.output_dir = false
params.fasta_pattern = false
params.specie = false

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

//ECtyper
process ectyper {
   memory '8 GB'
   conda 'ectyper=1.0.0'
   publishDir "${output_dir}",
   mode:'copy',
   saveAs: { file -> "ectyper_output/${fastas_file}.tsv"}
 
  input:
  file (fastas_file) from fastas

  output:
  file ('ectyper_output/*.tsv') 

"""
  ectyper -c 2 -i ${fastas_file} -o ectyper_output

"""
}

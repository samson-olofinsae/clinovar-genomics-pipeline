#!/usr/bin/env nextflow

nextflow.enable.dsl=2

include { fastqc_process } from './modules/fastqc/fastqc.nf'

workflow {
    Channel
        .fromPath('test_data/sample1.fastq')
        .map { file -> tuple(file, file.getBaseName().tokenize('.')[0]) }
        | fastqc_process
}

// main.nf
nextflow.enable.dsl=2

// Import process modules
//include { fastqc_process }          from './modules/fastqc/main.nf'
include { fastqc_module } from './modules/fastqc/main.nf'
// include { alignment_process }       from './modules/alignment/main.nf'
// include { mark_duplicates }         from './modules/mark_duplicates/main.nf'
// include { index_bam }               from './modules/index_bam/main.nf'
// include { gc_bias_metrics }         from './modules/gc_bias/main.nf'
// include { coverage_report }         from './modules/coverage/main.nf'
// include { contamination_check }     from './modules/contamination/main.nf'
// include { variant_calling }         from './modules/variant_calling/main.nf'
// include { annotate_vcf }            from './modules/annotation/main.nf'
// include { generate_mdt_report }     from './modules/reporting/main.nf'
// include { pipeline_logger }         from './modules/logging/main.nf'

workflow {
    Channel
        .fromPath(params.input_fastq, checkIfExists: true)
        .ifEmpty { error "No FASTQ files found at: ${params.input_fastq}" }
        .map { file -> tuple(file, file.getBaseName().tokenize('.')[0]) }
        .set { raw_reads }

    // Execution chain
    // Call FastQC module
    fastqc_module(raw_reads)
    //alignment_process(raw_reads)
    //    .out
    //    .set { aligned_bam }

    //mark_duplicates(aligned_bam)
    //    .out
    //    .set { dedup_bam }

    //index_bam(dedup_bam)
    //gc_bias_metrics(dedup_bam)
    //coverage_report(dedup_bam)
    //contamination_check(dedup_bam)

    //variant_calling(dedup_bam)
    //    .out
    //    .set { raw_vcf }

    //annotate_vcf(raw_vcf)
    //    .out
    //    .set { annotated_vcf }

    //generate_mdt_report(annotated_vcf)
    //pipeline_logger()
}

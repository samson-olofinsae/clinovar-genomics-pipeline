// main.nf
nextflow.enable.dsl=2

workflow {

    // Import process modules
    include { fastqc_process } from './modules/fastqc/main.nf'
    include { alignment_process } from './modules/alignment/main.nf'
    include { mark_duplicates } from './modules/mark_duplicates/main.nf'
    include { index_bam } from './modules/index_bam/main.nf'
    include { gc_bias_metrics } from './modules/gc_bias/main.nf'
    include { coverage_report } from './modules/coverage/main.nf'
    include { contamination_check } from './modules/contamination/main.nf'
    include { variant_calling } from './modules/variant_calling/main.nf'
    include { annotate_vcf } from './modules/annotation/main.nf'
    include { generate_mdt_report } from './modules/reporting/main.nf'
    include { pipeline_logger } from './modules/logging/main.nf'

    // Set input channel
    Channel
        .fromPath(params.input_fastq)
        .set { raw_reads }

    // Execution chain
    fastqc_process(raw_reads)
    alignment_process(raw_reads)
    mark_duplicates(alignment_process.out)
    index_bam(mark_duplicates.out)
    gc_bias_metrics(mark_duplicates.out)
    coverage_report(mark_duplicates.out)
    contamination_check(mark_duplicates.out)
    variant_calling(mark_duplicates.out)
    annotate_vcf(variant_calling.out)
    generate_mdt_report(annotate_vcf.out)
    pipeline_logger()
}

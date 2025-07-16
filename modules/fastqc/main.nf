// modules/fastqc/main.nf

process fastqc_process {
    tag "$sample_id"
    publishDir "results/fastqc_reports", mode: 'copy'
    container 'quay.io/biocontainers/fastqc:0.11.9--0'

    input:
    path fastq_file
    val sample_id

    output:
    path "*.html"
    path "*.zip"

    script:
    """
    fastqc $fastq_file --outdir .
    """
}

// CHANGED from workflow fastqc_process to fastqc_module
workflow fastqc_module {
    take: raw_reads
    main:
        fastqc_process(raw_reads)
}

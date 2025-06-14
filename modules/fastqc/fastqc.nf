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

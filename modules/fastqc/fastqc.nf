process fastqc_process {
    tag "$sample_id"
    publishDir "results/fastqc_reports", mode: 'copy'

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

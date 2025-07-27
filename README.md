# Clinovar Genomics Pipeline

A modular, NHS-grade Nextflow pipeline simulating an end-to-end clinical bioinformatics workflow for cancer genomics.

---

## Project Purpose

The **Clinovar Genomics Pipeline** was developed as a public-facing, educational, and research-grade tool to:

- Simulate NHS genomic laboratory workflows
- Train pre-registration clinical bioinformaticians
- Validate key bioinformatics tools under real-world scenarios
- Showcase modular pipeline design aligned with HCPC standards

---

## Pipeline Overview

The pipeline processes raw FASTQ files to final MDT-ready outputs, including variant calls and annotation.

### Workflow Summary

| Step | Tool               | Output                                      | Reference |
|------|--------------------|---------------------------------------------|-----------|
| 1.   | FastQC             | Read quality reports (`.html`, `.zip`)      | Andrews et al., 2010 |
| 2.   | BWA                | Aligned BAM (`.bam`)                        | Li & Durbin, 2009 |
| 3.   | Picard             | Deduplicated BAM + metrics                  | Broad Institute, 2019 |
| 4.   | Samtools           | Indexed BAM (`.bai`)                        | Li et al., 2009 |
| 5.   | Picard (GC Bias)   | Bias plot + summary                         | Broad Institute, 2019 |
| 6.   | Mosdepth           | Coverage statistics                         | Pedersen & Quinlan, 2018 |
| 7.   | VerifyBamID        | Contamination estimation                    | Jun et al., 2012 |
| 8.   | Mutect2 / Strelka2 | Raw somatic VCF                            | Cibulskis et al., 2013 / Kim et al., 2018 |
| 9.   | Ensembl VEP        | Annotated VCF                               | McLaren et al., 2016 |
| 10.  | Markdown-to-PDF    | Simulated MDT report (`.pdf`)               | N/A (internal simulation) |
| 11.  | Logging            | Audit trail of tool versions, output paths  | N/A (internal module) |

---

## References

- Andrews S. *FastQC: a quality control tool for high throughput sequence data*. (2010).
- Li H., Durbin R. *Fast and accurate short read alignment with Burrows–Wheeler transform*. Bioinformatics, 2009.
- Broad Institute. *Picard Toolkit*. (2019). http://broadinstitute.github.io/picard/
- Li H. et al. *The Sequence Alignment/Map format and SAMtools*. Bioinformatics, 2009.
- Pedersen BS, Quinlan AR. *Mosdepth: quick coverage calculation for genomes and exomes*. Bioinformatics, 2018.
- Jun G. et al. *Detecting and estimating contamination of human DNA samples*. AJHG, 2012.
- Cibulskis K. et al. *Sensitive detection of somatic point mutations in impure and heterogeneous cancer samples*. Nat Biotech, 2013.
- Kim S. et al. *Strelka2: fast and accurate variant calling for clinical sequencing applications*. Nat Methods, 2018.
- McLaren W. et al. *The Ensembl Variant Effect Predictor*. Genome Biol, 2016.

---

## Requirements

- [Nextflow](https://www.nextflow.io/)
- Docker or Singularity
- Reference genome (e.g. `hg19_chr8.fa`)
- Configurable input files

---

## Usage

Clone the repo and run:
```bash
nextflow run main.nf -profile singularity --input_fastq "./data/*.fastq.gz" --reference "./resources/genomes/hg19_chr8.fa"
```

Override any parameter via command line or edit `nextflow.config`.

---

## Repository Structure

```bash
main.nf
nextflow.config
modules/                 # Modular DSL2 processes
docs/                    # Project documentation
resources/               # Reference genome and tool assets
.gitignore
LICENSE
README.md                # You’re reading it!
```

---

## Documentation

See [docs/clinovar-genomics-pipeline.md](./docs/clinovar-genomics-pipeline.md) for a detailed walkthrough of each step and its clinical relevance.

---

## Clinical Relevance

Designed to reflect core principles from NHS Genomic Laboratory Hubs (GLHs), HCPC's Good Scientific Practice, and STP training expectations for clinical scientists in genomics.

**Note:** This pipeline is inspired by standard NHS genomic workflows but is entirely fictional and not based on internal WMRGL or NHS systems.

---

## Author

**Samson Olofinsae**  
  
*This pipeline is an independent educational project and is not affiliated with or endorsed by WMRGL or the NHS.*

---

## License

Released under the MIT License. See [LICENSE](./LICENSE).
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

---

> *“Pipelines are stories. This one tells the story of trust, reproducibility, and clarity in clinical genomics.”*



## Ethical Statement
This project is intended strictly for educational and training purposes. It does not represent, replicate, or leak any internal pipeline, data, or intellectual property of the NHS, WMRGL, or affiliated institutions. All workflows and configurations are simulated, inspired by publicly documented practices, and are developed independently by the author under the principles of transparency, reproducibility, and academic learning.
The name **Clinovar** is entirely fictional and chosen solely for illustrative convenience. It does not refer to, endorse, or represent any real genomics company, organisation, or product — governmental or private.


## Training Context

This fictional NHS-style pipeline simulates a real-world bioinformatics workflow used in clinical cancer genomics. It includes:

- QC (FastQC), alignment (BWA), deduplication (Picard), coverage (Mosdepth), contamination (VerifyBamID)
- Planned extensions for variant calling, annotation, and MDT reporting

It forms part of my STP Equivalence portfolio and reflects:
- Domain 1: Professional Practice  
- Domain 2: Scientific Practice  
- Domain 4: Research, Development and Innovation
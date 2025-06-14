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

| Step | Tool | Output |
|------|------|--------|
| 1.  | FastQC            | Read quality reports (`.html`, `.zip`) |
| 2.  | BWA               | Aligned BAM (`.bam`) |
| 3.  | Picard            | Deduplicated BAM + metrics |
| 4.  | Samtools          | Indexed BAM (`.bai`) |
| 5.  | Picard (GC Bias)  | Bias plot + summary |
| 6.  | Mosdepth          | Coverage stats |
| 7.  | VerifyBamID       | Contamination check |
| 8.  | Mutect2 / Strelka | Raw somatic VCF |
| 9.  | Ensembl VEP       | Annotated VCF |
| 10. | Markdown-to-PDF   | Simulated MDT report |
| 11. | Logging           | Audit trail of file versions, tool versions, outputs |

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
nextflow run main.nf -profile standard --input_fastq "./data/*.fastq.gz" --reference "./resources/genomes/hg19_chr8.fa"
```

Override any parameter via command line or edit `nextflow.config`.

---

## Repository Structure

```bash
🔹 main.nf
🔹 nextflow.config
🔹 modules/                 # Modular DSL2 processes
🔹 docs/                    # Project documentation
🔹 resources/               # Reference genome and tool assets
🔹 .gitignore
🔹 LICENSE
🔹 README.md                # You’re reading it!
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
Clinical Bioinformatics Trainee (NHS, UK)  
*This pipeline is an independent educational project and is not affiliated with or endorsed by WMRGL or the NHS.*

---

## License

Released under the MIT License. See [LICENSE](./LICENSE).

---

> *“Pipelines are stories. This one tells the story of trust, reproducibility, and clarity in clinical genomics.”*

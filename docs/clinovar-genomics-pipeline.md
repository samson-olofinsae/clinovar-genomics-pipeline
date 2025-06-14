# Clinovar Genomics Pipeline

A modular, NHS-grade Nextflow pipeline simulating a full clinical cancer genomics workflow for training, validation, and research purposes.

---

## Purpose

The **Clinovar Genomics Pipeline** was developed to:
- Simulate real-world clinical workflows in NHS genomic laboratories
- Train and assess pre-registration clinical bioinformaticians
- Provide a reproducible platform for testing cancer genomics tools
- Serve as portfolio-quality evidence of computational competence

**Note:** This pipeline is inspired by NHS GLH practices but is entirely fictional and not based on internal WMRGL or NHS systems.

---

## Pipeline Overview

The pipeline processes raw FASTQ files through a complete bioinformatics workflow to final annotated variants and simulated MDT reports. It includes built-in logging and audit-trail functionality.

### **Workflow Steps**

| Step | Module | Description |
|------|--------|-------------|
| 1 | `fastqc_process` | Quality control of raw FASTQ files using FastQC |
| 2 | `alignment_process` | Aligns reads to reference genome using BWA |
| 3 | `mark_duplicates` | Marks PCR duplicates with Picard |
| 4 | `index_bam` | Indexes the BAM file using Samtools |
| 5 | `gc_bias_metrics` | Calculates GC bias statistics with Picard |
| 6 | `coverage_report` | Estimates coverage using Mosdepth |
| 7 | `contamination_check` | Runs VerifyBamID to check for contamination |
| 8 | `variant_calling` | Calls somatic variants using Mutect2 or Strelka2 |
| 9 | `annotate_vcf` | Annotates variants using Ensembl VEP |
| 10 | `generate_mdt_report` | Simulates MDT-style report generation in markdown/pdf |
| 11 | `pipeline_logger` | Logs file paths, tool versions, and process audit trails |
| 12 | `final output` | Organizes all results into structured folders |

---

## Technology Stack

- **Nextflow DSL2**
- **Docker/Singularity containers**
- **BWA**, **Picard**, **Samtools**, **FastQC**
- **Mosdepth**, **VerifyBamID**, **Mutect2**, **VEP**

---

## Folder Structure

```bash
clinovar-genomics-pipeline/
├── main.nf
├── nextflow.config
├── modules/
│   └── [process_name].nf
├── resources/
│   └── genomes/hg19_chr8.fa
├── docs/
│   └── clinovar-genomics-pipeline.md
├── .gitignore
├── LICENSE
└── README.md
```

---

## Clinical Relevance

This pipeline is built in alignment with:
- UK Genomics Laboratory Hub (GLH) practices
- HCPC & STP training standards
- Realistic end-to-end cancer bioinformatics workflows

**Disclaimer:** This project is an independent educational initiative and is not affiliated with or endorsed by WMRGL or the NHS.

---

## Maintainer
**Samson Olofinsae**  
Clinical Bioinformatics Trainee (NHS, UK)  
*Independent project for education and professional development.*

---

> *“Pipelines are stories. This one tells the story of clinical trust, scientific accuracy, and educational clarity.”*

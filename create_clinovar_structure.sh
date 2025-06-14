#!/bin/bash

# Clinovar Genomics Institute — Folder and File Structure Generator

PROJECT_NAME="clinovar-pipeline"

echo "🧬 Creating project structure: $PROJECT_NAME"

# Create base project directory
mkdir -p $PROJECT_NAME

# Navigate into it
cd $PROJECT_NAME || exit

# Create primary files
touch main.nf nextflow.config README.md LICENSE .gitignore

# Create documentation
mkdir -p docs
touch docs/clinovar-genomics-pipeline.md

# Create resource directories
mkdir -p resources/genomes
touch resources/genomes/hg19_chr8.fa  # placeholder (user must replace)

# Create modules with subfolders for each process
mkdir -p modules/{fastqc,alignment,deduplication,indexing,gc_bias,coverage,contamination,variant_calling,annotation,reporting,logging}

# Create placeholder .nf files for each module
touch modules/fastqc/fastqc.nf
touch modules/alignment/alignment.nf
touch modules/deduplication/mark_duplicates.nf
touch modules/indexing/index_bam.nf
touch modules/gc_bias/gc_bias.nf
touch modules/coverage/mosdepth.nf
touch modules/contamination/verifybamid.nf
touch modules/variant_calling/mutect2.nf
touch modules/annotation/vep.nf
touch modules/reporting/mdt_report.nf
touch modules/logging/logger.nf

# Output message
echo "Structure created. Navigate to ./$PROJECT_NAME to view it."

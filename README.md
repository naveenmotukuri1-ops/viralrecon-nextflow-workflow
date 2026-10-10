# SARS-CoV-2 Amplicon Sequencing Analysis with nf-core/viralrecon

A reproducible command-line workflow for processing Illumina amplicon sequencing data with the community-maintained [nf-core/viralrecon](https://github.com/nf-core/viralrecon) Nextflow pipeline.

## Project status

The terminal log from this run records a successful completion of nf-core/viralrecon v2.6.0. The run processed five samples, with all five passing the pipeline's Bowtie2 mapped-read threshold. The log reports 197 successful tasks and a duration of 44 minutes 19 seconds.

This repository documents the commands and workflow configuration. It does **not** contain raw sequencing reads, private sample metadata, or the full generated output directory.

## Tools used

- macOS
- Nextflow 24.10.5
- nf-core/viralrecon 2.6.0
- Conda environment (`nextflow`) and Java 21
- Docker
- Illumina sequencing data
- SARS-CoV-2 reference accession: `MN908947.3`
- ARTIC primer scheme, version 3

## Workflow overview

1. Validate the sample sheet.
2. Prepare the reference genome and primer information.
3. Perform read quality control and trimming.
4. Align reads to the reference genome.
5. Trim primer sequences and process alignment files.
6. Call variants and generate consensus sequences and QC reports.
7. Aggregate quality-control information with MultiQC.

The exact steps depend on the selected pipeline options. This run skipped Kraken2, de novo assembly, Pangolin, Nextclade, and ASCIIGenome.

## Setup

Install and configure Nextflow, Java, Conda, and Docker for your machine. Make sure Docker Desktop is running before launching a Docker-profile workflow.

Check the installed tools:

```bash
nextflow -version
java -version
docker run hello-world
```

Create or activate your own Nextflow Conda environment as appropriate for your setup. The original run used a Conda environment named `nextflow` and Java 21. Avoid copying machine-specific absolute paths into a shared project.

## Input data

Create a `samplesheet.csv` in the working directory using the format required by the selected viralrecon version and your sequencing layout. Keep real sample metadata and sequencing files out of this public repository unless you have permission to share them.

A generic example is provided as `samplesheet.example.csv`. Check the official pipeline documentation for the exact sample-sheet format and input requirements for your data.

## Run the workflow

From the repository directory, place your valid `samplesheet.csv` in the working directory and run:

```bash
bash scripts/run_viralrecon.sh
```

The script writes outputs to `results/viralrecon` and uses `work/` for Nextflow task files. These generated files are intentionally excluded from Git by `.gitignore`.

## Results recorded in the terminal log

- Pipeline: `nf-core/viralrecon` v2.6.0
- Sequencing platform: Illumina
- Protocol: amplicon
- Reference: `MN908947.3`
- Primer scheme: ARTIC v3
- Samples passing the Bowtie2 mapped-read threshold: 5/5
- Successful tasks reported: 197
- Runtime reported: 44 min 19 sec

These are execution metrics from the recorded run, not a claim of independent biological validation. Interpret variant calls and consensus sequences using appropriate QC and biological context.

## Troubleshooting notes

- **Docker Desktop unable to start:** start Docker Desktop and verify `docker run hello-world` succeeds before rerunning Nextflow.
- **Pipeline revision:** specify the pipeline revision explicitly with `-r 2.6.0` for reproducibility.
- **Sample-sheet validation:** confirm the sample sheet follows the version-specific format and that input file paths exist.
- **Resume:** `-resume` can reuse cached tasks from a previous run with the same work directory.

See [`docs/troubleshooting.md`](docs/troubleshooting.md) for more details.

## Reproducibility and attribution

This project runs the published nf-core pipeline; it is not a new pipeline implementation. Cite the pipeline and software according to the official [viralrecon citation instructions](https://github.com/nf-core/viralrecon/blob/master/CITATIONS.md) and the [nf-core framework paper](https://doi.org/10.1038/s41587-020-0439-x).

## Disclaimer

This repository is a learning and workflow-documentation project. The included shell script reflects the options used in one recorded run; review the official documentation and validate your own inputs before using it for research or clinical decisions.

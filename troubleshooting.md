# Troubleshooting notes

## Docker Desktop does not start

The initial terminal log showed `Docker Desktop is unable to start`. Later, `docker run hello-world` succeeded, confirming the Docker daemon was working at that point.

Before running the pipeline:

```bash
open -a Docker
docker run hello-world
```

Wait for Docker Desktop to finish starting. If the test fails, troubleshoot Docker before launching Nextflow.

## Pin the pipeline revision

The log showed a message asking for an explicit revision. Use:

```bash
nextflow run nf-core/viralrecon -r 2.6.0 ...
```

The included run script pins revision `2.6.0`.

## Sample sheet

An earlier attempt failed at `SAMPLESHEET_CHECK` while Docker was unavailable. A later run passed sample-sheet validation. If validation fails, check the required columns for the exact pipeline version, sample names, file paths, and whether paired-end/single-end inputs match your data.

## Resume an interrupted run

The script includes `-resume`. Nextflow can reuse cached tasks when the work directory and task inputs are unchanged. Do not delete `work/` if you intend to resume from the same run.

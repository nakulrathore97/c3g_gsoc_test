# GSOC Selection Test : Creating a new pipeline for long-read RNA-seq using StringTie v2

## Prerequisites
1. R version 3.6.3
2. libcurl (for ballgown)
3. libxml (for ballgown)
4. ballgown package in R

## Details

You need to place the .bam files in the directory.

The bash script is [`run.sh`](run.sh).
The comments describe all the issues I encountered and their fixes.


`bash run.sh`

[`output.txt`](output.txt) contains the output of the bash file I observed on my computer.

The R script is [`gsoc_test.R`](gsoc_test.R)

`Rscript gsoc_test.R`

## Paths 

The tablemaker executable is also present in the directory.

## Required files

* A bash script with your StringTie v2 and Tablemaker commands.

   [`run.sh`](run.sh)
* An R script with your Ballgown commands.

   [`gsoc_test.R`](gsoc_test.R)
* The first 1000 lines of both GTF files generated using StringTie2.

   [`first_1000_brain.gtf`](first_1000_brain.gtf)

   [`first_1000_liver.gtf`](first_1000_liver.gtf)
* The first 1000 lines of the FPKM matrix produced by Ballgown, saved as a csv.
   
   [`first_1000_fpkm_output.csv`](first_1000_fpkm_output.csv)


#!/bin/bash

#### 1. Quality control RNAseq (FastQC) ####

## Access folder with raw data

cd ~/raw_data/

## Creating the results folder:

mkdir ../fastqc/_m

# Running:

for i in $(ls); do
if [[ $i = *.gz ]]
then
fastqc $i -o ~/fastqc/fastqc_results &
fi #fi closes the if
done

wait

#!/bin/bash

### Quality control, adaptors trimming and removal of bad quality sequences ###

## Set folder:

cd trimmomatic/

## Creating the results folder

mkdir -p trimmomatic/results

## Creating aliases for the folders

INPUT_FOLDER=/raw_data/
OUTPUT_FOLDER=/trimmomatic/results

## Running Trimmomatic into FASTQs (use both R1 and R2 as input)
# parameters were chosen according to the Trimmomatic manual

for i in $(cat files_list.txt); do

echo "Beggining sample $i:"

time java -jar /usr/local/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 16 ${INPUT_FOLDER}/${i}_R1_001.fastq.gz ${INPUT_FOLDER}/${i}_R2_001.fastq.gz ${OUTPUT_FOLDER}/${i}_R1_paired.fq.gz ${OUTPUT_FOLDER}/${i}_R1_unpaired.fq.gz ${OUTPUT_FOLDER}/${i}_R2_paired.fq.gz ${OUTPUT_FOLDER}/${i}_R2_unpaired.fq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

echo "Trimmomatic run for sample $i!"

done

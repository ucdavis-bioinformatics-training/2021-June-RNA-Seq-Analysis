#!/bin/bash

start=`date +%s`
echo $HOSTNAME

outpath="References"
mkdir -p ${outpath}

cd ${outpath}

wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M27/GRCm38.primary_assembly.genome.fa.gz
gunzip GRCm38.primary_assembly.genome.fa.gz
FASTA="../GRCm38.primary_assembly.genome.fa"

wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M27/gencode.vM27.annotation.gtf.gz
gunzip gencode.vM27.annotation.gtf.gz
GTF="../gencode.vM27.annotation.gtf"

mkdir star.overlap100.gencode.M27
cd star.overlap100.gencode.M27

module load star

call="STAR
    --runThreadN 8 \
    --runMode genomeGenerate \
    --genomeDir . \
    --genomeFastaFiles ${FASTA} \
    --sjdbGTFfile ${GTF} \
    --sjdbOverhang 100"

echo $call
eval $call

end=`date +%s`
runtime=$((end-start))
echo $runtime

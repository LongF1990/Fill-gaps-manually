#!/bin/bash
#alignment extracted sequences around gaps to nanopore contigs
minimap2 -x asm10 -c -t 10 nanopore.fasta extracted_sequences_around_gaps.fa -o extracted_sequences_to_nanopore_contigs.paf

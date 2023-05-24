# Fill-gaps-manually
How to fill gaps in genome of soybean
Several Perl scripts to fill gaps manually in genome of soybean as pipeline in 
01_extract_sequences_around_gaps.pl: extract sequence of 100kb upstream and downstream og gaps. The length of extracted sequences depend on alignment results.
02_align_extracted_sequences_tonanopore_contigs.sh: align extract sequences to nanopore contigs
03_select_align_strictly.pl: identifying uniquely mapped sequence pairs
04_extract_sequences_to_for_patching.pl: extract sequences between two uniquely mapped pairs
05_patch_genome_manually.pl: Patch genome manually by extracted sequences

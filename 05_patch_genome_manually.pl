#! usr/bin/perl -w
#Patch genome manually by extracted sequences
#usage: perl x.pl y_genome.fa
@name=split/\./,$ARGV[0];
open (OUT, ">$name[0]_patched_manually_1st.fa") or die "$!";
#genome_with_gaps.fa
%hash=();
open(F1,$ARGV[0]) or die "$!";
while(my $line=<F1>){
	chomp $line;
	if($line=~/>/){$key=$line;}
	else{$hash{$key}.=$line;}
}
close F1;
foreach $key(sort keys %hash){
				if($key eq ">HiC_scaffold_15"){$hash{$key}=~s/(N){500}/TGCCGGCGTTGTTTGTTCCGCGTGCGGTTG/;} # sequences to patch
				if($key eq ">HiC_scaffold_3"){$hash{$key}=~s/(N){500}/GAGTAAAGATTTTTTTTGTTTTTTTTTTTTTGGAAAAATTGTTTTTTTTTTTGTGGGTTTTCTTTTTTTTTTGTGGTTTTTTTGTCATAAGAAAAATTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTGGGGTGGTTTGGTTGGATTTATGTGAATAATATTGGATTTTGAGGAAAAAAGTTTTTGTTTTTTGGTTTTGTTTAATATCTTTTTTTTTTTTTTTGGGGGACTCGATATATTA/;}
				if($key eq ">HiC_scaffold_9"){$hash{$key}=~s/(N){500}/AAACGCGGATAATGTCTACGAAGAGATGAGAAATTCCGAAACACCCGCGACGAAAAAGCAGACGACACGCCGGAAAGAACGGAGGCCAGAAAGCACCGGGACGCCGACGAACACCTAATCGACACACCAAAAACAGGGAGAAAGACAAACAACAGCCAACACGGCGAAACAGCCGCGACGATATTCAGCCGACATTGCGCAATACAAACGCGGCCGATAATATCTTAGGGCAGAGGGAGTG/;}
				print OUT $key,"\n";
				print OUT $hash{$key},"\n";
}
close OUT;

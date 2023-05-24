#! usr/bin/perl -w
#extract sequences between two uniquely mapped pairs
#usage: perl x.pl y_nanopore_contig.fa z_uniquely_mapped_positions.txt
open(OUT,">polished_sequences_for_patching.txt") or die "$!";
#polished_nanopore.fasta
%hash=();
open(F1,$ARGV[0]) or die "$!";
while(my $line=<F1>){
	chomp $line;
	if($line=~/>/){
		@arr=split/\>/,$line;
		$key=$arr[1];
		}
	else{$hash{$key}.=$line;}
}
close F1;
#Notice: paf file is 0 base (like bed)
#Input file format
#HiC_scaffold_3_22473737_22474236	HiC_scaffold_3	22456607	22456860	254
open(F1,$ARGV[1]) or die "$!";
while(my $line=<F1>){
	chomp $line;
	@arr=split/\t/,$line;
	if($line=~/HiC_scaffold/){
		if(exists($hash{$arr[1]})){
		$len=$arr[3]-$arr[2]+1;
		$seq=substr($hash{$arr[1]},$arr[2],$len);
		print OUT $arr[0],"\t",$seq,"\n";
								}
							}
}
close F1;
close OUT;

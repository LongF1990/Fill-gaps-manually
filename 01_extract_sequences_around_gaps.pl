#! usr/bin/perl -w
#extract sequence of 100kb upstream and downstream og gaps. The length of extracted sequences depend on alignment results.
#usage: perl x.pl y_genome.fa
@name=split/\./,$ARGV[0];
open (OUT, ">$name[0]_seq_around_Ns.fa") or die "$!";
%hash=();
open(F1,$ARGV[0]) or die "$!";
while(my $line=<F1>){
	chomp $line;
	if($line=~/>/){$key=$line;}
	else{$hash{$key}.=$line;}	
}
close F1;
foreach $key(sort keys %hash){
	while($hash{$key}=~/(N){500}/g){ #gap with 500 N
		$match = $&;
		$len=length($match);
		$end=pos($hash{$key});
		$start=$end-$len+1;
		$base_count=100000; # Length of extracted sequences was 100kb
		$L=substr($hash{$key},$start-$base_count-1,$base_count); # sequence of 100kb upstream of gap
		$R=substr($hash{$key},$end,$base_count); # sequence of 100kb downstream of gap
		print OUT $key,"_",$start,"_",$end,"_","L","\n";
		print OUT $L,"\n";
		print OUT $key,"_",$start,"_",$end,"_","R","\n";
		print OUT $R,"\n";
	}
}
close OUT;

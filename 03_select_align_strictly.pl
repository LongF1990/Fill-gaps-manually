#! usr/bin/perl -w
#select uniquely mapped sequence pairs
#usage: perl x.pl y.paf
@name=split/\./,$ARGV[0];
open(OUT,">$name[0]_select.paf") or die "$!";
open(F1,$ARGV[0]) or die "$!";
while(my $line=<F1>){
			chomp $line;
			@arr=split/\s+/,$line;
			$ide=$arr[9]/$arr[10];
			$cov1=($arr[3]-$arr[2])/$arr[1];
			$cov2=($arr[8]-$arr[7])/$arr[6];
			if($ide>=0.9 && ($cov1>=0.9 || $cov2>=0.9) && $arr[16] eq "tp:A:P"){print OUT $line,"\n";}
}
close F1;
close OUT;

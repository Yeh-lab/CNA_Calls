use strict;
use warnings;

my %gene_hash;
my $genes_list = "DNArepair_genes.txt";

open (LIST, "<$genes_list");
(<LIST>); #throw away header
while (<LIST>)
{
my @line= split(/\s/,$_);
#print "$_\n";
$gene_hash{$line[0]} = "TRUE";
}
close LIST;
my @keys= keys(%gene_hash);


my @cns = <*.cns>;

foreach my $file (@cns)
{
open (CNS, "<$file");
my $name = substr($file,0,-4);
my $output = $name.'_DNArepair.cns';
open (OUTPUT, ">$output");
my $header = (<CNS>);
print OUTPUT "$header";
close CNS;

	foreach my $gene(keys(%gene_hash))

		{
		my $pattern = '[^a-zA-Z0-9]'.$gene.'[^a-zA-Z0-9]';
		
		my @grep = `grep -P $pattern $file>&1`;

		if (scalar(@grep))
			{
			foreach my $i (1..scalar(@grep))
				{
				my @line = split(/\t/,$grep[$i-1]);

				if ($line[4] <= -1 || $line[4] >= 2)
					{
					print OUTPUT "$line[0]\t$line[1]\t$line[2]\t$gene\t$line[4]\t$line[5]\t$line[6]\n";
					}
				}
			}
			
		}
		
	
 

 close CNS;
}
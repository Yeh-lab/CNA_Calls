# CNA_Calls
Ashworth DNA repair genes with CNA calls and UCSF500 v.2 genes with CNA calls
CNAs are called with CNVkit with a bin size of 20Kb during cnr copy number signal calling. Default settings for cns segment calling.
This perl script takes as input: *.cns files, and a genes_list.txt file with one column listing one gene per line. 
Genes that are in the Ashworth DNA repair genes list, or UCSF500 v.2 (NimV4) that reside on a CNA segment for which:
- Log2 signal >= 2.0
or
- Log2 signal <= -1.0
are output to a new cns file

make release

./run_tests.sh

# Both the brain and liver .bam files are present in the same folder.
# Additionally, I downloaded the tablemaker file and placed it in the same folder.

echo
echo "generating .gtf for brain file: brain.gtf"
./stringtie -L -o brain.gtf RNA_nanopore.brain.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam 
echo
echo "generating .gtf for liver file: liver.gtf"
./stringtie -L -o liver.gtf RNA_nanopore.liver.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam 

# Initially I just jumped without reading up about RNA sequencing and tried to use the different gtf files for generating tablemaker samples.
# Got an intron ids not same or missing error in ballgown.
# solved this by using a merged gtf after learning about RNA sequencing and its use from these resources
# https://github.com/griffithlab/rnaseq_tutorial/wiki/Transcript-Assembly-Merge
# https://www.youtube.com/watch?v=tlf6wYJrwKY

echo
echo "merging the two gtf files into merged.gtf"
./stringtie --merge -p 8 -o merged.gtf brain.gtf liver.gtf


# Initially I was getting a BAM record error: found spliced alignment without XS attribute
# solved it by specifying --library-type (not sure about the option I specified though - works without errors though)
# found at https://groups.google.com/forum/#!topic/rna-star/0Cq51RlyJ5g
echo
./tablemaker -p 4 -q -W -G merged.gtf -o sample01 RNA_nanopore.brain.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam --library-type fr-firststrand

echo
./tablemaker -p 4 -q -W -G merged.gtf -o sample02 RNA_nanopore.liver.C1R1_mapping_E94_minimap2_primary_no_read_less_than_80QC.bam --library-type fr-firststrand

# needed to install curl and xml libraries in order to install ballgown
echo
Rscript gsoc_test.R


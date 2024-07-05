#convert .sam to .bam and .bamsort
rule sam2bam:
	input:
		"minimap2/{samplename}.sam"
	output:
		bam="minimap2/{samplename}.bam",
		sortbam="minimap2/{samplename}.bam.sort",
		readcount="minimap2/{samplename}.bam.sort_readcount"
	log:
		"logs/{samplename}_sam2bam.log"
	threads:20
	benchmark:
		"benchmarks/{samplename}_sam2bam.txt"
	message:
		"sam2bam on {samplename}"
	shell:
		"""
		~/tools/samtools/samtools-1.16.1/samtools view -bS {input} >{output.bam} 
		~/tools/samtools/samtools-1.16.1/samtools sort -o {output.sortbam} {output.bam} 
		~/tools/samtools/samtools-1.16.1/samtools index {output.sortbam} 
		~/tools/samtools/samtools-1.16.1/samtools idxstats {output.sortbam} >{output.readcount} 
		"""


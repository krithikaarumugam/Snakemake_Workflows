#calculate perbase cov from .bamsort, get length of contigs from assembly_info.txt from flye
rule perbasecoverage:
	input:
		assembly_info="assembly/flye/{samplename}_assembly/assembly_info.txt",
		sortbam="minimap2/{samplename}.bam.sort"
	output:
		header="minimap2/{samplename}.header",
		perbasecov="minimap2/{samplename}.perbasecov"
	log:
		"logs/{samplename}_perbasecov.log"
	threads:20
	benchmark:
		"benchmarks/{samplename}_perbasecov.txt"
	message:
		"perbasecov on {samplename}"
	shell:
		"""
		cut -f1,2 {input.assembly_info} > {output.header}
		~/tools/bedtools/bedtools-2.30.0/bin/genomeCoverageBed -ibam {input.sortbam} -d -g {output.header} > {output.perbasecov} 2>{log}
		"""


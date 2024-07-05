#map LR from porechop.smk to contigs from flye.smk
rule minimap2:
	input:
		"assembly/flye/{samplename}_assembly/assembly.fasta",
		"porechop/{samplename}_porechop.fastq.gz"
	output:
		"minimap2/{samplename}.sam"
	log:
		"logs/{samplename}_minimap2.log"
	threads:44
	benchmark:
		"benchmarks/{samplename}_minimap2.log"
	message:
		"runninmg minimap2 on {samplename}"
	shell:
		"minimap2-2.24_x64-linux/minimap2 -ax map-ont -a -t {threads} {input} > {output} 2> {log}"



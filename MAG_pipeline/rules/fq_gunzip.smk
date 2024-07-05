#gunzip fastq reads
rule fq_gunzip:
	input:
		"porechop/{samplename}_porechop.fastq.gz"
	output:
		dup="porechop/{samplename}_porechop1.fastq.gz",
		#copy_gunzip="porechop/{samplename}_porechop1.fastq",
		fastq="porechop/{samplename}_porechop.fastq"
		
	log:
		"logs/{samplename}_porechop_gunzip.log"
	benchmark:
		"benchmarks/{samplename}_porechop_gunzip.txt"
	threads:
		44
	message:
		"running gunzip on {samplename} reads"
	shell:
		"""
		cp {input} {output.dup}
		gunzip -c {output.dup} > {output.fastq}
		"""
# #mv {output.copy_gunzip} {output.fastq} >>{log} 2>&1


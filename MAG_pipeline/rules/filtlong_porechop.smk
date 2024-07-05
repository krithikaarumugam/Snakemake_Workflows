#filtlong parameters used in Liu et al 2022 followed by porechop
rule filtlong:
	input:
		"guppy_gpu_hadley/{samplename}_all.fastq"
	output:
		"nanophase/filtlong/{samplename}_filtlong.fastq"
	log:
		"logs/{samplename}_filtlong.log"
	benchmark:
		"benchmarks/{samplename}_filtlong.txt"
	threads:
		44
	message:
		"running filtlong on {samplename}"
	shell:"Filtlong_v0.2.1/bin/filtlong --min_length 1000 --min_mean_q 90 --verbose {input} > {output} 2> {log}"


rule porechop:
	input:
		"nanophase/filtlong/{samplename}_filtlong.fastq"
	output:
		"nanophase/filtlong/{samplename}_filtlong_porechop.fastq"
	log:
		"logs/{samplename}_filtlong_porechop.log"
	benchmark:
		"benchmarks/{samplename}_filtlong_porechop.txt"
	threads:
		44
	message:
		"running porechop on filtlong output on {samplename}"
	shell:"Porechop-0.2.4/porechop-runner.py -i {input} -o {output} --discard_middle -v 3 -t {threads} >{log} 2>&1"


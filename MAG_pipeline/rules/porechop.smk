#porechop on all reads (cat of pass and fail)

rule porechop:
	input:
		"guppy_gpu_hadley/{samplename}_all.fastq"
	output:
		"porechop/{samplename}_porechop.fastq.gz"
	log:
		"logs/{samplename}_porechop.log"
	benchmark:
		"benchmarks/{samplename}_porechop.txt"
	threads:
		44
	message:
		"running porechop on {samplename}"
	shell:"Porechop-0.2.4/porechop-runner.py -i {input} -o {output} --discard_middle -v 3 -t {threads} >{log} 2>&1"


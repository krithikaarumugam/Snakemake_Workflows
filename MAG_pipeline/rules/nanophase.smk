#nanophase - Liu et al 2022
rule nanophase:
	input:
		"nanophase/filtlong/{samplename}_filtlong_porechop.fastq"
	output:
		final="nanophase/{samplename}_nanophase_out_v0.2.3/03-Polishing/nanophase.ont.genome.summary"
	params:
		dir="nanophase/{samplename}_nanophase_out_v0.2.3/"
	log:
		"logs/{samplename}_nanophase_v0.2.3.log"
	benchmark:
		"benchmarks/{samplename}_nanophase_v0.2.3.txt"
	threads:
		44
	conda:
		"../envs/nanophase1.yaml"
	message:
		"running nanophase_v0.2.3 on {samplename}"
	shell:"~/tools/anaconda3-2022.10/envs/nanophase/bin/nanophase meta -l {input} -t {threads} -o {params.dir} > {log} 2>&1"


	


#run flye on reads from porechop.smk
rule flye_assembly:
	input:  
		"porechop/{samplename}_porechop.fastq.gz"
	output:
		assembly="assembly/flye/{samplename}_assembly/assembly.fasta",
		assembly_info="assembly/flye/{samplename}_assembly/assembly_info.txt"
	params:
		dir="assembly/flye/{samplename}_assembly/"
	log:
		"logs/{samplename}_assembly.log"
	benchmark:
		"benchmarks/{samplename}_assembly.txt"
	threads:
		88
	message: "Assembling {samplename} with metaFlye"
	shell:"Flye-2.9.1/bin/flye --nano-hq {input} -o {params.dir} -t {threads} --debug --meta >{log} 2>&1"

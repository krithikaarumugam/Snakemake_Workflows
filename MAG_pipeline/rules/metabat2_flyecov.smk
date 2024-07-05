#run metabat2 but use cov from flye
rule metabat2_flyecov:
	input:
		fasta="assembly/flye/{samplename}_assembly/assembly.fasta",
		cov="assembly/flye/{samplename}_assembly/cov_fromflye.txt"
	output:
		bin1fasta="metabat2/{samplename}_metabat2_flyecov/bins/bin.1.fa"
	params:
		"metabat2/{samplename}_metabat2_flyecov/bins/bin"
	threads:
		44
	log:
		"logs/{samplename}_metabat2flyecov.log"
	benchmark:
		"benchmarks/{samplename}_metabat2flyecov.txt"
	message:
		"running metabat2 (cov fromflye) on {samplename}"
	shell:
		"""
		metabat_v2.12.1/metabat2 -d -t {threads} -m 2000 -v -i {input.fasta} -a {input.cov} --cvExt -o {params} >{log} 2>&1
		"""

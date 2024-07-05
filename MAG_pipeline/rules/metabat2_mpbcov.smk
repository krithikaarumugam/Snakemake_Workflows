#run metabat2 but use cov from bedtools
rule metabat2_mpbcov:
	input:
		fasta="assembly/flye/{samplename}_assembly/assembly.fasta",
		mpbc="minimap2/{samplename}.meanperbasecov"
	output:
		bin1fasta="metabat2/{samplename}_metabat2_mpbcov/bins/bin.1.fa"
	params:
		"metabat2/{samplename}_metabat2_mpbcov/bins/bin"
	threads:
		44
	log:
		"logs/{samplename}_metabat2mpbcov.log"
	benchmark:
		"benchmarks/{samplename}_metabat2mpbcov.txt"
	message:
		"running metabat2 (cov from bedtools) on {samplename}"
	shell:
		"""
		metabat_v2.12.1/metabat2 -d -t {threads} -m 2000 -v -i {input.fasta} -a {input.mpbc} --cvExt -o {params} >{log} 2>&1 
		"""

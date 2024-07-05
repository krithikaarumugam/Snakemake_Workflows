#extract cov from assembly_info.txt
rule flyecov:
	input:
		assembly="assembly/flye/{samplename}_assembly/assembly.fasta",
		assembly_info="assembly/flye/{samplename}_assembly/assembly_info.txt"
	output:
		cov="assembly/flye/{samplename}_assembly/cov_fromflye.txt"
	threads:
		44
	log:
		"logs/{samplename}_flyecov.log"
	benchmark:
		"benchmarks/{samplename}_flyecov.txt"
	message:
		"running cov from flye on {samplename}"
	shell:
		"""
		grep '^>' {input.assembly} | sed -e 's/^>//g' | while read line; do grep -w $line {input.assembly_info} ; done | cut -f1,3 > {output.cov} 2>{log}
		"""

#run checkm on metabat2 bins - cov from flyecov
rule checkm_metabat2_flyecov:
	input:
		"metabat2/{samplename}_metabat2_flyecov/bins/bin.1.fa"
	output:
		#checkm_output="checkm/{samplename}/checkm_metabat2_flyecov/{samplename}.metabat2_flyecov_checkm_lineage_wf",
		checkm_result="checkm/{samplename}/checkm_metabat2_flyecov/{samplename}.metabat2_flyecov.txt",
		checkm_err="checkm/{samplename}/checkm_metabat2_flyecov/{samplename}.metabat2_flyecov.err"
	params:
		checkm_input="metabat2/{samplename}_metabat2_flyecov/bins/",
		checkm_output="checkm/{samplename}/checkm_metabat2_flyecov/{samplename}.metabat2_flyecov_checkm_lineage_wf"
	log:
		"logs/{samplename}_checkm_metabat2_flyecov.log"
	threads:20
	benchmark:
		"benchmarks/{samplename}_checkm_metabat2_flyecov.txt"
	message:
		"checkm on {samplename} - metabat2 bins - cov from flye"
	shell:
		"checkm lineage_wf -t {threads} -x fa {params.checkm_input} {params.checkm_output} >{output.checkm_result} 2> {output.checkm_err}"


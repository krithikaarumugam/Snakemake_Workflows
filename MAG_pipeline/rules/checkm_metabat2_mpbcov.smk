#run checkm on metabat2 bins - mpbcov
rule checkm_metabat2_mpbcov:
	input:
		"metabat2/{samplename}_metabat2_mpbcov/bins/bin.1.fa"
	output:
		#checkm_output="checkm/{samplename}/checkm_metabat2_mpbcov/{samplename}.metabat2_checkm_lineage_wf",
		checkm_result="checkm/{samplename}/checkm_metabat2_mpbcov/{samplename}.metabat2_mpbcov.txt",
		checkm_err="checkm/{samplename}/checkm_metabat2_mpbcov/{samplename}.metabat2_mpbcov.err"
	params:
		checkm_input="metabat2/{samplename}_metabat2_mpbcov/bins/",
		checkm_output="checkm/{samplename}/checkm_metabat2_mpbcov/{samplename}.metabat2_checkm_lineage_wf"
	log:
		"logs/{samplename}_checkm_metabat2_mpbcov.log"
	threads:20
	benchmark:
		"benchmark/{samplename}_checkm_metabat2_mpbcov.txt"
	message:
		"checkm on {samplename} - metabat2 bins - mpbcov" 
	shell:
		"checkm lineage_wf -t {threads} -x fa {params.checkm_input} {params.checkm_output} >{output.checkm_result} 2> {output.checkm_err}"


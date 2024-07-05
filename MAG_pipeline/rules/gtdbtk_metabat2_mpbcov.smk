#run GTDB-tk on bins from metabat2 using mpbcov
rule GTDB_Tk_mpbcov:
	input:
		"metabat2/{samplename}_metabat2_mpbcov/bins/bin.1.fa"
	output:
		"gtdbtk/{samplename}/gtdbtk_metabat2_mpbcov/gtdbtk.bac120.summary.tsv"
	log:
		"logs/{samplename}_gtdbtk_metabat2_mpbcov.log"
	threads:
		40
	params:
		gtdbtk="metabat2/{samplename}_metabat2_mpbcov/bins/",
		out_dir="gtdbtk/{samplename}/gtdbtk_metabat2_mpbcov/"
	benchmark:
		"benchmarks/{samplename}_gtdbtk_metabat2_mpbcov.txt"
	message:
		"GTDB-Tk on {samplename} metabat2 using mpbcov"
	shell:
		"~/tools/anaconda3-2022.10/bin/gtdbtk classify_wf --genome_dir {params.gtdbtk} --out_dir {params.out_dir} --cpus {threads} --pplacer_cpus 1 --debug -x fa > {log} 2>&1 "




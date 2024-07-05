#calculate mean perbase cov from bedtools perbasecov
rule mpbc:
	input:
		pbc="minimap2/{samplename}.perbasecov"
	output:
		mpbc="minimap2/{samplename}.meanperbasecov"
	log:
		"logs/{samplename}_meanperbasecov.log"
	benchmark:
		"benchmarks/{samplename}_meanperbasecov.txt"
	message:
		"meanperbasecov on {samplename}"
	script:
		"scripts/meanperbasecov_THCPIS.R"

perbasecov<-read.table(snakemake@input[['pbc']],sep="\t",header=FALSE,stringsAsFactors=FALSE)
meanperbasecov<-tapply(perbasecov$V3,perbasecov$V1,mean)
meanperbasecov_df<-as.data.frame.table(meanperbasecov,stringsAsFactors=FALSE)
write.table(meanperbasecov_df,file=snakemake@output[['mpbc']],sep="\t",row.names=F,col.names=T,quote = FALSE)


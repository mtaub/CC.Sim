GetHaps <- function( geno.mat ){
  n.sub <- nrow(geno.mat)
  n.snp <- ncol(geno.mat)
  all1 <- ifelse( geno.mat >  0, "2", "1" )
  all2 <- ifelse( geno.mat == 2, "2", "1" )
  allele <- matrix(numeric(), nrow = n.sub, ncol = 2*n.snp )
  allele[,2*seq(0,n.snp-1,1)+1] <- all1
  allele[,2*seq(0,n.snp-1,1)+2] <- all2
  haplo.obj <-haplo.em( geno = allele )
  hap.probs <- haplo.obj$hap.prob
  haps <- haplo.obj$haplotype
  return( list( haps = haps, hap.probs = hap.probs ) )
}

GenotypeProb <- function( p0 = 0.10, beta = 1e-2, p = 0.75 ){
  # p0 is probability of disease when x = 0
  # beta is the effect size
  # p is the major allele frequency
  alpha <- log(p0/(1-p0))
  g <- 0:2
  pdg <- exp(alpha+beta*g)/(1+exp(alpha+beta*g)) # disease probability, given genotype g in (0,1,2)
  phg <- 1 - pdg
  pg <- c( p^2, 2*p*(1-p), (1-p)^2 ) # vector of genotype probabilities
  pgd <- pdg*pg/sum(pdg*pg)
  pgh <- phg*pg/sum(phg*pg)
  return( list( pgd = pgd, pgh = pgh ) )
}


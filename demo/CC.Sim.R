# Welcome to CC.Sim!
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This package is being written to help simulate case control data for
# use at the JHSPH Dept. of Biostats.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


data("sample")
causal.index <- 13
#geno.mat <-
  
# Simulated genotype matrix used for LD structure
#n.sub <- 1e3; n.snp <- 5; causal.index <- 3;
#geno.mat <- matrix( sample( 0:2, size = n.sub*n.snp, replace = TRUE ), nrow = n.sub, ncol = n.snp )

# Simulation parameters
p0 <- 0.10 # probability of disease given homo major
beta <- 10 # "effect size"
p <- 0.75 # major allele frequency

problist <- GenotypeProb(p0 = p0, beta = beta, p = p)
pgd <- problist$pgd # probability of genotype, given disease
pgh <- problist$pgh # probability of genotype, given healthy

hapslist <- GetHaps( geno.mat = geno.mat)
haps <- hapslist$haps
hap.probs <- hapslist$hap.probs

# Simulate Case-Control data set with 10 of each
CC.Sim( pgd = pgd, pgh = pgh, haps = haps, hap.probs = hap.probs, causal.index = causal.index, size = 10 )

CC.Sim <- function( pgd, pgh, haps, hap.probs, causal.index, size ){
  with <-    (1:length(hap.probs))[haps[,causal.index]=="2"]
  without <- (1:length(hap.probs))[haps[,causal.index]=="1"]
  probs.with <- hap.probs[with]/sum(hap.probs[with])
  probs.without <- hap.probs[without]/sum(hap.probs[without])
  # 100 diseased subject
  diseased.sim <- t(sapply( sample( 0:2, size = size, prob = pgd, replace = TRUE ), "SimGtype", with=with, without=without, probs.with=probs.with, probs.without=probs.without ))
  # 100 helathy subject
  healthy.sim <- t(sapply( sample( 0:2, size = size, prob = pgh, replace = TRUE ), "SimGtype", with=with, without=without, probs.with=probs.with, probs.without=probs.without ))
  return( list( diseased.sim = diseased.sim, healthy.sim = healthy.sim ) )
}

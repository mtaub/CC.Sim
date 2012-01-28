SimGtype <- function( causal.gtype, with, without, probs.with, probs.without ){
  if( causal.gtype == 0 ){
    haps.index <- sample( without, size = 2, prob = probs.without, replace = TRUE )
  }else if( causal.gtype == 1 ){
    haps.index <- c( sample( without, size = 1, prob = probs.without, replace = TRUE ), sample( with, size = 1, prob = probs.with, replace = TRUE ) )
  }else if (causal.gtype == 2 ){
    haps.index <- sample( with, size = 2, prob = probs.with, replace = TRUE )
  }
  gtype.sim <- colSums(matrix(as.numeric(as.matrix(haps[haps.index,])), byrow = FALSE, nrow = 2 )) - 2
  return(gtype.sim)
}

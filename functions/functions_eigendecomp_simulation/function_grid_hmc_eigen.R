# function to calibrate epsilon and L

f.grid_hmc_eigen <- function(Sigma, vec.epsilon, vec.L, v, s, big_M, lambda){
  list.results <- list()
  for(i.epsilon in 1:length(vec.epsilon)){
    epsilon = vec.epsilon[i.epsilon]
    print(paste("epsilon =",epsilon))
    for(i.L in 1:length(vec.L)){
      L = vec.L[i.L]
      print(paste("L =",L))
      test_output <- list(c(f.HMC_simulation_eigenvalues(big_M, epsilon, L, v, s, lambda), epsilon, L))
      list.results <- c(list.results, test_output)
    }
  }
  save(list.results, file=paste("inter_output_epsilon", vec.epsilon, "_v",v,"_s",s,".Rda", sep=""))
  return(list.results)
}
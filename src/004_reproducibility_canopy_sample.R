# reproducitbility of flight 04 canopy sample

orthos = readRDS(paste0(envrmt$level1_rgb, "/flight04_canopy_sample_25.RDS"))
combs = t(combn(1:25,2))



cl = makeForkCluster(cores)
doParallel::registerDoParallel(cl)

foreach(i = seq(nrow(combs))) %dopar% {

  res = corLocal(orthos[[combs[i,1]]], orthos[[combs[i,2]]])
  writeRaster(res, paste0(envrmt$results, "/flight04_25_canopy_correlation/correlation_", combs[i,1], "_",combs[i,2], ".tif"))

}

stopCluster(cl)

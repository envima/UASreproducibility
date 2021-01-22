# reproducibility time series canopy 02

orthos = readRDS(paste0(envrmt$level1_rgb), "timeseries_canopy_sample.RDS")

# flights through different combinations
combs = rbind(t(combn(1:5,2)), t(combn(6:10,2)), t(combn(11:15,2)),
              t(combn(16:20,2)), t(combn(21:25,2)), t(combn(26:30,2)))


cl = makeForkCluster(cores)
doParallel::registerDoParallel(cl)


correlations = foreach(i = seq(nrow(combs))) %dopar% {
  res = corLocal(orthos[[combs[i,1]]], orthos[[combs[i,2]]])
  names(res) = paste0(combs[i,1], "_", combs[i,2])
  return(res)
}
stopCluster(cl)

tsCors = do.call(stack, correlations)
writeRaster(tsCors, paste0(envrmt$timeseries_correlation, "/time_series_correlations.tif"))

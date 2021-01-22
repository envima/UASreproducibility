# plot time series correlation


correlations = stack(paste0(envrmt$timeseries_correlation, "/time_series_correlations.tif"))

chunks = split(seq(1,60), ceiling(seq_along(seq(1,60))/10))

cors = purrr::map(chunks, function(x){
  sum(correlations[[x]] > 0.95)
})



ggCors = purrr::map(cors, function(x){
  ggR(x, geom_raster = TRUE)+
    scale_fill_gradientn(name = "n (<0.95)",colors = viridis(25, direction = 1))+
    scale_x_continuous(name = "Longitude", expand = c(0,0))+
    scale_y_continuous(name = "Latitude", expand = c(0,0), n.breaks = 3)+
    theme(panel.background = element_blank(), panel.grid = element_line(color = "grey80"),
          axis.text.y = element_text(angle = 90, hjust = 0.5), legend.position = "none")

})

ggCors

corsAll = sum(correlations > 0.95)

ggAll = ggR(corsAll, geom_raster = TRUE)+
  scale_fill_gradientn(name = "n = 6*10",colors = viridis(25, direction = 1))+
  scale_x_continuous(name = "Longitude", expand = c(0,0))+
  scale_y_continuous(name = "Latitude", expand = c(0,0), n.breaks = 3)+
  theme(panel.background = element_blank(), panel.grid = element_line(color = "grey80"),
        axis.text.y = element_text(angle = 90, hjust = 0.5),  legend.position = "bottom")

ggpubr::ggarrange(plotlist = ggCors, labels = paste0("flight0", seq(6)))
ggsave("results/canopy02_timeseries_correlation.svg", height = 40, width = 50, units = "cm")

# correlation vis

# plot the 300 correlation layers
cors = stack(list.files(paste0(envrmt$results, "/flight04_25_canopy_correlation"), pattern = ".tif$", full.names = TRUE))

cors_bool = purrr::map(seq(300), function(x){
  return(cors[[x]] > 0.95)
})

cors_bool = stack(cors_bool)
cors_sum = sum(cors_bool)


ggCor = ggR(cors_sum, geom_raster = TRUE)+
  scale_fill_gradientn(name = "n (<0.95)",colors = viridis(300, direction = 1))+
  scale_x_continuous(name = "Longitude", expand = c(0,0))+
  scale_y_continuous(name = "Latitude", expand = c(0,0), n.breaks = 3)+
  theme(panel.background = element_blank(), panel.grid = element_line(color = "grey80"),
        axis.text.y = element_text(angle = 90, hjust = 0.5), legend.position = "bottom")

ggsave(filename = paste0(envrmt$figures, "canopy_sample_correlation_25.pdf"), plot = ggCor, device = "pdf")


# plot the subset with only 10 correlation layers


fls = paste0(envrmt$results, "/flight04_25_canopy_correlation/correlation_", combn(1:5,2)[1,], "_", combn(1:5,2)[2,], ".tif")
cors = stack(fls)

cors_bool = purrr::map(seq(nlayers(cors)), function(x){
  return(cors[[x]] > 0.95)
})

cors_bool = stack(cors_bool)
cors_sum = sum(cors_bool)


ggCor = ggR(cors_sum, geom_raster = TRUE)+
  scale_fill_gradientn(name = "n (<0.95)",colors = viridis(300, direction = 1))+
  scale_x_continuous(name = "Longitude", expand = c(0,0))+
  scale_y_continuous(name = "Latitude", expand = c(0,0), n.breaks = 3)+
  theme(panel.background = element_blank(), panel.grid = element_line(color = "grey80"),
        axis.text.y = element_text(angle = 90, hjust = 0.5), legend.position = "bottom")

ggsave(filename = paste0(envrmt$figures, "canopy_sample_correlation_10.pdf"), plot = ggCor, device = "pdf")




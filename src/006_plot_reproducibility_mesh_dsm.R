# plot the reproducibility of mesh and dsm based orthomosaics

seam = st_read(paste0(envrmt$areas, "/forest_mask.gpkg"))
dsm = stack(paste0(envrmt$mesh_dsm_correlation, "/flight04_correlation_DSM.tif"))
mesh = stack(paste0(envrmt$mesh_dsm_correlation, "/flight04_correlation_mesh.tif"))

dsm_bool = dsm > 0.95
mesh_bool = mesh > 0.95

dsm = sum(dsm_bool)
mesh = sum(mesh_bool)

mesh = crop(mesh, seam)
dsm = crop(dsm, seam)

ggdsm = ggR(dsm, geom_raster = TRUE)+
  scale_fill_gradientn(name = "n = 10",colors = viridis(25, direction = 1), na.value = "transparent")+
  scale_x_continuous(name = "Longitude", expand = c(0,0), breaks = c(8.899,8.9,8.901,8.902,8.903))+
  scale_y_continuous(name = "Latitude", expand = c(0,0), n.breaks = 3)+
  theme(panel.background = element_blank(), panel.grid = element_line(color = "grey80"),
        axis.text.y = element_text(angle = 90, hjust = 0.5), legend.position = "bottom")

ggdsm
ggsave(filename = paste0(envrmt$figures, "/reproducibility_dsm.pdf"), ggdsm)

ggmesh = ggR(mesh, geom_raster = TRUE)+
  scale_fill_gradientn(name = "n = 10",colors = viridis(25, direction = 1), na.value = "transparent")+
  scale_x_continuous(name = "Longitude", expand = c(0,0), breaks = c(8.899,8.9,8.901,8.902,8.903))+
  scale_y_continuous(name = "Latitude", expand = c(0,0), n.breaks = 3)+
  theme(panel.background = element_blank(), panel.grid = element_line(color = "grey80"),
        axis.text.y = element_text(angle = 90, hjust = 0.5), legend.position = "bottom")

ggsave(filename = paste0(envrmt$figures, "/reproducibility_mesh.pdf"), ggmesh)

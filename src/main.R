#' Main control script
#'
#' @description Use this script for controlling the processing.
#'
#' @author [Marvin Ludwig], [marvin.ludwig@geo.uni-marburg.de]
#'

library(envimaR)

if (Sys.info()[["nodename"]] == "marvinpc") {
  root_folder = "/home/marvin/temp/UASrepro/"
}
source(paste0(root_folder, "/src/functions/000_setup.R"))

# set control flags
compute_reproducibilities = FALSE # takes a long time!


# plots
plot_reprojectionError = FALSE
plot_reproducibility_canopy_sample = FALSE
plot_reproducibility_dsm_mesh = FALSE
plot_reproducibility_timeseries = FALSE


# specify available cores for parallel processing (in some functions)
# set to 1 if you do not want to process in paralell
cores = 4

# processing

if(plot_reprojectionError) source(paste0(envrmt$src, "/001_plot_reprojection_vs_checkpoint.R"))
if(plot_reprojectionError) source(paste0(envrmt$src, "/002_plot_reprojection_vs_npoints.R"))
# 003 includes large files and is not included in this workflow demo

if(compute_reproducibilities) source(paste0(envrmt$src, "/004_reproducibility_canopy_sample.R"))
if(plot_reproducibility_canopy_sample) source(paste0(envrmt$src, "/005_plot_reproducibility_canopy_sample.R"))
if(plot_reproducibility_dsm_mesh) source(paste0(envrmt$src, "/006_plot_reproducibility_mesh_dsm.R"))
if(compute_reproducibilities) source(paste0(envrmt$src, "/007_reproducibility_time_series.R"))
if(plot_reproducibility_timeseries) source(paste0(envrmt$src, "/008_plot_time_series_reprodcibility.R"))


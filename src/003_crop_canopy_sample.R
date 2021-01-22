# rgb crop flight 04


# load the rgbs
fls = list.files(paste0(envrmt$forest_flight04_25), pattern = ".tif$", full.names = TRUE)


# load the canopy snippet
seam = st_read(paste0(envrmt$areas, "/sample_areas.gpkg")) %>%
  filter(label == "canopy02") %>%
  st_transform(4326)

# use rgb1 as a reference for the others

rgb1 = stack(fls[1])
rgb1 = crop(rgb1, seam)

rgb = purrr::map(fls, function(f){
    print(f)
    cur = stack(f)
    cur = crop(cur, seam)
    cur = projectRaster(cur, rgb1)
    return(cur)
})


saveRDS(rgb, paste0(envrmt$level1, "/rgb/flight04_canopy_sample_25.RDS"))

# same thing with time series
#----------------------------------------

fls = list.files(paste0(envrmt$forest_flights), pattern = ".tif$", full.names = TRUE)


# load the canopy snippet
seam = st_read(paste0(envrmt$areas, "/sample_areas.gpkg")) %>%
  filter(label == "canopy02") %>%
  st_transform(4326)

# use rgb1 as a reference for the others

rgb1 = stack(fls[1])
rgb1 = crop(rgb1, seam)

rgb = purrr::map(fls, function(f){
  print(f)
  cur = stack(f)
  cur = crop(cur, seam)
  cur = projectRaster(cur, rgb1)
  return(cur)
})


saveRDS(rgb, paste0(envrmt$level1, "/rgb/timeseries_canopy_sample.RDS"))




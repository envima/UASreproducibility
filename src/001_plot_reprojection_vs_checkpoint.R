# iterative point cloud optimization for flight 04

# load data


a = purrr::map_dfr(list.files(paste0(envrmt$all_flights_iterative_RE), full.names = TRUE), function(i){
  cbind(markerError(i), markerLabelRE(i))
})


error = a %>%
  group_by(enabled, RE, flight) %>%
  summarize(XY = rmse(c(X_error, Y_error)), Z = rmse(Z_error))
error$enabled = as.factor(error$enabled)


error = error[error$RE != 0,]
error = error[error$RE < 2,]



error$RE <- as.factor(error$RE)
error$RE = fct_rev(error$RE)

# best error
e = error %>% filter(enabled == 0) %>% group_by(RE) %>% summarise(xy = mean(XY))


# create plot RE error
p = ggplot(error[error$enabled == 0,], aes(x = RE, y = XY))+
  scale_y_continuous(name = "Horizontal Checkpoint Error [m]", trans = "log10")+
  xlab("Reprojection Error [m]")+
  geom_boxplot()+
  geom_boxplot(data = error[error$enabled == 0 & error$RE == 0.4,], mapping = aes(x = RE, y = XY), color = "orangered2")+
  theme(panel.background = element_blank(), panel.grid.major.y = element_line(color = "grey70"),
        panel.grid.major.x = element_blank())


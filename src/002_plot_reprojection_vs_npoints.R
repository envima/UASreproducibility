# plot point number vs reprojection error

# load pointclouds
fls = list.files(envrmt$all_flights_iterative_RE_pointclouds, full.names = TRUE)

# define breaks and meta information
breaks = c(1.4, 1.2, 1, 0.8, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1, 0.05, 0.02)
flight = rep(1:6, each = 2)
process = rep(1:2, 6)

# iteratively filter point numbers based on breaks
npoint_df = purrr::map_dfr(seq(length(fls)), function(i){
  pc = read.csv(fls[i])
  res = purrr::map_dfr(breaks, function(b){
    return(
      data.frame(RE = b,
                 npoints = sum(pc$RE < b),
                 flight = flight[i],
                 process = process[i])
      )
  })
  return(res)
})

# some formating
npoint_df$RE = as.factor(npoint_df$RE)
npoint_df$RE = fct_rev(npoint_df$RE)

# plot n points vs reprojection error
ggplot(npoint_df, aes(x = RE, y = npoints, group = RE))+
  geom_boxplot()+
  scale_y_continuous(name = "Number of points [x1000]", labels = function(l){l / 1000})+
  xlab("Reprojection Error [m]")+
  theme(panel.background = element_blank(), panel.grid.major.y = element_line(color = "grey70"),
        panel.grid.major.x = element_blank())

#' Load marker error
#' 
#' @details reads and formats a Metashape error export
#' 
#' @param markerExport a txt or csv of marker errors
#' 
#' @return data.frame
#' 
#' 
#' 


markerError <- function(markerExport){
  
  m = read.csv(markerExport, header = TRUE, skip = 1)
  # delete last row
  m = m[-nrow(m),]
  
  
  colnames(m) = c("label", "enabled",
                  "X", "Y", "Z",
                  "X_acc", "Y_acc", "Z_acc",
                  "X_est", "Y_est", "Z_est",
                  "X_error", "Y_error", "Z_error")
  

  return(m)
  
}

#' Label RE error
#' @detais gives details about an RE error file based on the filename

markerLabelRE <- function(markerExport){
  
  
  me = unlist(strsplit(basename(markerExport), "_"))
  
  return(
    data.frame(
      flight = me[3],
      process = me[4],
      npoints = as.numeric(me[5]),
      RE = as.numeric(me[6])
      
    )
  )
}



#' Label Error
#' @details gives details about an stage01 error file based on filename



markerLabel <- function(markerExport){
  
  me = unlist(strsplit(basename(markerExport), "_"))
  
  return(
    data.frame(
      flight = me[3],
      process = me[4],
      RU = as.numeric(me[5]),
      RE = as.numeric(me[6]),
      PA = as.numeric(me[7])
    )
  )
  
  
  
}


#' Root mean squared error
#' @details RMSE

rmse = function(error){
  return(sqrt(mean(error^2, na.rm = TRUE)))
}





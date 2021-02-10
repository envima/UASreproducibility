##  Quality assessment of photogrammetric methods - A workflow for reproducible UAS orthomosaics

This repository contains additional material, data and scripts for the publication 
[Ludwig et. al 2020: Quality assessment of photogrammetric methods - A workflow for reproducible UAS orthomosaics](https://www.mdpi.com/2072-4292/12/22/3831)

### flightplan

Contains the necessary data and script in order to reproduce the UAS flight planning.

Contains the MAVLINK protocol which was used to control the UAS.


### data / level0

Contains images of six consecutive flights taken with a drone of a small forest near Wolfskaute.

Contains polygons of the forest extend and some sample areas.

Contains the measured ground control points.

### data / level1

Contains checkpoint errors of each flight processed with iterative tiepoint filtering.

Contains the unfiltered tiepoints of each flight.

Contains checkpoint errors of 5 identical computations of each flight with a reprojection error filter of 0.4.

Contains the RGB orthomosaic time series of a small sample area.

### data / results

Contains the reproducibility of flight 4 using 25 computations.

Contains the reproducibility of the RGB orthomosaic time series using 5 computations.

Contains the comparison of the reproducibility of DSM and mesh based orthomosaics.



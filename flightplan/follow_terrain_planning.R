# This script refines the flight planning from Qgroundcontrol
# by adjusting the altitude based on the provided Digital Surface Model

library(uavRmp)

uavRmp::makeAP(projectDir = "./", locationName = "wolfskaute",
               surveyArea = "qgorundcontrol/initial_planning.plan", useMP = TRUE,
               demFn = "dem/wolfskaute_dsm_1m.tif", followSurface = TRUE,
               followSurfaceRes = 3, altFilter = .75, maxSpeed = 40, picRate = 2, windCondition = 1, maxFlightTime = 80)






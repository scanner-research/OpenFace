find_package(dlib REQUIRED)

# Compute paths
get_filename_component(OpenFace_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(OpenFace_INSTALL_PATH "@CONF_INSTALL_PATH@" REALPATH)

set(OpenFace_INCLUDE_DIRS
  "${OpenFace_INSTALL_PATH}/include"
  "${OpenFace_INSTALL_PATH}/include/OpenFace"
  "${dlib_INCLUDE_DIRS}")

find_library(OpenFace_LIBRARIES
  FaceAnalyser
  LandmarkDetector
  HINTS ${OpenFace_INSTALL_PATH}/lib)
set(OpenFace_LIBRARIES ${OpenFace_LIBRARIES} "${dlib_LIBRARIES}")

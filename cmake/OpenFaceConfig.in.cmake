find_package(dlib REQUIRED)
find_package(Boost 1.5.9 REQUIRED COMPONENTS filesystem system)

# Compute paths
get_filename_component(OpenFace_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(OpenFace_INSTALL_PATH "@CONF_INSTALL_PATH@" REALPATH)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${OpenFace_INSTALL_PATH}/lib/cmake")
find_package(TBB REQUIRED)

set(OpenFace_INCLUDE_DIRS
  "${OpenFace_INSTALL_PATH}/include"
  "${OpenFace_INSTALL_PATH}/include/OpenFace"
  "${dlib_INCLUDE_DIRS}")

find_library(FaceAnalyzer_LIBRARY FaceAnalyser
  HINTS ${OpenFace_INSTALL_PATH}/lib)
find_library(LandmarkDetector_LIBRARY LandmarkDetector
  HINTS ${OpenFace_INSTALL_PATH}/lib)
set(OpenFace_LIBRARIES
  "${FaceAnalyzer_LIBRARY}"
  "${LandmarkDetector_LIBRARY}"
  "${dlib_LIBRARIES}"
  "${Boost_LIBRARIES}"
  "${TBB_LIBRARIES}")

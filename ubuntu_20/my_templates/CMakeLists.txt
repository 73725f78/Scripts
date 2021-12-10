cmake_minimum_required(VERSION 3.18)

project(Main VERSION 0.1.0)

include(GNUInstallDirs)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

#Project version, etc.
configure_file(aes/include/config.h.in config.h)

#find_package(Poco REQUIRED COMPONENTS Foundation Util)

#include(FetchContent)
########################################### gtests
#option(INSTALL_GTEST "" OFF)  # prevent installing gtest with rest of project
#FetchContent_Declare(
  #googletest
  #GIT_REPOSITORY https://github.com/google/googletest.git
  #GIT_TAG        release-1.10.0
#)

#FetchContent_GetProperties(googletest)
#if(NOT googletest_POPULATED)
  #FetchContent_Populate(googletest)
  #add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})
#endif()

#message("gtests directories: ${googletest_SOURCE_DIR} ${googletest_BINARY_DIR}")
########################################### END gtests

#add_subdirectory(aes)
#add_subdirectory(tests)

#Pack configurations
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR amd64)
set(CPACK_SET_DESTDIR true)
set(CPACK_INSTALL_PREFIX /usr/local)
set(CPACK_PACKAGE_VENDOR "Luis")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "lrodriguez") #required
set(CPACK_DEBIAN_PACKAGE_ARCHITECTURE ${CMAKE_SYSTEM_PROCESSOR})
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_GENERATOR DEB)
include(CPack)


################################ Subdir
#add_library(libaes)

#target_sources(libaes
    #PRIVATE 
	#${CMAKE_CURRENT_SOURCE_DIR}/src/AES.cpp
	#${CMAKE_CURRENT_SOURCE_DIR}/src/Permutation.cpp
#)

#target_include_directories(libaes
    #PUBLIC
	#${CMAKE_CURRENT_SOURCE_DIR}/include/
	#${PROJECT_BINARY_DIR}
#) 

#target_link_libraries(libaes
	##pthread
    ##nnxx::nnxx 
	##protobuf::libprotobuf
	#Poco::Foundation 
	#Poco::Util
#)

##============================================
#configure_file(${CMAKE_CURRENT_SOURCE_DIR}/src/logger.properties aes.properties COPYONLY)

#add_executable(aes
	#${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp
#)

#target_include_directories(aes
    #PUBLIC
	#${CMAKE_CURRENT_SOURCE_DIR}/include/
#)

#target_link_libraries(aes
	#libaes
#)

##============================================
#add_custom_target(run
	#COMMAND aes -i ${CMAKE_CURRENT_SOURCE_DIR}/src/logger.properties
	#WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
	#COMMENT "==============================> Main ${CMAKE_CURRENT_SOURCE_DIR}"
#)

##I think BINDIR is configured by GNUInstallDirs
##https://cmake.org/cmake/help/v3.0/module/GNUInstallDirs.html
#install(TARGETS aes DESTINATION ${CMAKE_INSTALL_BINDIR})
#install(FILES ${CMAKE_CURRENT_BINARY_DIR}/aes.properties DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT config)


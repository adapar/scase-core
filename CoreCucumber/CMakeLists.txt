cmake_minimum_required(VERSION 2.8.9)

project(CoreCucumber)

set(SCASE_CORE_BASE_PATH ..)
set(SCASE_CORE_APP_INCLUDE_PATH ${SCASE_CORE_BASE_PATH}/CoreApp)
set(SCASE_CORE_LIB_INCLUDE_PATH ${SCASE_CORE_BASE_PATH}/CoreLib)
set(SCASE_CORE_BUILD_PATH ${SCASE_CORE_BASE_PATH}/builds/Release)

message(STATUS "CONTAINER_PROJECT_BASE_PATH:  " ${CONTAINER_PROJECT_BASE_PATH})

link_directories(${SCASE_CORE_BUILD_PATH}/CoreLib)
include_directories(${SCASE_CORE_APP_INCLUDE_PATH} ${SCASE_CORE_LIB_INCLUDE_PATH})

#
# Generic Compiler Flags
#

if(CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Weffc++")
    # TODO: A better fix should handle ld's --as-needed flag
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Xlinker '--no-as-needed'")
elseif(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DNOMINMAX") # exclude M$ min/max macros
    #set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /analyze")
endif()

#
# Boost
#

if(MSVC11)
    # Boost 1.51 fixed a bug with MSVC11
    message(STATUS "Forcing Boost 1.51+ on MSVC11")
    set(BOOST_MIN_VERSION "1.51")
else()
    set(BOOST_MIN_VERSION "1.40")
endif()

set(CUKE_CORE_BOOST_LIBS thread system regex date_time)
if(NOT CUKE_DISABLE_BOOST_TEST)
    set(CUKE_TEST_BOOST_LIBS unit_test_framework)
endif()

if(CUKE_USE_STATIC_BOOST)
    set(CUKE_STATIC_BOOST_LIBS ${CUKE_CORE_BOOST_LIBS})
    # "An external test runner utility is required to link with dynamic library" (Boost User's Guide)
    set(CUKE_DYNAMIC_BOOST_LIBS ${CUKE_TEST_BOOST_LIBS})
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DBOOST_TEST_DYN_LINK")

    if(NOT MSVC)
        find_package(Threads)
        set(CUKE_EXTRA_LIBRARIES ${CUKE_EXTRA_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
    endif()
else()
    set(CUKE_DYNAMIC_BOOST_LIBS ${CUKE_CORE_BOOST_LIBS} ${CUKE_TEST_BOOST_LIBS})
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DBOOST_ALL_DYN_LINK")
endif()

if(CUKE_STATIC_BOOST_LIBS)
    set(Boost_USE_STATIC_LIBS ON)
    find_package(Boost ${BOOST_MIN_VERSION} COMPONENTS ${CUKE_STATIC_BOOST_LIBS})
endif()

if(CUKE_DYNAMIC_BOOST_LIBS)
    set(Boost_USE_STATIC_LIBS OFF)
    find_package(Boost ${BOOST_MIN_VERSION} COMPONENTS ${CUKE_DYNAMIC_BOOST_LIBS})
endif()

if(Boost_FOUND)
    include_directories(${Boost_INCLUDE_DIRS})
    set(CUKE_EXTRA_LIBRARIES ${CUKE_EXTRA_LIBRARIES} ${Boost_THREAD_LIBRARY} ${Boost_SYSTEM_LIBRARY} ${Boost_REGEX_LIBRARY} ${Boost_DATE_TIME_LIBRARY})
endif()

set(CUKE_LIBRARIES cucumber-cpp ${CUKE_EXTRA_LIBRARIES})

find_package(Qt5 COMPONENTS core gui test xml multimedia widgets)

if(Qt5_FOUND)
    set(SCASE_CORE_HEADERS ${SCASE_CORE_APP_INCLUDE_PATH}/mainwindow.h)
    qt5_wrap_cpp(SCASE_CORE_HEADERS_MOC ${SCASE_CORE_HEADERS})
    include_directories(${Qt5Core_INCLUDE_DIRS} ${Qt5Gui_INCLUDE_DIRS} ${Qt5Test_INCLUDE_DIRS} ${Qt5Xml_INCLUDE_DIRS} ${Qt5Multimedia_INCLUDE_DIRS} ${Qt5Widgets_INCLUDE_DIRS})
    set(QT_LIBRARIES ${Qt5Core_LIBRARIES} ${Qt5Gui_LIBRARIES} ${Qt5Test_LIBRARIES} ${Qt5Xml_LIBRARIES} ${Qt5Multimedia_LIBRARIES} ${Qt5Widgets_LIBRARIES})
    add_library(CoreAppCucumberLib ${SCASE_CORE_APP_INCLUDE_PATH}/mainwindow ${SCASE_CORE_HEADERS_MOC})

    if(Boost_UNIT_TEST_FRAMEWORK_FOUND)
        include_directories(${Boost_INCLUDE_DIRS})
        add_executable(BoostSCASECoreAppSteps features/step_definitions/BoostSCASECoreAppSteps)
        target_link_libraries(BoostSCASECoreAppSteps CoreAppCucumberLib CoreLib ${Boost_UNIT_TEST_FRAMEWORK_LIBRARY} ${CUKE_LIBRARIES} ${QT_LIBRARIES})
    endif()

    set(SCASE_CORE_SOURCES ${SCASE_CORE_APP_INCLUDE_PATH}/main.cpp ${SCASE_CORE_APP_INCLUDE_PATH}/mainwindow.cpp)
    add_executable(CoreApp ${SCASE_CORE_SOURCES} ${SCASE_CORE_HEADERS_MOC})
    target_link_libraries(CoreApp ${QT_LIBRARIES} CoreLib)
endif()

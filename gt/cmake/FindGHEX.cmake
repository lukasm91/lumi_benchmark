include(FindPackageHandleStandardArgs)

if(NOT GHEX_INCLUDE_DIR)
  find_path(GHEX_INCLUDE_DIR ghex/communication_object.hpp ${GHEX_INCLUDEDIR})
endif()

set(GHEX_INCLUDE_DIRS ${GHEX_INCLUDE_DIR})

find_package_handle_standard_args(GHEX
  REQUIRED_VARS GHEX_INCLUDE_DIR)


if(GHEX_FOUND)
  if(NOT TARGET GHEX::ghex)
    add_library(GHEX::ghex INTERFACE IMPORTED)
    set_target_properties(GHEX::ghex PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${GHEX_INCLUDE_DIRS})
  endif()
endif()

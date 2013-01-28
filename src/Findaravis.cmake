
include(LibFindMacros)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(aravis_PKGCONF aravis-0.2)

# Include dir
find_path(aravis_INCLUDE_DIR
	NAMES 
	arv.h
	PATHS 
	${aravis_PKGCONF_INCLUDE_DIRS} 
	/usr/local/include
	/usr/local/include/aravis-0.2
	/usr/include 
	/usr/include/aravis-0.2
)

# Finally the library itself
find_library(aravis_LIBRARY
	NAMES 
	libaravis-0.2
	aravis
	aravis-0.2
	libaravis
	PATHS 
	${aravis_PKGCONF_LIBRARY_DIRS}
	/usr/local/lib
	/usr/lib
)

# Set the include dir variables and the libraries and let libfind_process do the rest.
# NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(aravis_PROCESS_INCLUDES aravis_INCLUDE_DIR aravis_INCLUDE_DIRS)
set(aravis_PROCESS_LIBS aravis_LIBRARY aravis_LIBRARIES)
libfind_process(aravis)


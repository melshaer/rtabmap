# - Find Freenect alias libfreenect
# This module finds an installed Freenect package.
#
# It sets the following variables:
#  Freenect_FOUND       - Set to false, or undefined, if Freenect isn't found.
#  Freenect_INCLUDE_DIRS - The Freenect include directory.
#  Freenect_LIBRARIES     - The Freenect library to link against.

FIND_PATH(Freenect_INCLUDE_DIRS libfreenect.hpp PATH_SUFFIXES libfreenect)

FIND_LIBRARY(Freenect_LIBRARY NAMES freenect)
FIND_LIBRARY(Freenect_sync_LIBRARY NAMES freenect_sync)

IF (Freenect_INCLUDE_DIRS AND Freenect_LIBRARY AND Freenect_sync_LIBRARY)
   SET(Freenect_FOUND TRUE)
ENDIF (Freenect_INCLUDE_DIRS AND Freenect_LIBRARY AND Freenect_sync_LIBRARY)

IF (Freenect_FOUND)
   # show which Freenect was found only if not quiet
   SET(Freenect_LIBRARIES ${Freenect_LIBRARY} ${Freenect_sync_LIBRARY})
   IF (NOT Freenect_FIND_QUIETLY)
      MESSAGE(STATUS "Found Freenect")
   ENDIF (NOT Freenect_FIND_QUIETLY)
ELSE (Freenect_FOUND)
   # fatal error if Freenect is required but not found
   IF (Freenect_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "Could not find Freenect (libfreenect)")
   ENDIF (Freenect_FIND_REQUIRED)
ENDIF (Freenect_FOUND)


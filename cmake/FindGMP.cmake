# Locate GMP library
# This module defines
#   GMP_FOUND
#   GMP_INCLUDE_DIR
#   GMP_LIBRARY

find_path(GMP_INCLUDE_DIR NAMES gmp.h)
find_library(GMP_LIBRARY NAMES gmp libgmp)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GMP DEFAULT_MSG GMP_INCLUDE_DIR GMP_LIBRARY)

mark_as_advanced(GMP_INCLUDE_DIR GMP_LIBRARY)
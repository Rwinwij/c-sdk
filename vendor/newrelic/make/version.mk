
# Jenkins provides the current build number via the BUILD_NUMBER
# environment variable. If it's not defined (e.g. we're not running
# under Jenkins), fallback to a sensible default.
ifeq ($(strip $(BUILD_NUMBER)),)
  BUILD_NUMBER = 0
endif

# Compose the final version number. The first three segments
# (MAJOR.MINOR.PATCH) are the contents of the VERSION file. The final
# segment is the build number contained in BUILD_NUMBER. Its value
# typically comes from the environment and is set by Jenkins.
AGENT_VERSION := $(shell cat $$(git rev-parse --show-toplevel)/VERSION).$(BUILD_NUMBER)

# Jenkins provides the SHA for HEAD in the GIT_COMMIT environment
# variable. If it's not defined, compute it ourselves.
ifeq ($(strip, $(GIT_COMMIT)),)
  GIT_COMMIT := $(shell git rev-parse --short=12 HEAD)
endif

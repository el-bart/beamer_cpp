#
# Trivial Project Makefile
#
# this file is trivial build, that compiles every source in a given directory
# to a single executable. all flags are added in-place, via config.mk file
# (optional). this makefile is available on BSD license. this is a part of
# "build_process" package:
# http://www.baszerr.eu, prjs -> build_process.
#

APP  := main.out
SRCS := $(wildcard *.cpp)
OBJS := $(SRCS:.cpp=.o)
DEPS := $(SRCS:.cpp=.d)

CXXFLAGS := -Wall -std=c++1y

-include config.mk

# lave secondary targets in place
.SECONDARY:

.PHONY: all
all: $(APP)

$(APP): $(OBJS) Makefile
	$(CXX) $(CXXFLAGS) -o "$@" $(OBJS)

%.o: %.cpp Makefile
	$(CXX) $(CXXFLAGS) -MD -c "$<"

Makefile: config.mk
	touch "$@"

config.mk:
	touch "$@"

-include $(DEPS)

.PHONY: clean
clean:
	rm -fv $(DEPS) $(OBJS) $(APP)

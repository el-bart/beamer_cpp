INLS := $(wildcard *.inl)
HDRS := $(wildcard *.hpp)
SRCS := $(HDRS:.hpp=.cpp)
OBJS := $(SRCS:.cpp=.oxx)

.SECONDARY:

CXX      := g++
CXXFLAGS += -std=c++1y
CXXFLAGS += -Wall -Werror
CXXFLAGS += -Wno-unused-but-set-variable
CXXFLAGS += -Wno-unused-variable

.PHONY: all
all: $(OBJS)

%.oxx: %.cpp Makefile
	@echo "CXX $<"
	@$(CXX) $(CXXFLAGS) -c -o $@ $<

# note: CPP file will be removed as a secondary target, which is good, as we do not want them under VCS...
%-m.cpp: %-m.hpp HEADER.inl FOOTER.inl Makefile
	@echo "MODULE $@"
	@cat HEADER.inl $< FOOTER.inl > $@

# note: CPP file will be removed as a secondary target, which is good, as we do not want them under VCS...
%-f.cpp: %-f.hpp HEADER.inl FOOTER.inl Makefile
	@echo "FUNCTION $@"
	@cat HEADER.inl > $@
	@echo "void someFunctionThatDoesNothing(void) {" >> $@
	@cat $< >> $@
	@echo "}" >> $@
	@cat FOOTER.inl >> $@

.PHONY: clean
clean:
	rm -fv $(OBJS) $(SRCS)

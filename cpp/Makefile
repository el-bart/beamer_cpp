INLS := $(wildcard *.inl)
HDRS := $(wildcard *-[fma].hpp)
SRCS := $(HDRS:.hpp=.cpp)
OBJS := $(SRCS:.cpp=.oxx)
APPH := $(wildcard *-a.hpp)
APPS := $(APPH:.hpp=.out)
DEPS := $(wildcard *.d)

.SECONDARY:

CXX      := g++
CXXFLAGS += -std=c++1y
CXXFLAGS += -Wall -Werror
CXXFLAGS += -Wno-unused-but-set-variable
CXXFLAGS += -Wno-unused-variable
CXXFLAGS += -MD

.PHONY: all
all: $(OBJS) $(APPS)

%.out: %.oxx Makefile
	@echo "LD $@"
	@$(CXX) $(CXXFLAGS) -o $@ $<

%.oxx: %.cpp Makefile
	@echo "CXX $<"
	@$(CXX) $(CXXFLAGS) -c -o $@ $<

%-m.cpp: %-m.hpp HEADER.inl FOOTER.inl Makefile
	@echo "MODULE $@"
	@cat HEADER.inl $< FOOTER.inl > $@

%-a.cpp: %-a.hpp HEADER.inl FOOTER.inl Makefile
	@echo "APPLICATION $@"
	@cat HEADER.inl $< FOOTER.inl > $@

%-f.cpp: %-f.hpp HEADER.inl FOOTER.inl Makefile
	@echo "FUNCTION $@"
	@cat HEADER.inl > $@
	@echo "void someFunctionThatDoesNothing(void) {" >> $@
	@cat $< >> $@
	@echo "}" >> $@
	@cat FOOTER.inl >> $@

.PHONY: clean
clean:
	rm -fv $(OBJS) $(SRCS) $(APPS) $(DEPS)

-include $(DEPS)

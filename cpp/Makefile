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
	@cat HEADER.inl > $@
	@echo '#include "$<"' >> $@
	@cat FOOTER.inl >> $@

%-a.cpp: %-a.hpp HEADER.inl FOOTER.inl Makefile
	@echo "APPLICATION $@"
	@cat HEADER.inl > $@
	@echo '#include "$<"' >> $@
	@cat FOOTER.inl >> $@

%-f.cpp: %-f.hpp HEADER.inl FOOTER.inl Makefile
	@echo "FUNCTION $@"
	@cat HEADER.inl > $@
	@echo "void someFunctionThatDoesNothing(void) {" >> $@
	@echo '#include "$<"' >> $@
	@echo "}" >> $@
	@cat FOOTER.inl >> $@

.PHONY: clean
clean:
	rm -fv $(OBJS) $(SRCS) $(APPS) $(DEPS)

-include $(DEPS)
# you can put extra flags/settings in here, if needed
-include config.mk

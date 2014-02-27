INLS := $(wildcard *.inl)
HDRS := $(wildcard *.hpp)
SRCS := $(HDRS:.hpp=.cpp)
OBJS := $(SRCS:.cpp=.oxx)

CXX      := g++
CXXFLAGS := -Wall -std=c++11 -Werror

.PHONY: all
all: $(OBJS)

%.oxx: %.cpp Makefile
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# note: CPP file will be removed as a secondary target, which is good, as we do not want them under VCS...
%.cpp: %.hpp HEADER.inl FOOTER.inl Makefile
	cat HEADER.inl $< FOOTER.inl > $@

.PHONY: clean
clean:
	rm -fv $(OBJS)

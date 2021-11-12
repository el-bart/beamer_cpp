# beamer C++

beamer template for C++ presentations. it provides facilities to compile code
prior to its insertion on a slide. it allows also on-the-fly generation of
gnuplot and graphviz (dot) images, that are to be inserted on a slides.
it all comes with a set of macros that simplify using beamer for typical C++-oriented
presentation.

template comes with set of example sides, both showing its capabilities and
providing cheat-shit on most common beamer/LaTeX features.

in order to used containerized SDK, just run `./rebuild_on_change`.
the script automatically monitors for source files changes and uses Docker to build latest document version.
file `main.pdf` is used as build temporary and final file (if build is successful) gets copied as `latest.pdf`.
additionally you nca pass arguments to `./rebuild_on_change`, that will be passed on to `make` directly (eg. `fast` to do 1-run through LaTeX files).

additionally there is a `./rebuild` script provided, that allows to do one-off rebuilds of the presentation, using defined SDK.
it also passes all its arguments back to `make` internally.

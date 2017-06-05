Beamer C++
==========

[![Codefresh build status]( https://g.codefresh.io/api/badges/build?repoOwner=el-bart&repoName=beamer_cpp&branch=master&pipelineName=beamer_cpp&accountName=el-bart&type=cf-1)]( https://g.codefresh.io/repositories/el-bart/beamer_cpp/builds?filter=trigger:build;branch:master;service:5935ae8c629cf10001d30645~beamer_cpp)

beamer template for C++ presentations. it provides facilities to compile code
prior to its insertion on a slide. it allows also on-the-fly generation of
gnuplot and graphviz (dot) images, that are to be inserted on a slides.
it all comes with a set of macros that simplify using beamer for typical C++-oriented
presentation.

template comes with set of example sides, both showing its capabilities and
providing cheat-shit on most common beamer/LaTeX features.

in order to build example one can use [ready-to-use SDK docker image](https://hub.docker.com/r/baszerr/beamer_cpp/).
it can be downloaded with a command: `docker pull baszerr/beamer_cpp`

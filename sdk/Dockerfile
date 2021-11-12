FROM debian:10.9

RUN apt-get update && apt-get dist-upgrade -y

RUN apt-get update && apt-get install -y make

# full installation is NOT required, though it is ver convenient in real life ;)
RUN apt-get update && apt-get install -y texlive-full

# none of the following packages is strictly required for all the presentations.
# these are needed for particular features, like QR-code generation, C++ sources building, etc...
RUN apt-get install -y \
  inkscape \
  gnuplot \
  dia \
  graphviz \
  plantuml \
  python-seqdiag \
  qrencode \
  g++ \
  jq \
  python3-pygments

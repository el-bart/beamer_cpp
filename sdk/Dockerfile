FROM debian:11.1

RUN apt-get update && apt-get dist-upgrade -y

RUN apt-get update && apt-get install -y make

# full installation is NOT required, though it is ver convenient in real life ;)
RUN apt-get update && apt-get install -y texlive-full

# none of the following packages is strictly required for all the presentations.
# these are needed for particular features, like QR-code generation, C++ sources building, etc...
RUN apt-get update && apt-get install -y \
  dia \
  g++ \
  gnuplot \
  graphviz \
  inkscape \
  jq \
  plantuml \
  python3-pygments \
  python3-seqdiag \
  qrencode

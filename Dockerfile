FROM alpine:latest

# Install minimal TeX Live toolchain with XeLaTeX, pdfLaTeX, Arabic/Persian (xepersian/bidi), TikZ, and FontAwesome
RUN apk add --no-cache \
    texlive-xetex \
    texmf-dist-langarabic \
    texlive-latexrecommended \
    texlive-latexextra \
    texlive-pictures \
    fontconfig \
    make

WORKDIR /work

FROM quay.io/fedora/fedora-toolbox:44

RUN dnf upgrade -y && dnf install -y \
    @development-tools \
    texlive-scheme-full \
    && dnf clean all

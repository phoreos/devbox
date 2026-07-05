ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN dnf upgrade -y && dnf install -y \
    @development-tools \
    texlive-scheme-full \
    && dnf clean all

RUN if [ "$TARGET_ENV" = "distrobox" ]; then \
        true; \
    elif [ "$TARGET_ENV" = "vm" ]; then \
        dnf install -y open-vm-tools virtualbox-guest-additions; \
    fi

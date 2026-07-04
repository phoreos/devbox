FROM quay.io/fedora/fedora-toolbox:44

RUN dnf upgrade -y && dnf install -y \
    @development-tools \
    fish \
    golang \
    nodejs \
    uv \
    java-latest-openjdk \
    Agda Agda-stdlib \
    texlive-scheme-full \
    && dnf clean all

RUN curl -sSL https://github.com/typst/typst/releases/latest/download/typst-x86_64-unknown-linux-musl.tar.xz -o /tmp/typst.tar.xz \
    && tar -xvf /tmp/typst.tar.xz -C /tmp \
    && mv /tmp/typst-*/typst /usr/local/bin/ \
    && rm -rf /tmp/typst*

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc && echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null && dnf check-update && dnf install -y code

RUN curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_MINIMAL=1 sh

RUN ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/xdg-open

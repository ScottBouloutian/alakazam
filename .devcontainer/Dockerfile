FROM cirrusci/flutter:beta

RUN sudo apt-get update \
    && sudo apt-get install -y gpg-agent zsh \
    && flutter config --enable-web \
    && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended" \
    && git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

WORKDIR /workspace

FROM cirrusci/flutter:beta

WORKDIR /home/cirrus/sdks/flutter
RUN sudo apt-get update \
    && sudo apt-get install -y gpg-agent \
    && flutter config --enable-web

WORKDIR /workspace

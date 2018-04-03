FROM circleci/node:8.10-stretch

RUN sudo npm i -g npm@latest

RUN git clone https://github.com/kamatama41/tfenv.git ~/.tfenv

ENV PATH="/home/circleci/.tfenv/bin:${PATH}"

WORKDIR /home/circleci

RUN tfenv install latest
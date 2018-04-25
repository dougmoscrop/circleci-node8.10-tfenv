FROM circleci/node:8.10-stretch

# update npm
RUN sudo npm i -g npm@latest

# install aws-sdk
RUN sudo apt-get -y -qq update && sudo apt-get -y -qq install python3
RUN curl https://bootstrap.pypa.io/get-pip.py -o ~/get-pip.py
RUN sudo python3 ~/get-pip.py
RUN sudo pip install awscli==1.11.18 --upgrade

# tfenv
RUN git clone https://github.com/kamatama41/tfenv.git ~/.tfenv

ENV PATH="/home/circleci/.tfenv/bin:${PATH}"

WORKDIR /home/circleci

RUN tfenv install latest:^0.10
RUN tfenv install latest:^0.11
RUN tfenv install latest
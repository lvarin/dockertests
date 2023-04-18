FROM node

RUN mkdir -p /src
WORKDIR /src

# Install dependencies
RUN apt-get update && apt-get install -y && \
    git clone https://github.com/giomara-larraga/desdeo-experiments.git && \
    yarn install

WORKDIR /src/desdeo-experiments
#RUN sed -i 's/127.0.0.1/localhost/' ./src/App.tsx

ENTRYPOINT [ "yarn", "react-scripts", "--openssl-legacy-provider", "start" ]

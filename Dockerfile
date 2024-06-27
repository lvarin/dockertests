FROM node

RUN adduser node root && \
    mkdir -p /src

WORKDIR /src

# Install dependencies
RUN apt-get update && apt-get install -y && \
    git clone https://github.com/giomara-larraga/desdeo-experiments.git 

WORKDIR /src/desdeo-experiments

RUN yarn install --network-timeout 800000
RUN sed -i 's,127.0.0.1:5000,webapiroute-desdeoswitch.rahtiapp.fi/,' ./src/App.tsx

RUN chmod -R 775 /src/desdeo-experiments
RUN chown -R node:root /src/desdeo-experiments


USER 1000

ENTRYPOINT [ "yarn", "react-scripts", "--openssl-legacy-provider", "start" ]

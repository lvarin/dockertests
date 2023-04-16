FROM node

WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && apt-get install -y && \
    git clone https://github.com/industrial-optimization-group/desdeo-frontend.git

WORKDIR /usr/src/app/desdeo-frontend

RUN yarn install

RUN sed -i 's/127.0.0.1/localhost/' ./src/App.tsx

ENTRYPOINT [ "yarn", "react-scripts", "--openssl-legacy-provider", "start" ]

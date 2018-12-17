FROM node:8.14.0-jessie

# Create app directory
WORKDIR /app

# Add dumb-init to receive SIGINT and SIGTERM signals
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64
RUN chmod +x /usr/local/bin/dumb-init

# Install required linux packages (bzip2, default-jre)
RUN apt-get update 
RUN apt-get install -y bzip2
RUN apt-get install -y default-jre
# Installing chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

# Install dependencies
COPY package.json package.json
COPY yarn.lock yarn.lock
ADD .yarn-cache.tgz /
RUN yarn


# Add node_modules/.bin to PATH
ENV PATH="/app/node_modules/.bin:${PATH}"
ENV NODE_ENV development
ENV DEBUG app:*

EXPOSE 5000
ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

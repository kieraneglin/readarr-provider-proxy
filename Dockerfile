# Use slim instead of alpine to avoid DNS resolution issues in production
FROM node:22.7-slim

ARG PORT=8080
ARG NODE_ENV=production

ENV PORT=$PORT
ENV NODE_ENV=$NODE_ENV

RUN apt-get update -qq && \
  apt-get install -y build-essential curl git openssh-client postgresql-client

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . ./

RUN chown node:node .
USER node

EXPOSE $PORT

CMD ["npm", "run", "start"]

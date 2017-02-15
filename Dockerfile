FROM node:6.9.5

# Create app directory
RUN mkdir -p /home/app/code/node_modules
RUN npm install nodemon -g

WORKDIR /home/app/code

ENV NODE_ENV development

COPY package.json /home/app/code/
RUN npm cache clean && \
  npm install --silent --progress=false&& \
  apt-get clean

COPY . /home/app/code

EXPOSE 3000
CMD ["nodemon", "-L"]
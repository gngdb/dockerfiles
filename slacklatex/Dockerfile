FROM node:argon

# install dependencies
RUN npm install fs &\
    npm install request &\
    npm install websocket

# make a new user called node
RUN useradd -m -g users node
WORKDIR /home/node

# add the bot.js
ADD https://raw.githubusercontent.com/sand500/SlackLateX/master/bot.js bot.js
# add the secret.txt
ADD secret.txt secret.txt
# fix ownership problem
RUN chown node:users *

USER node
# run the service
CMD ["node", "bot.js"]

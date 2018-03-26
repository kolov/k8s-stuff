FROM  node:9

# USER root
RUN npm update
RUN npm install elm
RUN yarn add webpack webpack-dev-server elm-webpack-loader file-loader style-loader css-loader url-loader
RUN yarn add ace-css@1.1 font-awesome@4
RUN yarn add foreman
USER node

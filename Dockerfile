FROM node:14-alpine as build-deps
WORKDIR /usr/src/app
COPY package*.json ./
ENV BACKEND_SERVER_NAME=whaticket_backend
ENV DOCKERIZE_VERSION=v0.6.1
ENV FRONTEND_SERVER_NAME=whaticket
ENV NGINX_VERSION=1.25.2
ENV NJS_VERSION=0.8.0
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PKG_RELEASE=1
ENV PUBLIC_HTML=/var/www/public/
ENV REACT_APP_BACKEND_URL=
ENV URL_BACKEND=

	
ADD file:756183bba9c7f4593c2b216e98e4208b9163c4c962ea0837ef88bd917609d001 in /
CMD ["/bin/sh"]
ENV PKG_RELEASE=1
COPY file:01e75c6dd0ce317d516928a17584d111cd082840c01e58be0afc851b33adb916 in /
COPY file:caec368f5a54f70a844a13005eb2255bed778809b3672d516e719ce2f4bce123 in /docker-entrypoint.d
COPY file:3b1b9915b7dd898a0e32f7eb9715a35c9feab914022efff68ba990bc1ec7d169 in /docker-entrypoint.d
COPY file:57846632accc89753f45cbc00cb9e6223d991e1d31297eec3395a7ca58eed6a6 in /docker-entrypoint.d
COPY file:9e3b2b63db9f8fc702e2dc2bdd0943be0d990c028cddcf1c159f5556a8ba3030 in /docker-entrypoint.d
EXPOSE 80
STOPSIGNAL SIGQUIT
ENV NJS_VERSION=0.8.0
ENV DOCKERIZE_VERSION=v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz
ENV PUBLIC_HTML=/var/www/public/
COPY dir:4243cec92126587db2f8a650ada3dc13e5236e82dd5b73d37113015c9cde9fa4 in /var/www/public/
EXPOSE 80
COPY file:3c8f602a58b9b92285c6a5d48c97db75404ff08b727f50dce5bf8114a2c47cdd in /docker-entrypoint.d/01-add-env-vars.sh
RUN chmod +x /docker-entrypoint.d/01-add-env-vars.sh
RUN npm install
COPY .env* ./
COPY src/ ./src/
COPY public/ ./public/
RUN npm run build
ENTRYPOINT ["/docker-entrypoint.sh"]
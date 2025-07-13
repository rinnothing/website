FROM builder AS pdf
ADD latex /latex
WORKDIR /latex
RUN mkdir /pdf /aux && latexmk

FROM nginx:stable-alpine AS website
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/website.conf /etc/nginx/conf.d/website.conf
ARG SERVER_NAME
RUN cat /etc/nginx/conf.d/website.conf | envsubst > /etc/nginx/conf.d/website.conf
COPY front /usr/share/nginx/html
COPY --from=pdf /pdf/*.pdf /usr/share/nginx/pdf/

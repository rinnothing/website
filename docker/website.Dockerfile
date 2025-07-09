FROM builder AS pdf
ADD latex /latex
WORKDIR /latex
RUN mkdir /pdf /aux && latexmk -pdf -auxdir=/aux -outdir=/pdf ru.tex en.tex

FROM nginx:stable-alpine AS website
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/website.conf /etc/nginx/conf.d/website.conf
COPY front /usr/share/nginx/html
COPY --from=pdf /pdf/*.pdf /usr/share/nginx/pdf/

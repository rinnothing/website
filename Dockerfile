FROM blang/latex:ctanbasic as builder
RUN mkdir pdf compile
ADD latex /latex
ADD .compile /compile
RUN latexmk -f -outdir=pdf -auxdir=compile -interaction=batchmode -pdf /latex/en.tex /latex/ru.tex

FROM nginx:stable-alpine
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY front /usr/share/nginx/html
FROM kjarosh/latex:2025.1-medium as builder
RUN tlmgr install babel-russian hyphen-russian cyrillic t2 lh cm-super
RUN tlmgr install fontawesome5 preprint titlesec enumitem lato fontaxes

ADD latex /latex
WORKDIR /latex
RUN pdflatex /latex/ru.tex /latex/en.tex

# FROM nginx:stable-alpine
# COPY nginx/nginx.conf /etc/nginx/nginx.conf
# COPY front /usr/share/nginx/html
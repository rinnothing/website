FROM kjarosh/latex:2025.1-medium AS builder
RUN tlmgr install babel-russian hyphen-russian cyrillic t2 lh cm-super
RUN tlmgr install fontawesome5 preprint titlesec enumitem lato fontaxes


FROM builder as pdf
ADD latex /latex
WORKDIR /latex
RUN mkdir /pdf && pdflatex -output-directory /pdf /latex/ru.tex /latex/en.tex

FROM nginx:stable-alpine AS website
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/website.conf /etc/nginx/conf.d/website.conf
COPY front /usr/share/nginx/html
COPY --from=pdf /pdf/*.pdf /usr/share/nginx/pdf/

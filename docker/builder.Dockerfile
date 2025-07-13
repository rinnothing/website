FROM kjarosh/latex:2025.1-medium AS builder
RUN tlmgr install babel-russian hyphen-russian cyrillic t2 lh cm-super
RUN tlmgr install fontawesome5 preprint titlesec enumitem lato fontaxes

FROM r-base:4.3.0
LABEL Name=hellojenkinssingularity Version=0.0.2
COPY . hello.R
RUN R -e 'install.packages("BiocManager")'
RUN R -e 'BiocManager::install("MSstats")'
CMD ["Rscript", "hello.R"]

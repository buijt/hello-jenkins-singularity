FROM r-base:4.3.0
LABEL Name=hellojenkinssingularity Version=0.0.2
COPY . hello.R
RUN apt-get -y update;apt-get install cmake
RUN R -e 'install.packages("BiocManager");BiocManager::install("MSstats")'
CMD Rscript hello.R

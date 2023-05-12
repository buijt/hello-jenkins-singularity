FROM r-base:4.3.0
LABEL Name=hellojenkinssingularity Version=0.0.2
RUN apt-get -y update && apt-get install -y cmake \
    && rm -rf /var/lib/apt/lists/*
RUN R -e 'install.packages("BiocManager");BiocManager::install("MSstats")'
COPY ./hello.R .
ENTRYPOINT Rscript /hello.R

FROM rocker/r-ver:4.2.0
ARG DUP_STAGE

WORKDIR /project

WORKDIR /project/${DUP_STAGE}

COPY ${DUP_STAGE}/ ./
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl libcurl4-openssl-dev zlib1g-dev libssl-dev libicu-dev
RUN install2.r --error --repos http://cran.rstudio.com/ --skipinstalled stringi opalr tibble

# Needs to be adapted
CMD ["/bin/bash"]
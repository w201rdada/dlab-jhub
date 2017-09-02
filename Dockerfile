FROM aculich/rockyter

MAINTAINER Chris Hench <chench@berkeley.edu>

# conda python packages
RUN conda install --yes \
      nltk \
      statsmodels \
      geojson \
      pydotplus \
      mplleaflet \
      pysal \
      lxml

# conda r packages
RUN conda install --yes \
      r-ggplot2 \
      r-geosphere \
      r-psych \
      r-xml2 \
      r-SnowballC \
      r-XML \
      r-caret \
      r-plyr \
      r-rpart \
      r-jsonlite \
      r-data.table \
      r-tm \
      r-randomForest \
      r-stringr \
      r-sp \
      r-rvest

# cran r packages
RUN Rscript -e "install.packages('rpart.plot', dependencies = TRUE, repos='http://cran.us.r-project.org')" && \
    Rscript -e "install.packages('SuperLearner', dependencies = TRUE, repos='http://cran.us.r-project.org')" && \
    Rscript -e "install.packages('topicmodels', dependencies = TRUE, repos='http://cran.us.r-project.org')" && \
    Rscript -e "install.packages('selectr', dependencies = TRUE, repos='http://cran.us.r-project.org')"

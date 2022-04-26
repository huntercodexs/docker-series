FROM store/oracle/database-enterprise:12.2.0.1

ARG ORACLE_SEC_PASSWORD
ARG DATABASE_FILENAME
ARG DOCKER_USERNAME
ARG DOCKER_PASSWORD

RUN echo "*****************************************************************************"
RUN echo "Welcome to Oracle Builder!"
RUN echo "*****************************************************************************"

RUN docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}

#LINK: https://www.oracle.com/br/technical-resources/articles/database-performance/oracle-db19c-com-docker.html
#LINK: https://hub.docker.com/u/huntercodexs/content/sub-75e583ed-c329-49c7-b8f6-bc103f177976

USER root

RUN mkdir -p ./oracleData
RUN chmod 777 ./oracleData
RUN chown nobody:nogroup ./oracleData

# Current Folder Content
# ${DATABASE_ZIP} (Required, this file should be downloaded before builder)
RUN cd ./oracleData

RUN if ! ls docker-images/ \
    then \
        git clone https://github.com/oracle/docker-images.git \
    else \
        echo "[Skipping] https://github.com/oracle/docker-images.git already exists !" \
    fi

# https://download.oracle.com/otn/linux/oracle19c/190000/${DATABASE_ZIP}
RUN if ! ls ${DATABASE_ZIP} \
    then \
        echo "[ERROR] Missing file: ${DATABASE_ZIP}" \
    fi

RUN cp -rfv ${DATABASE_ZIP} docker-images/OracleDatabase/SingleInstance/dockerfiles/19.3.0/

RUN cd docker-images/OracleDatabase/SingleInstance/dockerfiles/

RUN ls -ltr

RUN ./buildContainerImage.sh -v 19.3.0 -e

RUN rm -rfv 19.3.0/${DATABASE_ZIP}

RUN docker exec -it oracle19c ./setPassword.sh ${ORACLE_SEC_PASSWORD}

RUN echo "Bye..."

RUN docker logout

EXPOSE [1521, 5500]

CMD ["oracle"]

ARG IMAGE=intersystemsdc/iris-community
FROM $IMAGE

RUN pip3 install --target /usr/irissys/mgr/python sentence_transformers

USER ${ISC_PACKAGE_MGRUSER}
WORKDIR /home/irisowner/dev
COPY iris.script iris.script
COPY nakav.cls nakav.cls

RUN iris view && iris start IRIS \
    && iris session IRIS < iris.script \
    && iris stop IRIS quietly 


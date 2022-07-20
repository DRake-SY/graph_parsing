
FROM ubuntu:20.04
WORKDIR /home/maxime/Bureau/graph_parsing
# Install dependencies
RUN apt-get update && apt-get install -y \
	software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y \
	python3.9 \
	openjdk-11-jre \
	python3-pip \
	graphviz graphviz-dev && pip3 install networkX graphviz argparse pandas openpyxl pygraphviz
ADD main.py /usr/app/src/main.py
ADD Parse_function_graph.py /usr/app/src/Parse_function_graph.py
ADD simi_table.csv /usr/app/src/simi_table.csv
ADD data /usr/app/src/data
ADD gSpan /usr/app/src/gspan
ADD graphmdl-master /usr/app/src/graphmdl
ADD result /usr/app/src/result



#ENTRYPOINT ["python3","test.py", "/usr/app/src/new_analysisNB_v2", "graphmdl+", "test_docker"]
#ENTRYPOINT ["python3","test.py", "/usr/app/src/new_analysisNB_v2", "gspan", "/usr/app/src/simi_table.csv", "test_docker"]
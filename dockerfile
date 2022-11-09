
FROM ubuntu:20.04
WORKDIR /usr/app/src/
# Install dependencies
RUN apt-get update && apt-get install -y \
	software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y \
	python3.9 \
	openjdk-11-jre \
	python3-pip \
	graphviz graphviz-dev && pip3 install networkX graphviz argparse pandas openpyxl pygraphviz
ADD main.py main.py
ADD Parse_function_graph.py Parse_function_graph.py
ADD simi_table.csv simi_table.csv
ADD simi_table.py simi_table.py
ADD data data
ADD gSpan gspan
ADD graphmdl-master graphmdl
ADD modif_json_mdl.py modif_json_mdl.py
ADD parsed_agg.py parsed_agg.py
ADD extract_process.py extract_process.py
ADD result result



#ENTRYPOINT ["python3","test.py", "/usr/app/src/new_analysisNB_v2", "graphmdl+", "test_docker"]
#ENTRYPOINT ["python3","test.py", "/usr/app/src/new_analysisNB_v2", "gspan", "/usr/app/src/simi_table.csv", "test_docker"]

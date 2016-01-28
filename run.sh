#!/bin/bash

PIPELINE="dogfood-helion-ce-pipeline"
yes y | fly set-pipeline -p ${PIPELINE} -c  ${PIPELINE}.yml --load-vars-from dogfood-ci-pipeline.helionce.secrets.yml
fly unpause-pipeline -p  ${PIPELINE}
curl http://192.168.100.4:8080/pipelines/${PIPELINE}/jobs/job-clone-repo/builds -X POST

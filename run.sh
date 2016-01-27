#!/bin/bash
yes y | fly set-pipeline -p dogfood-ci-pipeline -c dogfood-ci-pipeline.yml --load-vars-from dogfood-ci-pipeline.python.secrets.yml
fly unpause-pipeline -p dogfood-ci-pipeline
curl http://192.168.100.4:8080/pipelines/dogfood-ci-pipeline/jobs/job-clone-repo/builds -X POST

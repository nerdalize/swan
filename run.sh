#!/bin/bash
rm -fr ./output
docker run -v $(PWD)/example/:/data/RUN -v $(pwd)/output:/output -e INPUT=f31har01 -it nerdalize/swan

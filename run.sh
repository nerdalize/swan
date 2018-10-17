#!/bin/bash
rm -fr ./output
docker run -v $(pwd)/example/:/data/RUN -v $(pwd)/output:/output -it nerdalize/swan /data/RUN/f31har01.swn

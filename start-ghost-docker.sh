#!/bin/bash

# runs on localhost:2368
docker run -d \
       --name local-ghost-blog \
       --volume :/var/lib/ghost/content/themes/ \
       --network host \
       ghost

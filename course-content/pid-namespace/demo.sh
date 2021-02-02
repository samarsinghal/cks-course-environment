#! /usr/bin/env bash

source ./demo-magic.sh

clear

gcloud compute ssh cks-master

docker rm c1 --force

docker rm c2 --force

pe 'docker run --name c1 -d ubuntu sh -c 'sleep 1d''

pe 'docker exec c1 ps aux'

pe 'ps aux | grep sleep'

pe 'docker run --name c2 -d ubuntu sh -c 'sleep 2d''

pe 'docker exec c1 ps aux'

pe 'docker exec c2 ps aux'

pe 'docker rm c2 --force'

pe 'docker run --name c2 --pid=container:c1 -d ubuntu sh -c 'sleep 2d''

pe 'docker exec c1 ps aux'

pe 'docker exec c2 ps aux'


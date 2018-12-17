#! /bin/bash

source "${BASH_SOURCE%/*}/common.sh"

# Init empty cache file
if [ ! -f .yarn-cache.tgz ]; then
  echo "Init empty .yarn-cache.tgz"
  tar cvzf .yarn-cache.tgz --files-from /dev/null
fi

docker-compose build

echo "Saving yarn.lock"
docker run --rm --entrypoint cat headbox-ng-dev/selenium-cucumber-test /app/yarn.lock > yarn.lock
# echo "Saving Yarn cache"
# docker run --rm --entrypoint tar headbox-ng-dev/$PROJECT_NAME czf - /usr/local/share/.cache/yarn/v2 > .yarn-cache.tgz

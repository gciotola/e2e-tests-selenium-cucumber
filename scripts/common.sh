#!/bin/bash

COMPOSE_PROJECT=headbox-ng
PROJECT_NAME=selenium-cucumber-test

startService () {
  local SERVICE=$1
  local SERVICE=${SERVICE:=$PROJECT_NAME}
  local LIVE=$2

  if [[ -n $LIVE ]]; then
    shift
    shift
    local CMD=$@
    if [[ -n $CMD ]]; then
      docker-compose -p $COMPOSE_PROJECT run $SERVICE bash -c "$CMD"
    else
      docker-compose -p $COMPOSE_PROJECT up $SERVICE
    fi
  else
    echo -n "Starting background service '$SERVICE'... "
    docker-compose -p $COMPOSE_PROJECT up -d $SERVICE &>/dev/null
    echo "Done"
    echo "Attaching to $SERVICE logs..."
    docker-compose -p $COMPOSE_PROJECT logs -f $SERVICE || true
  fi
}

stopService () {
  local SERVICE=$1
  local SERVICE=${SERVICE:=$PROJECT_NAME}
  echo
  echo -n "Stopping all '$SERVICE' containers... "
  docker-compose -p $COMPOSE_PROJECT stop $SERVICE &>/dev/null
  echo 'Done.'
  echo
}

removeService () {
  local SERVICE=$1
  local SERVICE=${SERVICE:=$PROJECT_NAME}

  stopService $SERVICE
  echo
  echo -n "Removing $SERVICE container... "
  docker-compose -p $COMPOSE_PROJECT rm -f $SERVICE &>/dev/null
  echo "Done."
  echo
}

cleanService () {
  local SERVICE=$1
  local SERVICE=${SERVICE:=$PROJECT_NAME}

  echo
  echo -n "Stopping and removing all '$SERVICE' containers... "
  stopService $SERVICE &>/dev/null
  removeService $SERVICE &>/dev/null
  echo 'Done.'
  echo
}

runAsService () {
  local SERVICE=$1
  local SERVICE=${SERVICE:=$PROJECT_NAME}
  shift
  local CMD=$@
  if [[ -n "$CMD"  ]]; then
    startService $SERVICE live $CMD
  fi
}

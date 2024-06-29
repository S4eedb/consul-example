#!/bin/bash

docker compose down -v
sudo rm -rf data/*
docker compose up -d
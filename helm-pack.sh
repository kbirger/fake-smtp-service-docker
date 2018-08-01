#!/bin/bash

rm -rf dist/*
mkdir -p dist
helm package helm/fake-smtp-service -d dist

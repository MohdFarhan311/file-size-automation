#!/bin/bash

################################################################################
# Script Name : file_size_automation.sh
# add 
# Description :
#   This script is created as part of an assignment to perform the following:
#   1. Create a directory containing files of various sizes using OS commands:
#      - 10 files of 50MB
#      - 20 files of 100MB
#      - 30 files of 500MB
#      - 5 files of 1GB
#      - 3 files of 5GB
#      - 1 file of 10GB
#   2. Identify all files larger than 50MB and sort them in decreasing
#      order based on file size.
#   3. Commit a large file (>2GB) to a GitHub repository.
#   4. Remove the large file from the repository and clean the Git history
#      using bfg-repo-cleaner.
#
# Author      : Farhan
# Created On  : 17-01-2026
#
# Usage       :
#   bash file_size_automation.sh
#
################################################################################

mkdir -p files
cd files || exit

# 10 files of 50MB
for i in {1..10}; do
  fallocate -l 50M file_50MB_$i
done

# 20 files of 100MB
for i in {1..20}; do
  fallocate -l 100M file_100MB_$i
done

# 30 files of 500MB
for i in {1..30}; do
  fallocate -l 500M file_500MB_$i
done

# 5 files of 1GB
for i in {1..5}; do
  fallocate -l 1G file_1GB_$i
done

# 3 files of 5GB
for i in {1..3}; do
  fallocate -l 5G file_5GB_$i
done

# 1 file of 10GB
fallocate -l 10G file_10GB_1

:wq!

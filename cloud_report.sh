#!/bin/bash

BASEDIR=$(dirname "$0")

print_header() {
  echo
  echo +============================+
  printf "+ %-26s +\n" "$1"
  echo +============================+
  echo
}

print_report() {
  # translate the pipe symbol to a plus symbol
  # as Nagios would wrongly interpret the pipe symbol
  mysql --table < $BASEDIR/$1 | tr '|' '+'
}

echo Running $0

print_header "OVERALL REPORT"

print_report overall_report.sql

print_header "COMPUTE REPORT"

print_report compute_report.sql

print_header "NETWORK REPORT"

print_report network_report.sql

print_header "STORAGE REPORT"

print_report storage_report.sql

print_header "SHARE REPORT"

print_report share_report.sql

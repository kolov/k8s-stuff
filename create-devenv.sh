#!/bin/bash

dir="$(dirname "$0")"

$dir/jenkins/create-jenkins2.sh
$dir/nexus/create-nexus3.sh
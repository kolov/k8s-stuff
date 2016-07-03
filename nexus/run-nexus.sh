#!/usr/bin/env bash
chown -R nexus:nexus /nexus-data
date >> /nexus-data/kube.log
ls -al /nexus-data
su nexus -s /bin/bash nexus -c 'bin/nexus run'

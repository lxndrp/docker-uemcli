# Copyright (c) 2017 Dr. Alexander Papaspyrou.
# See LICENSE file for details.
FROM centos:7
LABEL maintainer Dr. Alexander Papaspyrou <alexander@papaspyrou.name>
ADD ./UnisphereCLI-Linux-32-x86-en_US-4.1.1.1.3836-1.i386.rpm /tmp/uemcli.rpm 
RUN yum -y install glibc.i686 libstdc++.i686 /tmp/uemcli.rpm
ENTRYPOINT [ "/opt/emc/uemcli/bin/uemcli.sh" ]

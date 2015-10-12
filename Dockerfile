FROM registry.access.redhat.com/openshift3/mysql-55-rhel7

ADD ./schema.mysql.sql /tmp/schema.mysql.sql
ADD ./dataload.mysql.sql /tmp/dataload.mysql.sql
ADD ./check.mysql.sql /tmp/check.mysql.sql

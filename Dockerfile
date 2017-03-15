FROM 35.185.192.88:5001/alpine:3.4
RUN apk update
RUN apk upgrade
RUN apk add curl
ADD curl -uadmin:AP4djjHLxSMGYCmQEwztsiVNXuC -O "http://35.185.192.88/artifactory/libs-release-local/composite-servlet3/composite-servlet3/composite-servlet3/composite-servlet3-composite-servlet3.war
RUN curl -uadmin:AP4djjHLxSMGYCmQEwztsiVNXuC -O "http://35.185.192.88/artifactory/libs-snapshot-local/org/jfrog/test/multi3/6.12-SNAPSHOT/multi3-6.12-20170315.220033-1.war"
CMD echo "Hello, Welcome to JFrog test drive"

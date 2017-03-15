FROM 35.185.192.88:5001/nginx
ADD composite-servlet3.war /files/composite-servlet3.war
CMD echo "Hello, Welcome to JFrog test drive"

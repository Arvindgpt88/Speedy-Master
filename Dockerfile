FROM nginx:latest
# Take the war and copy to webapps of tomcat
CMD ["/hello-nginx"]

FROM nginx
COPY ./website /usr/share/nginx/html

#uncomment this when we have configuration
#COPY conf /etc/nginx

VOLUME /usr/share/nginx/html
VOLUME /etc/nginx
VOLUME /var/log/nginx/log

#RUN npm install

# Expose port 80 to the outside world
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
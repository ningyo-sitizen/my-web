# Gunakan Nginx untuk menyajikan aplikasi web
FROM nginx:alpine

# Salin file HTML, CSS, dan JS ke dalam direktori Nginx di dalam container
COPY ./index.html /usr/share/nginx/html/
COPY ./css/. /usr/share/nginx/html/
COPY ./js/. /usr/share/nginx/html/

# Expose port 80
EXPOSE 80


# Gunakan image Nginx untuk server web
FROM nginx:alpine

# Salin file HTML, CSS, dan JS ke dalam folder publik Nginx
COPY ./ /usr/share/nginx/html

# Expose port 80 untuk mengakses aplikasi
EXPOSE 80


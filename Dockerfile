# Sử dụng Ubuntu làm base image
FROM ubuntu:latest

# Cài đặt Apache2 và PHP
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    && rm -rf /var/lib/apt/lists/*

# Copy file index.php vào thư mục mặc định của Apache
COPY index.php /var/www/html/

# Mở cổng 80 cho HTTP
EXPOSE 80

# Khởi động Apache khi container chạy
CMD ["apachectl", "-D", "FOREGROUND"]

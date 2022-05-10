FROM php:7.4.28-apache-bullseye
RUN docker-php-ext-install mysqli

#exiftool version vulnerability CVE-2021-22204
ARG VERSION=12.23

# download and install exiftool
RUN cd /tmp && \
    apt install perl -y && \
    curl -O https://codeload.github.com/exiftool/exiftool/tar.gz/refs/tags/$VERSION && \
    mv $VERSION exiftool-$VERSION.tar.gz && \
    tar -xzvf exiftool-$VERSION.tar.gz && \
    rm -rf exiftool-$VERSION.tar.gz && \
    cd exiftool-* && \
    rm -rf html t Change Makefile.PL MANIFEST META.json META.yml perl-Image-ExifTool.spec README && \
    mv * /usr/local/bin/ && \
    rm -rf /tmp/exiftool-*

# changed root password
RUN echo 'root:12345' | chpasswd && \
    cat /etc/passwd > /home/passwd.txt && \
    cat /etc/shadow > /home/shadow.txt

# creating the web environment
COPY ./www /var/www/html/

RUN mkdir /var/www/html/file && \
    chmod 777 /var/www/html/file

# Creating the flag, the value is "cyber notrum" in MD5 Hash
RUN echo "49dad4071eb37cd0ccdf7309e17a4f77" > /root/flag.txt  

EXPOSE 80-65535

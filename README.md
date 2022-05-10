<p align="center">
  <a href="https://github.com/ChispasHK/MiruCTF" rel="noopener">
 <img src="/README_img/logo-github.png" width="680"></a>
</p>

<a href="https://github.com/ChispasHK/MiruCTF" style="color:#000"><h3 align="center">MiruCTF</h3></a>

---

[MiruCTF](https://github.com/ChispasHK/MiruCTF) is a CTF (Capture The Flag) that runs in a Docker container, which has a medium difficulty level and has been developed by [Cyber Notrum](https://www.cybernotrum.com/).

## Installation
The installation has to be done on a Linux system (not tested on Windows) with [Docker installed](https://docs.docker.com/desktop/linux/install/).

You will need to clone the repository:

```
git clone https://github.com/ChispasHK/MiruCTF
cd MiruCTF/
```

### Containerized Installation
A MiruCTF instance can be setup and replicated easily using Dockerfil.

Build the docker image:
```
docker build . -t MiruCTF
```
Run the environment:
```
docker run -p 80:80 -d MiruCTF
```


## Flag Information
The flag is in a file with the name `flag.txt`, inside it there is a hash.


## Solution
The process to solve the challenge is in [README_Solution.md](README_Solution.md)


## License & Copyright 

MIT License (see [license](LICENSE))

The MiruCTF code is licensed as MIT License and the Documentation is licensed as Creative Commons (CC-BY-SA-3.0) and the copyright is owned by [Cyber Notrum](https://www.cybernotrum.com/) and [ChispasHK](https://github.com/ChispasHK).


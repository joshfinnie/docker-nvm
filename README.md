# docker-nvm
A Docker container that has Node.js and NVM installed on it.

## Use

To install the latest `stable` release, run the following command:

```bash
$ docker build -t nvm-stable .
```

To set the version of Node you'd like installed, run the following command:

```bash
$ docker build -t nvm-10.16.3 --build-arg NODE_VERSION=v10.16.3 .
```

To use these images, run the following command:

```bash
$ docker run -it -v `pwd`:/opt/src nvm-stable bash
root@90992da58cca:/opt/src# ls
Dockerfile  LICENSE  README.md
root@90992da58cca:/opt/src# node --version
v12.11.1
```

```bash
$ docker run -it -v `pwd`:/opt/src nvm-10.16.3 bash
root@ca2eabb4210a:/opt/src# ls
Dockerfile  LICENSE  README.md
root@ca2eabb4210a:/opt/src# node --version
v10.16.3
```

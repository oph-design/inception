<a name="readme-top"></a>




<h1 align="center">inception</h1>
<p align="center">
	<img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/oph-design/inception?color=lightblue" />
	<img alt="Code language count" src="https://img.shields.io/github/languages/count/oph-design/inception?color=yellow" />
	<img alt="GitHub top language" src="https://img.shields.io/github/languages/top/oph-design/inception?color=blue" />
	<img alt="GitHub last commit" src="https://img.shields.io/github/created-at/oph-design/inception?color=green" />
</p>
<p align="center">
  <img alt="nginx" src="https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white" />
  <img alt="wordpress" src="https://img.shields.io/badge/Wordpress-21759B?style=for-the-badge&logo=wordpress&logoColor=white" />
  <img alt="mariadb" src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white" />
  <img alt="docker" src="https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white" />
</p>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<p align="left">
<img width="309" alt="Screen Shot 2024-03-21 at 5 09 32 PM" src="https://github.com/oph-design/inception/assets/115570424/cb2f81da-c244-499e-b69c-2059ffa81220">
</p>


Inception is a project that creates a docker environment for a wordpress application, with each component running in their own container. As seen above nginx, wordpress and mariadb have their own configuration and Dockerfiles. The Orcastration of the environment is managed with the docker-compose technolgies, which is able to build and run all the Docker containers and set up at network between them. Every Dockerfile is handwritten to maximise the learning experience. All containers install alpine linux as their operating system, to ensure security and a lightweight architecture.
```Dockerfile
FROM alpine

RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN openssl req -x509 -days 365 -nodes -newkey rsa:2048 \
                -keyout /etc/ssl/private/nginx.key \
                -out /etc/ssl/certs/nginx.crt \
                -subj "/C=DE/ST=BW/L=HN/O=42 Heilbronn/OU=student/CN=oheinzel.42.fr"

COPY conf/nginx.conf /etc/nginx/
EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
```


<!-- GETTING STARTED -->
## Getting Started

The following contains a description of how to use the program. It is recommend to run in an unix (linux or mac) environment.
As installing make and compilers in windows can be quite tedious. You can find a tutorial and setting up an ubuntu virtual machine <a href="https://www.linkedin.com/pulse/how-install-ubuntu-virtualbox-md-emamul-mursalin/">here</a>

### Prerequisites

You need to have make and docker installed. For mac you need also xcode to perform the installation.
* linux (Debian based)
  ```sh
  sudo apt install build-essential
  ```
* MAC-OS
  ```sh
  xcode-select --install
  ```
For docker check out the installation guide <a href="https://docs.docker.com/get-docker/">here</a>

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/oph-design/inception.git
   ```
2. Run make to build the project
   ```sh
   make inception
   ```
3. If you don't have a .env file the program will prompted you to enter credentials

4. Open localhost:443/wp-login in your browser and enter your admin credentials to enter wordpress
<p></p>
<kbd>
<img width="200" alt="Screen Shot 2024-03-21 at 5 46 06 PM" src="https://github.com/oph-design/inception/assets/115570424/bee02eb4-864a-4751-952d-afed9ee547eb">
</kbd>


<!-- USAGE EXAMPLES -->
## Usage

The wordpress application is used quite normally and everything should be setup for easy use.
<p></p>

⚠️ The program cannot run without a .env file. Following information are mandadory
  * `DB_HOST` the name of the db container (has to be mariadb unless changed)
  * `DB_NAME` database name
  * `DB_USER` user for wordpress to login to mariadb
  * `DB_PASS` password for the above user
  * `DB_ROOT` password for the database root user
  * `WP_HOST` domain name of the wordpress website
  * `WP_ADMIN_USER` username for the wordpress admin
  * `WP_ADMIN_PASS` password for the above user
  * `WP_ADMIN_MAIL` email for the wordpress admin user
  * `WP_USER` dummy non-admin user
  * `WP_PASS` password for the above user
  * `WP_MAIL` email of the dummy user

## Contact

Ole-Paul Heinzelmann</br>
ole.paul.heinzelmann@protonmail.com </br>
<p></p>
<a href="https://www.linkedin.com/in/ole-paul-heinzelmann-a08304258/">
<img alt="linkedin shield" src="https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555" />
</a></br> 

<p align="right">(<a href="#readme-top">back to top</a>)</p>

# Linux, Apache, MySQL, PHP (LAMP) tasks automation scripts

If you are a lazy LAMP developer how wants to run few script to get things done around I have created this repository for your. This is a collection of few scripts (that I'll keep adding on to) that automates few installation and tasks for a LAMP environment.

These script assumes few things up:

1. You have root access to the server / machine you are running the scripts on (You will be asked for the root password when needed)

2. You are running these scripts on a Debian Linux distribution (Eg. Ubuntu) 


## 1. Linux (General Scripts)
### 1.1 Install Lamp Server
#### Script: Linux/install-lamp.sh

If you don't have the LAMP server components installed yet and is lazy to manually install each of the components running this script will only prompt you to enter the root MySQL password you wish to use and will do the rest for for you. It'll also install Phpmyadmin for your convenience.

#### Usage:
```bash
sudo bash Linux/install-lamp.sh
```
*The script will prompt you to enter the MySQL passwords*

### 1.2 Install Webmin Script
#### Script: Linux/install-webmin.sh

If you are familiar with Webmin (http://www.webmin.com) and would like to have it installed for easier management of your server you can run the following script

#### Usage:
```bash
sudo bash Linux/install-webmin.sh
```

## 2. Apache
### 2.1 New Site Creation
#### Script: Apache/create-apache2-site.sh

Automates the process of adding new sites by creating virtual hosts in your apache2 server configurations, activates it and adds the new site's domain to the hosts file of your system.

#### Usage:

```bash
sudo bash Apache/create-apache2-site.sh
```
*The script will prompt you to enter few configuration values here, the domain name, path to site root, etc ...*


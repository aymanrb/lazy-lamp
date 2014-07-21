# Linux, Apache, MySQL, PHP (LAMP) tasks automation scripts

If you are a "Lazy LAMP" developer who wants to run few script to get things, then this repository is for your. This is a collection of few scripts (that I'll keep adding to) that automates few installation commands and tasks for your LAMP environment.

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

### 1.3 Install Linux Handy Tools
#### Script: Linux/install-essntials.sh

A script that automates the installation of VIM and GIT.

#### Usage:
```bash
sudo bash Linux/install-essntials.sh
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


## 3. MySQL
### 3.1 Database Backup
#### Script: Mysql/full-backup.sh

Automates the dumping of the whole MySQL database in one since command and stores the dumped files on a local directory

#### Usage:

```bash
sudo bash Mysql/full-backup.sh
```

## 4. PHP
### 4.1 Install Useful PHP5 Modules
#### Script: Mysql/install_modules.sh

Installs PHP modules like Curl and Imap

#### Usage:

```bash
sudo bash Mysql/install_modules.sh
```






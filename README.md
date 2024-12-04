![image](https://github.com/Ellwould/poc-x/blob/main/etc/logo.jpeg)

### poc-x (phpMyAdmin, oauth2-proxy, client-certificate and nginx) stack.

<br>

### Software required for poc-x stack:

![image](https://github.com/Ellwould/poc-x/blob/main/poc-x_software.jpeg)

<br>

### Additional Software Required:

- apt install php-mbstring
- apt install php8.3-mysqli
- apt install php8.3-fpm

<br>

### Additional Database Steps Required:

- CREATE DATABASE phpmyadmin;
- CREATE USER 'phpmyadmin'@'localhost' IDENTIFIED BY '(INSERT PASSWORD)';
- GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP ON `phpmyadmin`.* TO `phpmyadmin`@`localhost`;
- GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP ON `(INSERT DATABASE NAME)`.* TO `phpmyadmin`@`localhost`; <b>OR</b> GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP ON \*.\* TO `phpmyadmin`@`localhost`;

<br>

## Additional GNU/Linux Steps Required:

- mkdir /etc/nginx/phpMyAdmin
- mkdir /etc/nginx/phpMyAdmin/tmp
- 

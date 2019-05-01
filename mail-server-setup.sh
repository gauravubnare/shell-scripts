echo "################# Setting up Mail Server #################"
echo "Please Enter your Gmail Id "
read email
echo "Please Enter you Gmail Password"
read pass
sudo yum install postfix mailx cyrus-sasl cyrus-sasl-plain -y
echo "[smtp.gmail.com]:587 $email:$pass" >> /etc/postfix/sasl_passwd | sudo bash
chmod 777 /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd
echo "relayhost = [smtp.gmail.com]:587" >> /etc/postfix/main.cf | sudo bash
 echo "smtp_sasl_auth_enable = yes" >> /etc/postfix/main.cf | sudo bash
 echo "smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd" >> /etc/postfix/main.cf | sudo bash
 echo "smtp_sasl_security_options =" >> /etc/postfix/main.cf | sudo bash
 echo "smtp_tls_security_level = encrypt" >> /etc/postfix/main.cf | sudo bash
 echo "smtp_tls_security_level = encrypt" >> /etc/postfix/main.cf | sudo bash
 echo "smtp_tls_CAfile = /etc/ssl/certs/ca-bundle.crt" >> /etc/postfix/main.cf | sudo bash
## Update Selinux Context
restorecon -vvRF /etc
sudo systemctl restart postfix
sudo systemctl enable postfix
sudo systemctl reload postfix


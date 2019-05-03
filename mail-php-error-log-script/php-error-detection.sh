##Script to send error logs by mail
error=$(tail -n 15 /var/log/httpderror_log | grep -i "Parse error")
error2=$(tail -n 15 /var/log/httpderror_log | grep -i "fatal error")
echo $error > /root/send-mail.txt
echo " "  >> /root/send-mail.txt
echo $error2 >> /root/send-mail.txt
count=$(cat /root/send-mail.txt | wc -l)
if [ "$count" == "1" ]
then
 mail -s "Error Detected" abc@gmail.com < /root/send-mail.txt
else
 echo "No Error"
fi

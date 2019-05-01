echo "Please Enter a Log file Path"
read log
echo "Please Enter a Mail Addreess whom you want to send the error report"
read mail
## Script Setup for PHP Error Through Logs
echo "error=$(tail -n 15 $log | grep -i GET)" > /root/error-detection.sh
echo "$log" > /root/error-detection.sh
#echo "echo $error >> /root/send-mail.txt" >> /root/error-detection.sh
#echo "count=$(cat /root/send-mail.txt | wc -l)" >> /root/error-detection.sh
echo 'if [ "$count" == "1" ]' >> /root/error-detection.sh
echo 'then' >> /root/error-detection.sh
echo '  mail -s "Error Detected" "$mail" < /root/send-mail.txt' >> /root/error-detection.sh
echo 'else' >> /root/error-detection.sh
echo '  echo "No Error"' >> /root/error-detection.sh
echo 'fi' >> /root/error-detection.sh

## Crontab Setup






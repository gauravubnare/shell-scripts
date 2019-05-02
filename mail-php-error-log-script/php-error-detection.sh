
## Script Setup for PHP Error Through Logs
error=$(tail -n 15 $logfilepath | grep -i GET)
echo $error >> /root/send-mail.txt
count=$(cat /root/send-mail.txt | wc -l)
if [ "$count" == "1" ]
then
  mail -s "Error Detected"  < /root/send-mail.txt
else 
  echo "No Error"
fi







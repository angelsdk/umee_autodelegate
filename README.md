##umee_autodelegate
*Copy files to root folder*

##Create symbolic link

ln -s /root/umee_dl.service /etc/systemd/system

##Enable and restart service

systemctl enable umee_dl.service

systemctl daemon-reload

systemctl restart umee_dl.service

##Logs

journalctl -u umee_dl.service -f

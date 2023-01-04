# Setting Up NGINX

```
sudo apt update
sudo apt install -y nginx
sudo systemctl status nginx # Status of Nginx Server
sudo systemctl stop nginx # stop the Nginx service
sudo systemctl start nginx # start the Nginx service
sudo systemctl reload nginx # Gracefully Restart Nginx
sudo systemctl restart nginx # Force Restart Nginx
sudo systemctl enable nginx # Configure Nginx to Launch on Boot
sudo systemctl disable nginx # disable Nginx service

or

sudo /etc/init.d/nginx start

or

sudo nginx -s restart

or 

sudo nginx -s quit # force to quit
```

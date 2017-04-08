server {
       listen 80;
       server_name where2fly2.com;

       location / {
         proxy_pass w2f2:3000;
        }
    }

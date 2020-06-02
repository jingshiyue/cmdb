server {
	charset utf-8;
	listen 8001;
	server_name www.daxigua.asia;
 
	location /static {
		alias /home/user/sites/www.daxigua.asia/blogproject/static; 
	}

	location / {
		proxy_set_header Host $host;
		proxy_pass http://unix:/tmp/www.daxigua.asia.socket;
	}
}

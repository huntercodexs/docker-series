# Application with PHP 8.1
#
server {
	listen 80;

	root /var/www/applications;
	index index.php;
	server_name php81.example.com;

	location ~* \.php$ {
		# With php-fpm unix sockets
		fastcgi_pass php81-fpm;
		include         fastcgi_params;
		fastcgi_param   SCRIPT_FILENAME    $document_root$fastcgi_script_name;
		fastcgi_param   SCRIPT_NAME        $fastcgi_script_name;
	}
}
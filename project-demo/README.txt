Steps:
1. Setup Stack (refer to stack.sh)
2. Setup NGINX Configuration to allow it to communicate with PHP-FPM at /usr/local/openresty/nginx/conf/nginx.conf
3. Setup PostgreSQL's user and password
4. Upload files via scp or edit via VIM editor eg (scp -r -i anktiCentos.pem "/c/Users/ankit.tomar/Homework/project-demo/"* centos@52.57.63.176:/usr/local/openresty/nginx/html)
5. Create Necessary SQL Tables
6. Create Backend (refer to backend.php)
7. Create Frontend (refer to index.php)
scp -r -i anktiCentos.pem "/c/Users/ankit.tomar/Homework/project-demo/"* centos@18.185.101.99:/home/centos

set -ex

PROJECT=aero
USER=app
SERVER=ssh-cumin.kapochamo.com 

ssh-add ~/.ssh/garnet-prod.pem ~/.ssh/cumin.pem

scp index.html nginx.conf $USER@$SERVER:/home/$USER/$PROJECT/
ssh $USER@$SERVER "sudo nginx -t && sudo nginx -s reload"


# Create a symlink on the server: 
#   ssh $USER@$SERVER "sudo ln -sf /home/$USER/$PROJECT/nginx.conf /etc/nginx/conf.d/"
# Restart NGINX
#   sudo nginx -t && sudo nginx -s reload

#!/bin/bash

if [ -f /etc/nginx/sites-enabled/default ]; then
  sudo rm /etc/nginx/sites-enabled/default
fi

# Nginx подключаем конфиг с помощью символической ссылки
sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf # загрузка нового конфига
sudo /etc/init.d/nginx restart # перезапуск Nginx для применения нового конфига

# Gunicorn
sudo ln -sf /home/box/web/etc/gunicorn.conf /etc/gunicorn.d/test # загрузка нового конфига
sudo /etc/init.d/gunicorn restart # перезапуск gunicorn для применения нового конфига

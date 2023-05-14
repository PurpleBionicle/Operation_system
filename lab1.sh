echo ========= Управление доступом в ОС Linux ==============
echo ========= Добавим пользователей и группы =============

sudo useradd -m support
sudo passwd support 
sudo useradd -m security 
sudo passwd security
sudo useradd -m app_support
sudo passwd app_support
sudo usermod -a -G  app_support app_support
sudo usermod -a -G  app_support support
sudo usermod -a -G  app_support security
sudo usermod -a -G support support
sudo usermod -a -G support security
sudo usermod -a -G security secirity

echo ========= настроим доступ для app_support  =============
cd /etc/nginx/
sudo chmown -R app_support:app_support
sudo chmod -R 770 ./

echo ========= нет в группе - нет доступа  =============
ls -la 
echo ========= из-под пользователя владельца  =============
sudo -u app_support ls -la

echo в sudoers пропишем ограничения на использованией этой группы sudo команд.
sudo visudo 

echo ========= настроим доступ для support  =============
echo ========= есть доступ у пользователей к судо командам  =============
sudo -u support systemctl status nginx.service

echo ========= запретим использовать команды управлениями сервисом и проверим доступ  =============
sudo  chmod o-x $(which systemctl)
sudo -u app_support systemctl status nginx.service
echo ======= настроем права для него =========
echo ======= дадим доступ к запуску %support ALL = /usr/bin/systemctl =========
sudo visudo
echo ======  not permission ====== 
sudo cat /etc/os-release
echo =======а эту можно ======

sudo systemctl status nginx

echo ===== для security =====
sudo usermod -a -G sudo security 
sudo visudo

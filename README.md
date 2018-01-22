Необходимые модули

sudo cpanm uni::perl
sudo cpanm IO::Socket::SSL
sudo cpanm Mojo::mysql

Запуск скрипта (из директории script)

./feed_fetch ../today_feed.conf 2018-01-22

Пример страницы

http://localhost:3000/today?country=us&date=2018-01-22
# DeployDjango

# Build

- `docker build -t app .`
- `docker run --name app --rm -p 80:80 app`

# 注意点

#### ALLOWED_HOSTS の設定

- 本番環境にデプロイする際には、settings.py の ALLOWED_HOSTS に IP やドメインを記述する必要がある。
- [Apache / Django / WSGI Bad Request（400）エラーのデバッグ](https://www.it-swarm.dev/ja/python/apache-django-wsgi-bad-request%EF%BC%88400%EF%BC%89%E3%82%A8%E3%83%A9%E3%83%BC%E3%81%AE%E3%83%87%E3%83%90%E3%83%83%E3%82%B0/1042928805/)

#### Docker コンテナを動かす環境によって設定が変わる

- OS が Ubuntu Server18.04(64bit x86) のときは、 `/usr/local/lib/python3.6/site-packages/mod_wsgi/server/mod_wsgi-py36.cpython-36m-x86_64-linux-gnu.so`

- OS が Raspbian(32bit arm) のときは、
  `/usr/local/lib/python3.6/site-packages/mod_wsgi/server/ mod_wsgi-py36.cpython-36m-arm-linux-gnueabihf.so`

```
Copying '/usr/local/lib/python3.6/site-packages/django/contrib/admin/static/admin/css/fonts.css'

61 static files copied to '/app/mysite/static'.
apache2: Syntax error on line 147 of /etc/apache2/apache2.conf: Syntax error on line 1 of /etc/apache2/mods-enabled/mysite.conf: Cannot load /usr/local/lib/python3.6/site-packages/mod_wsgi/server/mod_wsgi-py36.cpython-36m-x86_64-linux-gnu.so into server: /usr/local/lib/python3.6/site-packages/mod_wsgi/server/mod_wsgi-py36.cpython-36m-x86_64-linux-gnu.so: cannot open shared object file: No such file or directory
Action '-D FOREGROUND' failed.
The Apache error log may have more information.
```

- [Raspberry Pi 用のコンテナをクラウドでビルドする方法 ](https://www.slideshare.net/ShunsukeKikuchi1/raspberry-pi-147400803)

- [クラウド上で ARM 用コンテナをビルドする](https://note.com/kikuzokikuzo/n/na2e82c1c8835)

#### 補足

- `getconf LONG_BIT` で Linux カーネルの bit 数を確認できる

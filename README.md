# DeployDjango

# Build
- `docker build -t app .`
- `docker run --name app --rm -p 80:80 app`

# 注意点
- 本番環境にデプロイする際には、settings.pyのALLOWED_HOSTSにIPやドメインを記述する必要がある。
- [Apache / Django / WSGI Bad Request（400）エラーのデバッグ](https://www.it-swarm.dev/ja/python/apache-django-wsgi-bad-request%EF%BC%88400%EF%BC%89%E3%82%A8%E3%83%A9%E3%83%BC%E3%81%AE%E3%83%87%E3%83%90%E3%83%83%E3%82%B0/1042928805/)

# Заметки о Docker

## Полезные команды
- `docker version` / `docker info` — информация о среде
- `docker pull <image>` — скачать образ
- `docker images` — список образов
- `docker run [opts] <image>` — создать и запустить контейнер
- `docker ps -a` — список контейнеров
- `docker logs <container>` — логи
- `docker exec -it <container> sh` — войти в контейнер
- `docker stop/start/rm` — управление контейнерами
- `docker rmi` — удалить образ
- `docker build -t name:tag .` — сборка образа
- `docker compose up -d` / `down` — управление стеком

## Практики
- Использовать минимальные базовые образы (`alpine`, `slim`).
- Применять `.dockerignore`.
- Не хранить секреты в Dockerfile.
- Минимизировать число слоёв и кэшируемость сборки.

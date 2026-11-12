# Docker: история, описание и современное состояние

## Определение
**Docker** — это платформа для разработки, доставки и запуска приложений в контейнерах. Контейнер объединяет приложение и все его зависимости (библиотеки, системные утилиты, настройки) в единый изолированный пакет, который одинаково работает в разных средах.

Ключевые понятия:
- **Образ (image)** — неизменяемый шаблон, из которого создаются контейнеры.
- **Контейнер (container)** — запущенный экземпляр образа.
- **Dockerfile** — сценарий сборки образа.
- **Docker Compose** — инструмент для описания и запуска многоконтейнерных приложений.
- **Реестр (registry)** — хранилище образов (например, Docker Hub).

## История появления и развития
- **2013** — компания dotCloud (позже Docker, Inc.) представила Docker как open-source проект. Основой стали технологии Linux: namespaces и cgroups.
- **2014** — выход Docker 1.0, быстрый рост экосистемы, появление Docker Hub.
- **2015** — создание Open Container Initiative (OCI) для стандартизации форматов образов и runtime; появление Docker Compose и Docker Swarm.
- **2017** — поддержка Kubernetes как оркестратора наряду со Swarm, выделение containerd как отдельного компонента.
- **2019–2020** — развитие rootless-контейнеров, BuildKit, усиление фокуса на безопасности.
- **2021+** — изменения в лицензировании Docker Desktop, рост альтернатив (Podman), развитие Docker Extensions, интеграция с DevSecOps-практиками.

## Современное состояние
Сегодня Docker остается де-факто стандартом контейнеризации в разработке:
- Широко используется в CI/CD, микросервисных архитектурах и локальной разработке.
- Поддерживается на Linux, Windows и macOS (Docker Desktop, WSL2).
- Экосистема включает Docker Engine, BuildKit, Docker Scout, Docker Compose v2.
- В production-оркестрации часто используется Kubernetes, при этом Docker-образы (OCI) остаются основным форматом поставки.

## Docker Hub и готовые образы
**Docker Hub** — крупнейший публичный реестр контейнерных образов (https://hub.docker.com/). Он предоставляет:
- Официальные образы (Official Images): `nginx`, `postgres`, `python`, `node`, `ubuntu`, `alpine` и др.
- Образы от вендоров и сообщества.
- Автоматические сборки, теги версий, описание и документацию.
- Приватные репозитории (по плану).

Готовые образы ускоряют развёртывание: достаточно `docker pull` и `docker run`, вместо ручной установки ПО.

## Dockerfile
**Dockerfile** — текстовый файл с инструкциями для сборки образа. Пример:

```dockerfile
FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8000
CMD ["python", "app.py"]
```

Основные инструкции: `FROM`, `WORKDIR`, `COPY/ADD`, `RUN`, `ENV`, `EXPOSE`, `CMD/ENTRYPOINT`.

Сборка: `docker build -t myapp:1.0 .`

## Docker Compose
**Docker Compose** позволяет описать набор сервисов, сетей и томов в одном YAML-файле (`compose.yml`/`docker-compose.yml`) и запустить их одной командой.

Пример:

```yaml
services:
  db:
    image: postgres:16
    environment:
      POSTGRES_PASSWORD: example
    volumes:
      - db_data:/var/lib/postgresql/data
  app:
    build: .
    ports:
      - "8000:8000"
    depends_on:
      - db
volumes:
  db_data:
```

Запуск: `docker compose up -d`

## Заключение
Docker упростил доставку ПО, сделал окружения воспроизводимыми и стал ключевым инструментом современной DevOps-культуры. Связка Dockerfile + Docker Hub + Docker Compose покрывает большую часть задач — от локальной разработки до подготовки приложений к production.

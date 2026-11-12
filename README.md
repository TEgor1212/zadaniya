# Практические работы

Репозиторий с выполненными практическими и самостоятельными работами по дисциплинам, связанным с Git, Markdown, Bash, Docker и документированием.

Все материалы находятся в каталоге [`practical-work/`](./practical-work).

## Состав работ

| № | Работа | Каталог | Что внутри |
|---|--------|---------|------------|
| 1 | Командная строка Bash | [`bash-cli/`](./practical-work/bash-cli) | Готовая структура каталогов учебных проектов: `webapp`, `framework`, `project-x`, а также файлы-заготовки |
| 2 | Bash-скрипты | [`bash-scripts/`](./practical-work/bash-scripts) | Скрипты №1–10 (приветствие, сумма, чётность, структура проекта, подсчёт строк, пароль, поиск по расширению, статистика GitHub) и демо-проект |
| 3 | Привлекательный README | [`beautiful-readme/`](./practical-work/beautiful-readme) | Пример оформления README с навигацией, якорями, таблицами, кодом и диаграммами Mermaid |
| 4 | Документация по качеству | [`docs-quality/`](./practical-work/docs-quality) | Требования к качеству, стратегия тестирования, шаблон инцидента и описание дашборда для сервиса HealthMonitor |
| 5 | Диаграммы Mermaid | [`mermaid/`](./practical-work/mermaid) | Решения заданий уровней 1–4: блок-схемы, sequence, class, state, ER и другие диаграммы |
| 6 | История Docker | [`docker-history/`](./practical-work/docker-history) | История, описание и современное состояние Docker, Docker Hub, Dockerfile и Compose |
| 7 | Портфолио | [`portfolio/`](./practical-work/portfolio) | Шаблон портфолио разработчика с описанием навыков и примером проекта |
| 8 | Синхронизация репозиториев | [`script-sync/`](./practical-work/script-sync) | Скрипты `sync-repos.sh` и `sync-repos.ps1` для синхронизации локальных репозиториев |
| 9 | Обновление приложений | [`upgrade-apps/`](./practical-work/upgrade-apps) | Скрипты `upgrade-all.sh` и `upgrade-all.ps1` для массового обновления ПО в Linux/macOS и Windows |

## Структура репозитория

```text
.
├── LICENSE
├── README.md
└── practical-work
    ├── bash-cli
    ├── bash-scripts
    ├── beautiful-readme
    ├── docker-history
    ├── docs-quality
    ├── mermaid
    ├── portfolio
    ├── script-sync
    └── upgrade-apps
```

## Быстрый старт

### Bash-скрипты

```bash
cd practical-work/bash-scripts/scripts
chmod +x ./*.sh
./1_hello.sh
```

### Синхронизация репозиториев

```bash
cd practical-work/script-sync
chmod +x sync-repos.sh
./sync-repos.sh /path/to/source-repo /path/to/target-repo
```

### Обновление приложений

Linux (Ubuntu/Debian):

```bash
cd practical-work/upgrade-apps
chmod +x upgrade-all.sh
./upgrade-all.sh
```

Windows (PowerShell):

```powershell
cd practical-work\upgrade-apps
.\upgrade-all.ps1
```

### Документация и диаграммы

Откройте нужный `README.md` в редакторе с поддержкой Markdown/Mermaid, например в VS Code, или на GitHub — диаграммы отображаются автоматически.

## Требования

- **Git** — для клонирования репозитория.
- **Bash** — для `.sh`-скриптов (Linux, macOS, WSL или Git Bash).
- **PowerShell** — для `.ps1`-скриптов (Windows).
- **Docker** — для заданий, связанных с контейнерами (необязательно).
- **VS Code** или другой Markdown-редактор — для просмотра документации и Mermaid-диаграмм.

## Примечания

- Скрипты синхронизации и обновления приложений перед реальным использованием рекомендуется проверить в тестовой среде.
- Часть заданий (GitHub Pages, CI/CD, командная работа, скриншоты интерфейсов) требует внешних сервисов и выполняется вручную.

## Лицензия

Проект распространяется по лицензии [MIT](./LICENSE).

# Скрипт синхронизации репозиториев

Скрипты для синхронизации локального репозитория с удалённым (`git pull`) и копирования его содержимого (кроме `.git`) в другой локальный репозиторий с заменой файлов.

## Файлы
- `sync-repos.sh` — версия для Bash (Linux/macOS/WSL/Git-Bash)
- `sync-repos.ps1` — версия для PowerShell (Windows)

## Использование (Bash)
```bash
./sync-repos.sh /path/to/source-repo /path/to/target-repo [--push-target]
```
- `--push-target` (опционально) — после копирования выполнить `git add/commit/push` в целевом репозитории.

## Использование (PowerShell)
```powershell
.\sync-repos.ps1 -SourceRepo "C:\path\source" -TargetRepo "C:\path\target" [-PushTarget]
```

## Как работает
1. Проверяет существование путей и что source — git-репозиторий.
2. Выполняет `git pull` в source.
3. Копирует содержимое source в target, исключая `.git` (`rsync` в bash или `robocopy`/`Copy-Item` с фильтром в PowerShell).
4. Опционально коммитит и пушит изменения в target.

## Замечания
- Скрипт не использует русские имена/пробелы в логике, но работает с любыми путями.
- Перед использованием на реальных данных рекомендуется тест в отдельной директории/контейнере.

# Скрипт обновления установленных приложений

Скрипты для массового обновления приложений в разных ОС.

## Файлы
- `upgrade-all.sh` — Linux/macOS
- `upgrade-all.ps1` — Windows (winget)

## Linux (Ubuntu/Debian)
```bash
./upgrade-all.sh
```
Выполняет:
```bash
sudo apt list --upgradable -a && sudo apt update && sudo apt full-upgrade -y
```

## macOS
```bash
./upgrade-all.sh --mac
```
Выполняет:
```bash
sudo softwareupdate -ia
```

## Windows 10/11 (PowerShell)
```powershell
.\upgrade-all.ps1
```
Выполняет:
```powershell
winget upgrade --all
```

## Примечания
- Для визуального контроля запускайте в отдельном окне терминала.
- Перед автозапуском протестируйте в виртуальной машине/контейнере (где применимо).

# Настройка бота на сервере

## Автоматический запуск через systemd

1. Клонировать репозиторий:
```bash
git clone https://github.com/sirdebar/zayava.git
cd zayava
```

2. Установить зависимости (рекомендуется использовать виртуальное окружение):
```bash
python -m venv venv
source venv/bin/activate  # для Linux/Mac
# или
venv\Scripts\activate.bat  # для Windows

pip install -r requirements.txt
```

3. Настроить файл .env с токеном бота (если еще не настроен)

4. Настроить службу systemd (только для Linux):
   
   a. Отредактировать файл `zayava.service`, указав правильные пути:
   ```
   WorkingDirectory=/полный/путь/к/zayava
   Environment="PATH=/полный/путь/к/zayava/venv/bin"
   ExecStart=/полный/путь/к/zayava/venv/bin/python main.py
   ```
   
   b. Скопировать файл службы в systemd:
   ```bash
   sudo cp zayava.service /etc/systemd/system/
   ```
   
   c. Включить и запустить службу:
   ```bash
   sudo systemctl daemon-reload
   sudo systemctl enable zayava.service
   sudo systemctl start zayava.service
   ```
   
   d. Проверить статус:
   ```bash
   sudo systemctl status zayava.service
   ```

## Автоматический перезапуск

Служба настроена на автоматический перезапуск в случае сбоя. Если вы внесли изменения в код бота, перезапустите службу:

```bash
sudo systemctl restart zayava.service
```

## Просмотр логов

Для просмотра логов работы бота используйте:

```bash
sudo journalctl -u zayava.service -f
```

## Настройка на Windows

Для Windows можно использовать Task Scheduler или создать bat-файл для запуска и добавить его в автозагрузку:

1. Создать файл `start_bot.bat`:
```
@echo off
cd /d %~dp0
venv\Scripts\python.exe main.py
pause
```

2. Создать ярлык на этот файл и поместить его в папку автозагрузки:
```
%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
``` 
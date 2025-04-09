@echo off
echo Запуск бота Zayava...

REM Проверка наличия виртуального окружения
if not exist venv (
    echo Создание виртуального окружения...
    python -m venv venv
)

REM Активация виртуального окружения
call venv\Scripts\activate.bat

REM Установка зависимостей
echo Установка зависимостей...
pip install -r requirements.txt

REM Запуск бота
echo Запуск бота...
python main.py

pause 
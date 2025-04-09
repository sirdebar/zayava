#!/bin/bash

# Обновление системы
echo "Обновление системы..."
apt update && apt upgrade -y

# Установка Python и необходимых пакетов
echo "Установка Python и необходимых пакетов..."
apt install -y python3 python3-venv python3-pip

# Создание виртуального окружения
echo "Создание виртуального окружения..."
cd /root/zayava
python3 -m venv venv
source venv/bin/activate

# Установка зависимостей
echo "Установка зависимостей..."
pip install -r requirements.txt

# Копирование файла службы
echo "Установка службы systemd..."
cp zayava.service /etc/systemd/system/

# Включение и запуск службы
echo "Включение и запуск службы..."
systemctl daemon-reload
systemctl enable zayava.service
systemctl start zayava.service

# Проверка статуса службы
echo "Проверка статуса службы:"
systemctl status zayava.service

echo "Служба успешно установлена и запущена. Для просмотра логов используйте команду:"
echo "journalctl -u zayava.service -f" 
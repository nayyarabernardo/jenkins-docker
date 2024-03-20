#!/bin/bash

# Atualizar repositórios
sudo apt-get update

# Instalar OpenJDK e MySQL
sudo apt-get install -y openjdk-8-jdk mysql-server

# Criar usuários
sudo mysql -e "CREATE USER 'devops'@'%' IDENTIFIED BY 'mestre';"
sudo mysql -e "CREATE USER 'devops_dev'@'%' IDENTIFIED BY 'mestre';"

# Criar bancos de dados
sudo mysql -e "CREATE DATABASE todo;"
sudo mysql -e "CREATE DATABASE todo_dev;"
sudo mysql -e "CREATE DATABASE test_todo_dev;"

# Conceder privilégios
sudo mysql -e "GRANT ALL PRIVILEGES ON todo.* TO 'devops'@'%' IDENTIFIED BY 'mestre';"
sudo mysql -e "GRANT ALL PRIVILEGES ON todo_dev.* TO 'devops_dev'@'%' IDENTIFIED BY 'mestre';"
sudo mysql -e "GRANT ALL PRIVILEGES ON test_todo_dev.* TO 'devops_dev'@'%' IDENTIFIED BY 'mestre';"

# Reiniciar serviço do MySQL
sudo systemctl restart mysql
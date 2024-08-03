#!/bin/bash

set -euxo pipefail

# Установите необходимые переменные
GIT_REPO_URL="gitlab.apps.corp/ictsbso/mepas/mepas-gen2-sandbox-ext/testcas.git"
GIT_BRANCH="master"
ACCESS_TOKEN="pMzx_8pmQXCqZc8SrFoW"
CLONE_DIR="/tmp/config"
CP_DIR="/tmp/config/etc/cas/config"

# Проверка переменных
echo "Cloning from branch: $GIT_BRANCH of repo: $GIT_REPO_URL"

# Клонируем репозиторий
git clone --branch "$GIT_BRANCH" "https://oauth2:$ACCESS_TOKEN@$GIT_REPO_URL" "$CLONE_DIR"

# Проверяем, что файлы существуют
if [ -f "$CLONE_DIR/log4j2.xml" ] && [ -f "$CLONE_DIR/cas.properties" ]; then
    # Копируем файлы в нужное место
    cp "$CP_DIR/log4j2.xml" /etc/cas/config/log4j2.xml
    cp "$CP_DIR/cas.properties" /etc/cas/config/cas.properties
    echo "Configuration files copied successfully."
else
    echo "Configuration files not found!"
    exit 1
fi

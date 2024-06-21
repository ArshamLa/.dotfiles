#!/bin/bash

# Définir l'URL de téléchargement et le nom du fichier
URL="https://discord.com/api/download/stable?platform=linux&format=deb"
FILE="discord.deb"

# Chemin vers le fichier .deb actuellement installé (vous devrez peut-être ajuster ce chemin)
INSTALLED_FILE="/var/lib/dpkg/info/discord.list"

# Fonction pour vérifier la version de Discord installée
get_installed_version() {
    dpkg-query -W -f='${Version}' discord
}

# Fonction pour obtenir la dernière version disponible en ligne
get_latest_version() {
    wget -qO- https://discord.com/api/download/stable?platform=linux&format=deb --server-response 2>&1 | grep -oP '(?<=^Location: ).*(?=/discord-.*\.deb)'
}

# Vérifier si Discord est installé
if dpkg-query -l discord > /dev/null 2>&1; then
    installed_version=$(get_installed_version)
else
    installed_version="none"
fi

# Obtenir la dernière version disponible
latest_version=$(get_latest_version)

# Comparer les versions
if [ "$installed_version" != "$latest_version" ]; then
    echo "Une mise à jour de Discord est disponible. Téléchargement et installation de la nouvelle version..."
    
    # Télécharger la nouvelle version
    wget -O $FILE $URL
    
    # Installer la nouvelle version
    sudo dpkg -i $FILE
    
    # Supprimer le fichier téléchargé
    rm $FILE
else
    echo "Discord est déjà à jour."
fi

# Lancer Discord
discord &

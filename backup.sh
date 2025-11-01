#!/bin/sh


if [ -z "$1" ]; then
    echo "❌ Error: empty file."
    echo "Use: $0 <file>"
    exit 1
fi


read -p "Write your OS (Ubuntu | Windows(WSL) | ArchLinux): " os


os=$(echo "$os" | tr '[:upper:]' '[:lower:]')


case "$os" in
    ubuntu|archlinux)
        BACKUP_DIR="/home/$USER/.recovim_backups"
        ;;
    windows|wsl)
        BACKUP_DIR="/mnt/c/Users/$USER/.recovim_backups"
        ;;
    *)
        echo "Route to... /home/$USER/.recovim_backups"
        BACKUP_DIR="/home/$USER/.recovim_backups"
        ;;
esac

mkdir -p "$BACKUP_DIR"


if [ -f "$1" ]; then
    cp -R "$1" "$BACKUP_DIR/$(basename "$1")_$(date +%F_%H-%M-%S)"
    echo "Succefully on: $BACKUP_DIR"
else
    echo "⚠️ New file, dont need a new copy"
fi

# Lanzar tu editor
./build/project "$1"

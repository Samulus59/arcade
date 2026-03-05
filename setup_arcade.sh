#!/bin/bash
set -e

echo "=============================="
echo "  Setup Arcade Raspberry Pi"
echo "=============================="

# -------- CONFIG --------
VENV_DIR="$HOME/arcade-venv"

# -------- APT UPDATE --------
echo "[*] Mise à jour des dépôts..."
sudo apt update

# -------- JAVA --------
if ! command -v java >/dev/null 2>&1; then
  echo "[*] Installation de Java..."
  sudo apt install -y default-jre
else
  echo "[OK] Java déjà installé"
fi

# -------- PYTHON --------
if ! command -v python3 >/dev/null 2>&1; then
  echo "[*] Installation de Python3..."
  sudo apt install -y python3 python3-full
else
  echo "[OK] Python3 déjà installé"
fi

# -------- VENV --------
echo "[*] Installation python3-venv..."
sudo apt install -y python3-venv python3-pip

if [ ! -d "$VENV_DIR" ]; then
  echo "[*] Création du venv dans $VENV_DIR"
  python3 -m venv "$VENV_DIR"
else
  echo "[OK] venv déjà existant"
fi

# -------- ACTIVATE VENV --------
source "$VENV_DIR/bin/activate"

echo "[*] Mise à jour pip..."
pip install --upgrade pip

# -------- PYTHON LIBS --------
echo "[*] Installation pygame et librosa dans le venv..."
pip install pygame librosa

# -------- LOVE2D --------
if ! command -v love >/dev/null 2>&1; then
  echo "[*] Installation LÖVE (love2d)..."
  sudo apt install -y love
else
  echo "[OK] LÖVE déjà installé"
fi

# -------- SUMMARY --------
echo "=============================="
echo "  Installation terminée !"
echo "=============================="
echo ""
echo "Venv : $VENV_DIR"
echo ""
echo "Pour l'utiliser :"
echo "  source $VENV_DIR/bin/activate"
echo ""
echo "Vérification :"
echo "  python -c \"import pygame, librosa; print('OK')\""
echo "

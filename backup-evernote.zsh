#!/usr/bin/env zsh

script_path="$(pwd -P)"

source "${HOME}/.zshrc"
source "${HOME}/.zprofile"

osascript "${script_path}/evernote_backup.scpt" "${script_path}/source/evernote_export.enex"

backup perform --trigger evernote_backup --root-path "${script_path}/Backup/"

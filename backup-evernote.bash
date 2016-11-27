#!/usr/bin/env bash

export PATH=/Users/hirofumiwakasugi/.rbenv/shims:/Users/hirofumiwakasugi/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

script_path=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
cd "${script_path}"

# osascript "${script_path}/evernote_backup.scpt" "${script_path}/source/evernote_export.enex"
osascript "./evernote_backup.scpt" "${script_path}/source/evernote_export.enex"

# backup perform --trigger evernote_backup --root-path "${script_path}/Backup/"
backup perform --trigger evernote_backup --root-path "./Backup/"

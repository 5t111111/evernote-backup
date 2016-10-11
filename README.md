# Evernote Backup

Evernote backup script for macOS.

- Export Evernote using AppleScript
- Backup an exported via [Backup](https://github.com/backup/backup)
- Slack notification

## Prerequisites

- Ruby
- Zsh

and you also have to install the flowwing gems:

```
$ gem install backup
$ gem install dotenv
```

## Usage

Create `.env` by copying the example file:

```
$ cp .env.example .env
```

After mdifing `.env`, run:

```
$ ./backup-evernote.zsh
```
At first it waits for 5 minutes for the case of that there are remaining notes should be synced before exporting. After that, it starts exporting all existing notes and takes a while depends on your Evernote size.

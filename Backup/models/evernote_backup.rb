# encoding: utf-8

##
# Backup Generated: file_backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t file_backup [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://backup.github.io/backup
#
require 'dotenv'
Dotenv.load

PATH_TO_ROOT = File.expand_path('../../../', __FILE__)

Model.new(:evernote_backup, 'Backups exported Evernote archive') do
  ##
  # Archive [Archive]
  #
  # Adding a file or directory (including sub-directories):
  #   archive.add "/path/to/a/file.rb"
  #   archive.add "/path/to/a/directory/"
  #
  # Excluding a file or directory (including sub-directories):
  #   archive.exclude "/path/to/an/excluded_file.rb"
  #   archive.exclude "/path/to/an/excluded_directory
  #
  # By default, relative paths will be relative to the directory
  # where `backup perform` is executed, and they will be expanded
  # to the root of the filesystem when added to the archive.
  #
  # If a `root` path is set, relative paths will be relative to the
  # given `root` path and will not be expanded when added to the archive.
  #
  #   archive.root '/path/to/archive/root'
  #
  archive :evernote do |archive|
    # Run the `tar` command using `sudo`
    # archive.use_sudo

    archive.root File.join(PATH_TO_ROOT, 'source')
    archive.add 'evernote_export.enex'
  end

  ##
  # Local (Copy) [Storage]
  #
  store_with Local do |local|
    local.path       = File.join(PATH_TO_ROOT, 'Backup', 'backups')
    local.keep       = 5
    # local.keep       = Time.now - 2592000 # Remove all backups older than 1 month.
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

  ##
  # Slack [Notifier]
  #
  notify_by Slack do |slack|
    slack.on_success = true
    slack.on_warning = true
    slack.on_failure = true

    # The incoming webhook url
    # https://hooks.slack.com/services/xxxxxxxx/xxxxxxxxx/xxxxxxxxxx
    slack.webhook_url = ENV['SLACK_WEBHOOK_URL']

    ##
    # Optional
    #
    # The channel to which messages will be sent
    # slack.channel = 'my_channel'
    #
    # The username to display along with the notification
    # slack.username = 'my_username'
  end
end

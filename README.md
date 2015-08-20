## mydumper-backup

[![Build Status](https://travis-ci.org/Oefenweb/ansible-mydumper-backup.svg?branch=master)](https://travis-ci.org/Oefenweb/ansible-mydumper-backup) [![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-mydumper--backup-blue.svg)](https://galaxy.ansible.com/list#/roles/3746)

Perform backups using [mydumper](https://launchpad.net/mydumper).

#### Requirements

* `mydumper` (will not be installed)

#### Variables

* `mydumper_backup_install_path`: [default: `/usr/local/bin`]: Install directory
* `mydumper_backup_mydumper_path`: [default: `/usr/local/bin`]: Path to `mydumper`
* `mydumper_backup_myloader_path`: [default: `mydumper_backup_mydumper_path`]: Path to `myloader`

* `mydumper_backup_backup_databases`: [default: `[]`]: Database(s) to backup
* `mydumper_backup_restore_databases`: [default: `mydumper_backup_backup_databases`]: Database(s) to restore

* `mydumper_backup_backup_path`: [default: `/tmp`]: Directory to backup to
* `mydumper_backup_restore_path`: [default: `mydumper_backup_backup_path`]: Directory to restore from

* `mydumper_backup_host`: [optional, default `localhost`]: The host to connect to
* `mydumper_backup_user`: [optional]: User with privileges to run the dump
* `mydumper_backup_password`: [optional]: User password

* `mydumper_backup_threads`: [optional, default: `4`]: Number of threads to use (e.g. `"{{ (ansible_processor_vcpus / 2) | round(0, 'ceil') }}"`)
* `mydumper_backup_compress`: [optional, default: `false`]: Compress output files
* `mydumper_backup_build_empty_files`: [optional, default: `false`]: Build dump files even if no data available from table
* `mydumper_backup_overwrite_tables`: [optional, default: `false`]: Drop any existing tables when restoring schemas

## Dependencies

None

#### Example

```yaml
---
- hosts: all
  roles:
   - mydumper-backup
```

#### License

MIT

#### Author Information

Mischa ter Smitten

#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Oefenweb/ansible-mydumper-backup/issues)!

## mydumper-backup

[![Build Status](https://travis-ci.org/Oefenweb/ansible-mydumper-backup.svg?branch=master)](https://travis-ci.org/Oefenweb/ansible-mydumper-backup) [![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-mydumper--backup-blue.svg)](https://galaxy.ansible.com/list#/roles/3746)

Perform backups using mydumper.

#### Requirements

* `mydumper` (will not be installed)

#### Variables

* `mydumper_backup_install_dir`: [default: `/usr/local/bin`]: Install directory
* `mydumper_backup_mydumper_path`: [default: `/usr/local/bin`]: Path to `mydumper`

* `mydumper_backup_databases`: [default: `[]`]: Database(s) to dump
* `mydumper_backup_outputdir`: [default: `/tmp`]: Directory to output files to
* `mydumper_backup_host`: The host to connect to (**optional**)
* `mydumper_backup_user`: Username with privileges to run the dump (**optional**)
* `mydumper_backup_password`: User password (**optional**)
* `mydumper_backup_threads`: [default: `4`]: Number of threads to use (**optional**, e.g. `"{{ (ansible_processor_vcpus / 2) | round(0, 'ceil') }}"`)
* `mydumper_backup_compress`: [default: `false`]: Compress output files (**optional**)
* `mydumper_backup_build_empty_files`: [default: `false`]: Build dump files even if no data available from table (**optional**)

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

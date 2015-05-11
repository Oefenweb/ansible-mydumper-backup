## mydumper-backup

[![Build Status](https://travis-ci.org/Oefenweb/ansible-mydumper-backup.svg?branch=master)](https://travis-ci.org/Oefenweb/ansible-mydumper-backup) [![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-mydumper--backup-blue.svg)](https://galaxy.ansible.com/list#/roles/3746)

Perform backups using mydumper.

#### Requirements

* `mydumper`

#### Variables

* `mydumper_backup_install_dir` [default: `/usr/local/bin`]: Install directory

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

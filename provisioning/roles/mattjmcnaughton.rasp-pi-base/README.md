Role Name
=========

Base configuration for rasp pi server.

It performs the following actions:

- Install commonly used packages.
- Install common configs.
- Set up security updates (or should that come in a separate hardening role)
- Set up hardening (SSH config)
- Set up firewall
- Register w/ DNS

Requirements
------------

This playbook assumes we've already applied the
`mattjmcnaughton.rasp-pi-from-scratch-init` playbook to the host.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

License
-------

Apache

mattjmcnaughton.rasp-pi-cleanup
=========

Clean up steps to take after running
`mattjmcnaughton.rasp-pi-from-scratch-init`. Its a separate role, bc it should
be run via a separate `ansible-playbook` run (bc will use separate ssh
connection).

Note, if I start provisioning locally hosted servers OTHER than Rasp Pis, I will
look into more generic naming.

We aim to keep this role as lightweight as possible - we'll typically run it by
itself as a second step for any new Rasp Pi, but will want to write later
roles/playbooks assuming the things it provides are already in place.

This role configures the following:
- Delete the default `ubuntu` user.
- Disable password ssh.

Role Variables
--------------

See `vars/main.yml`.

Dependencies
------------

This role assumes that you've provisioned a way to communicate w/ the server
outside of password ssh on the `ubuntu` user.

Example Playbook
----------------

TBD.

License
-------

Apache

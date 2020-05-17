mattjmcnaughton.rasp-pi-from-scratch-init
=========

Provision a rasp-pi from scratch. This role makes no assumptions _other_ than
the Rasp Pi is accessible via the Internet, and there's SOME user who is allowed
to sudo with which we can run the initial playbook.

Note, if I start provisioning locally hosted servers OTHER than Rasp Pis, I will
look into more generic naming.

We aim to keep this role as lightweight as possible - we'll typically run it by
itself as a first step for any new Rasp Pi, but will want to write later
roles/playbooks assuming the things it provides are already in place.

This role configures the following:
- A hostname.
- Wireless networking configuration which survives a reboot.
- A password protected new user with which we can SSH using public key auth.
- Create filesystem on disk and mount (optional)
  - Configure filesystem
  - Determine the default mount for the file system and mount (temporarily and
    permanently)

This role _does not_ configure any of the following:
- Clean up the `ubuntu` user... we will need to perform that action in a later
  role.
- Installing specific applications/configs.

Role Variables
--------------

See `vars/main.yml`.

Dependencies
------------

This role assumes _nothing_ about the underlying machine that its running on,
other than that your able to access it _somehow_.

Example Playbook
----------------

TBD.

License
-------

Apache

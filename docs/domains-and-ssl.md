# ssl-and-domains

To start, we use mattjmcnaughton.io as the domain name for all self-hosted
services.

We use the `mattjmcnaughton.io` ssl certs. See
https://github.com/mattjmcnaughton/nuage/blob/master/docs/playbooks/ssl-certs.md
for the process we use to update these certs. We will also want to write an
ansible-playbook which refreshes the ssl certs.

Currently, we just update `/etc/hosts` on machines to point to the correct IP
(i.e. home-assistant.mattjmcnaughton.io SOME_PRIVATE_IP), but in the medium
term, we can explore a different solution.

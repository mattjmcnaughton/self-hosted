# secrets

Store secrets for playbooks in a `secrets.yml` file encrypted via
`ansible-vault`.

## Instructions

https://docs.ansible.com/ansible/latest/user_guide/vault.html

## Using in playbook

- Add `include_vars: secrets.yml` as a task.
- Add `--ask-vault-pass` as arg to `ansible-playbook`.

## Using in role

- Ensure we set `no_log: True` where appropriate.
